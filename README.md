# Personal site

This project was envisioned to be fully serverless outcasting the hassle of building and maintaining a traditional server, and by that, I mean forgetting about, Apache, Docker, Nginx, Load Balancers, SSH, etc. Furthermore, with an incredibly cheap cost. Imagine having a scalable and highly available site with less than a $1, well, believe it or not, this is what this site costs.

This project uses Terraform as cloud orchestrator, which means you can have all your cloud resources as a code, then you don't have to memorize or document all the steps you took to have your site deployed is self-documented, and applying changes is just a matter of running one command, easy peasy.

Everything, the setup, update and deploy will be explained with greater detail in the following lines, so stay put.

## Project Structure
These are the most important files and directories you'll need to be aware of in order to have your site up and running.

    ├── script                - Commands you'll need to run to set up and deploy.
    ├── scss                  - Well, the pre-complied scss files.
    ├── glupfile.js           - Glup configuration, tool used to process the scss files.
    ├── site                  - Here is where your site lives.
    │   └── index.html        - Make sure at least you have and index.html
    ├── terraform             - Infraestructure as a code, Yaaay!!!
    │   ├── policies          - This is where you store the AWS policies
    │   ├── config.tf         - Terrafrom configuration, you'll have to edit this file
    │   ├── variable.tf       - Terrafrom variables, you'll have to edit this file

## Set up

There is a couple of things you'll need to have in place to kick off this project and those are:

* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) - is a tool for building, changing, and versioning infrastructure safely and efficiently.
We are using this tool to manage and orchestrate out AWS cloud resources.
* [NPM](https://www.npmjs.com/get-npm) - makes it easy for JavaScript developers to share and reuse code.
We use this tool to be able to use SCSS which is a CSS preprocessor, this makes significantly easier to style your web page.

Follow the installation instructions for both tools, don't worry it won't take long if you are done you are good to go.

Now, it's time to tell terraform the details of your AWS account so your [environment must be set up](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) to have AWS credentials. This can be easily done using [direnv](https://direnv.net/).:
        
        export AWS_ACCESS_KEY_ID=<your-id>
        export AWS_SECRET_ACCESS_KEY=<your-secret>
        export AWS_DEFAULT_REGION=eu-west-1

(Optional) For multi-aws account setup please use `awscli`.

    // Official AWS tool to work with AWS
    pip3 install awscli --upgrade --user

    // Configure AWS tool to work with new profile (different set of access keys)
    aws configure --profile=otheraccount

    // Terraform & Ansible can understand this env, which simplifies mulit-aws accounts
    export AWS_DEFAULT_PROFILE=otheraccount

Terraform uses a S3 bucket to store the state of your platform, and this has to be unique, this is one of the few manual steps you'll need to do.
Go to the AWS Console and then to S3, create a bucket and replace the one is set in `./terraform/config.tf`. And optionally update the region in case you want to deploy your resources in a different one.
   
Cool! you've got terraform set up, now is time to initialise everything and for that you only have to run:

        ./script/bootstrap  
        
Finally, you'll have to set up another bucket, but this time terraform will do it for you. Is the bucket where your site will land, for that go to the file `./terraform/variables.tf` and replace it with something unique.
# Update

Everything within the `site` folder will land on S3; all this magic happens thanks to the `./script/files`,  this script goes through the whole directory recursively creating an S3 object within terraform.
Run it each time you add a new file or delete one within the `site` directory.

If you'd like to style your project I highly recommend to use SCSS, believe me, you'll save yourself a lot of headaches. Every time  you want to see your changes applied, please run `gulp build`. This command will compile your SCSS files and lie the output into the `site` directory.
For gulp, configuration updates check the `glupfile.js` file.

# Deploy

if you are done and want to see your site a alive just run:

    ./script/deploy
    
This command will look for any changes in your cloud resources, and in your files, terraform will automatically figure out which files have to either upload or delete from your cloud bucket, in other words, will mirror any change within your `site` directory.

If everything goes well, the command prompt you to confirm, if you want to apply the changes, type `yes` and hit enter.

And last but not least, you'll get and output like this:

    Outputs:
    
    url = XXXXXXXX.s3-website-eu-west-1.amazonaws.com

Copy the URL, paste it into your browser and enjoy.
