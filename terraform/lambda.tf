locals {
  name = "mail-sender"
  path = "${var.files_directory}/${local.name}.zip"
}

resource "aws_lambda_function" "ses_lambda" {
  function_name    = local.name
  filename         = local.path
  handler          = "${local.name}.handler"
  runtime          = "nodejs10.x"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  role             = aws_iam_role.lambda_exec_role.arn

  environment {
    variables = {
      SENDER   = var.email_sender
      RECEIVER = var.email_reciver
    }
  }

}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda_exec_role"
  assume_role_policy = file("./policies/lambda_assume_role.json")
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = file("./policies/lambda_logging.json")
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_iam_policy" "send_email_reciver" {
  name        = "email_send_reciver"
  path        = "/"
  description = "IAM policy for sending emails"

  policy = data.template_file.send_email_reciver.rendered
}

data "template_file" "send_email_reciver" {
  template = file("./policies/send_email.json")
  vars = {
    email_arn = aws_ses_email_identity.email_reciver.arn
  }
}

resource "aws_iam_role_policy_attachment" "send_email_reciver" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.send_email_reciver.arn
}

resource "aws_iam_policy" "send_email_sender" {
  name        = "send_email_sender"
  path        = "/"
  description = "IAM policy for sending emails"

  policy = data.template_file.send_email_sender.rendered
}

data "template_file" "send_email_sender" {
  template = file("./policies/send_email.json")
  vars = {
    email_arn = aws_ses_email_identity.email_sender.arn
  }
}

resource "aws_iam_role_policy_attachment" "send_email_sender" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.send_email_sender.arn
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_lambda.arn
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_deployment.email_api.execution_arn}/*/*"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.email.id
  resource_id = aws_api_gateway_method.proxy.resource_id
  http_method = aws_api_gateway_method.proxy.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.ses_lambda.invoke_arn
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${var.files_directory}/${local.name}.js"
  output_path = local.path
}