resource "aws_api_gateway_rest_api" "email" {
  name        = "Serverless Email API"
  description = "Sends an email"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.email.id
  parent_id   = aws_api_gateway_rest_api.email.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.email.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_deployment" "email_api" {
  rest_api_id = aws_api_gateway_rest_api.email.id

  stage_name = "prod"

  depends_on = [
    "aws_api_gateway_integration.lambda"
  ]
}

resource "aws_api_gateway_domain_name" "email_api" {
  certificate_arn = aws_acm_certificate.certificate.arn
  domain_name     = "mail.${var.root_domain_name}"
}

resource "aws_api_gateway_base_path_mapping" "base_path_mapping" {
  api_id = aws_api_gateway_rest_api.email.id

  domain_name = aws_api_gateway_domain_name.email_api.domain_name
}

# URL to invoke the API
output "api_gateway_url" {
  value = aws_api_gateway_deployment.email_api.invoke_url
}