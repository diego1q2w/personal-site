const AWS = require('aws-sdk');

const ses = new AWS.SES();
const RECEIVERS = [process.env.RECEIVER];
const SENDER = process.env.SENDER; // ensure 'sender email' is verified in your Amazon SES
exports.handler = (event, context, callback) => {
    //console.log('Received event:', event);
    sendEmail(event, function (err, data) {
        const response = {
            "isBase64Encoded": false,
            "headers": { 'Content-Type': 'application/json', "Access-Control-Allow-Origin" : "*"},
            "statusCode": 200,
            "body": "{\"result\": \"Success.\"}"
        };
        callback(err, response);
    });
};

function sendEmail (event, done) {
    const data = JSON.parse(event.body);

    const params = {
        Destination: {
            ToAddresses: RECEIVERS
        },
        Message: {
            Body: {
                Text: {
                    Data: 'Name: ' + data.name + '\nEmail: ' + data.email + '\nMessage: ' + data.message,
                    Charset: 'UTF-8'
                }
            },
            Subject: {
                Data: 'Contact Form inquiry: ' + data.name,
                Charset: 'UTF-8'
            }
        },
        Source: SENDER
    };

    ses.sendEmail(params, done);
}