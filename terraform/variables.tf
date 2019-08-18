variable "bucket" {
  #TODO: Update this bucket name
  default = "diego1q2w-site"
}

variable "region" {
  default = "us-east-1"
}

# TODO: this has to be confirmed by AWS SES, you'll get an email with a link you'll have to confirm
variable email_sender {
  default = "diego.nava3009@gmail.com"
}

# TODO: this has to be confirmed by AWS SES, you'll get an email with a link you'll have to confirm
variable email_reciver {
  default = "diego.nava77@hotmail.com"
}

variable root_domain_name {
  default = "dnava.co"
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