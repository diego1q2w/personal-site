variable "bucket" {
  #TODO: Update this bucket name
  default = "diego-nava-site"
}

variable "region" {
  default = "eu-west-1"
}

variable "mime_types" {
  default = {
    htm   = "text/html"
    html  = "text/html"
    css   = "text/css"
    js    = "application/javascript"
    map   = "application/javascript"
    json  = "application/json"
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