resource "aws_ses_email_identity" "email_reciver" {
  email = var.email_reciver
}

resource "aws_ses_email_identity" "email_sender" {
  email = var.email_sender
}