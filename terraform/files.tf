# This file is generated by ./script/files.
# Any changes WILL be overwritten!

resource "aws_s3_bucket_object" "file_0" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/css/color.css"
  source       = "../site/assets/css/color.css"
  content_type = lookup(var.mime_types, "css")
  etag         = filemd5("../site/assets/css/color.css")
}

resource "aws_s3_bucket_object" "file_1" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/css/main.css"
  source       = "../site/assets/css/main.css"
  content_type = lookup(var.mime_types, "css")
  etag         = filemd5("../site/assets/css/main.css")
}

resource "aws_s3_bucket_object" "file_2" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/css/monochrome.css"
  source       = "../site/assets/css/monochrome.css"
  content_type = lookup(var.mime_types, "css")
  etag         = filemd5("../site/assets/css/monochrome.css")
}

resource "aws_s3_bucket_object" "file_3" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/FontAwesome.otf"
  source       = "../site/assets/fonts/FontAwesome.otf"
  content_type = lookup(var.mime_types, "otf")
  etag         = filemd5("../site/assets/fonts/FontAwesome.otf")
}

resource "aws_s3_bucket_object" "file_4" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/fontawesome-webfont.eot"
  source       = "../site/assets/fonts/fontawesome-webfont.eot"
  content_type = lookup(var.mime_types, "eot")
  etag         = filemd5("../site/assets/fonts/fontawesome-webfont.eot")
}

resource "aws_s3_bucket_object" "file_5" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/fontawesome-webfont.svg"
  source       = "../site/assets/fonts/fontawesome-webfont.svg"
  content_type = lookup(var.mime_types, "svg")
  etag         = filemd5("../site/assets/fonts/fontawesome-webfont.svg")
}

resource "aws_s3_bucket_object" "file_6" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/fontawesome-webfont.ttf"
  source       = "../site/assets/fonts/fontawesome-webfont.ttf"
  content_type = lookup(var.mime_types, "ttf")
  etag         = filemd5("../site/assets/fonts/fontawesome-webfont.ttf")
}

resource "aws_s3_bucket_object" "file_7" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/fontawesome-webfont.woff"
  source       = "../site/assets/fonts/fontawesome-webfont.woff"
  content_type = lookup(var.mime_types, "woff")
  etag         = filemd5("../site/assets/fonts/fontawesome-webfont.woff")
}

resource "aws_s3_bucket_object" "file_8" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/fonts/fontawesome-webfont.woff2"
  source       = "../site/assets/fonts/fontawesome-webfont.woff2"
  content_type = lookup(var.mime_types, "woff2")
  etag         = filemd5("../site/assets/fonts/fontawesome-webfont.woff2")
}

resource "aws_s3_bucket_object" "file_9" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_bg_header.jpg"
  source       = "../site/assets/img/img_bg_header.jpg"
  content_type = lookup(var.mime_types, "jpg")
  etag         = filemd5("../site/assets/img/img_bg_header.jpg")
}

resource "aws_s3_bucket_object" "file_10" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_bg_main.jpg"
  source       = "../site/assets/img/img_bg_main.jpg"
  content_type = lookup(var.mime_types, "jpg")
  etag         = filemd5("../site/assets/img/img_bg_main.jpg")
}

resource "aws_s3_bucket_object" "file_11" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_blog_1.png"
  source       = "../site/assets/img/img_blog_1.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_blog_1.png")
}

resource "aws_s3_bucket_object" "file_12" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_blog_2.png"
  source       = "../site/assets/img/img_blog_2.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_blog_2.png")
}

resource "aws_s3_bucket_object" "file_13" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_blog_3.png"
  source       = "../site/assets/img/img_blog_3.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_blog_3.png")
}

resource "aws_s3_bucket_object" "file_14" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_btn_icon.png"
  source       = "../site/assets/img/img_btn_icon.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_btn_icon.png")
}

