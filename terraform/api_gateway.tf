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
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "options_method" {
  rest_api_id   = aws_api_gateway_rest_api.email.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "options_200" {
  rest_api_id = aws_api_gateway_rest_api.email.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = 200

  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
  depends_on = ["aws_api_gateway_method.options_method"]
}

resource "aws_api_gateway_integration" "options_integration" {
  rest_api_id = aws_api_gateway_rest_api.email.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.options_method.http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = "{ statusCode: 200 }"
  }
  depends_on = ["aws_api_gateway_method.options_method"]
}

resource "aws_api_gateway_integration_response" "options_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.email.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = aws_api_gateway_method_response.options_200.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  response_templates = {

  }

  depends_on = ["aws_api_gateway_method_response.options_200"]
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