variable "bucket" {
  #TODO: Update this bucket name
  default = "diego-nava-site"
}

variable "region" {
  default = "eu-west-1"
}

# TODO: this has to be confirmed by AWS SES, you'll get an email with a link you'll have to confirm
variable email_sender {
  default = "email1@gmail.com"
}

# TODO: this has to be confirmed by AWS SES, you'll get an email with a link you'll have to confirm
variable email_reciver {
  default = "email2@gmail.com"
}

variable files_directory {
  default = "./files"
}

variable "mime_types" {
  default = {
    htm   = "text/html"
    html  = "text/html"
    css   = "text/css"
    js    = "application/javascript"
    map   = "application/javascript"
    json  = "application/json"
    pdf   = "application/pdf"
    eot   = "application/vnd.ms-fontobject"
    woff2 = "font/woff2"
    woff  = "font/woff"
    ttf   = "font/ttf"
    otf   = "font/opentype"
    png   = "image/png"
    jpeg  = "image/jpeg"
    jpg   = "image/jpeg"
    svg   = "image/svg"
  }
}