resource "aws_s3_bucket_object" "file_15" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_1.png"
  source       = "../site/assets/img/img_project_1.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_1.png")
}

resource "aws_s3_bucket_object" "file_16" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_1_mono.png"
  source       = "../site/assets/img/img_project_1_mono.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_1_mono.png")
}

resource "aws_s3_bucket_object" "file_17" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_2.png"
  source       = "../site/assets/img/img_project_2.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_2.png")
}

resource "aws_s3_bucket_object" "file_18" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_2_mono.png"
  source       = "../site/assets/img/img_project_2_mono.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_2_mono.png")
}

resource "aws_s3_bucket_object" "file_19" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_3.png"
  source       = "../site/assets/img/img_project_3.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_3.png")
}

resource "aws_s3_bucket_object" "file_20" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/img_project_3_mono.png"
  source       = "../site/assets/img/img_project_3_mono.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/img_project_3_mono.png")
}

resource "aws_s3_bucket_object" "file_21" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/img/photo.png"
  source       = "../site/assets/img/photo.png"
  content_type = lookup(var.mime_types, "png")
  etag         = filemd5("../site/assets/img/photo.png")
}

resource "aws_s3_bucket_object" "file_22" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/bootstrap.min.js"
  source       = "../site/assets/js/bootstrap.min.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/bootstrap.min.js")
}

resource "aws_s3_bucket_object" "file_23" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/contacts.js"
  source       = "../site/assets/js/contacts.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/contacts.js")
}

resource "aws_s3_bucket_object" "file_24" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/jquery-2.2.4.min.js"
  source       = "../site/assets/js/jquery-2.2.4.min.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/jquery-2.2.4.min.js")
}

resource "aws_s3_bucket_object" "file_25" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/jquery.waypoints.js"
  source       = "../site/assets/js/jquery.waypoints.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/jquery.waypoints.js")
}

resource "aws_s3_bucket_object" "file_26" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/mbclicker.min.js"
  source       = "../site/assets/js/mbclicker.min.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/mbclicker.min.js")
}

resource "aws_s3_bucket_object" "file_27" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/menu.js"
  source       = "../site/assets/js/menu.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/menu.js")
}

resource "aws_s3_bucket_object" "file_28" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/mobile-menu.js"
  source       = "../site/assets/js/mobile-menu.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/mobile-menu.js")
}

resource "aws_s3_bucket_object" "file_29" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/popper.min.js"
  source       = "../site/assets/js/popper.min.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/popper.min.js")
}

resource "aws_s3_bucket_object" "file_30" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/portfolio-filter.js"
  source       = "../site/assets/js/portfolio-filter.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/portfolio-filter.js")
}

resource "aws_s3_bucket_object" "file_31" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/progress-list.js"
  source       = "../site/assets/js/progress-list.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/progress-list.js")
}

resource "aws_s3_bucket_object" "file_32" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/section.js"
  source       = "../site/assets/js/section.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/section.js")
}

resource "aws_s3_bucket_object" "file_33" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/site-btn.js"
  source       = "../site/assets/js/site-btn.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/site-btn.js")
}

resource "aws_s3_bucket_object" "file_34" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/slider-carousel.js"
  source       = "../site/assets/js/slider-carousel.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/slider-carousel.js")
}

resource "aws_s3_bucket_object" "file_35" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/assets/js/style-switcher.js"
  source       = "../site/assets/js/style-switcher.js"
  content_type = lookup(var.mime_types, "js")
  etag         = filemd5("../site/assets/js/style-switcher.js")
}

resource "aws_s3_bucket_object" "file_36" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/blog.html"
  source       = "../site/blog.html"
  content_type = lookup(var.mime_types, "html")
  etag         = filemd5("../site/blog.html")
}

resource "aws_s3_bucket_object" "file_37" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "/index.html"
  source       = "../site/index.html"
  content_type = lookup(var.mime_types, "html")
  etag         = filemd5("../site/index.html")
}