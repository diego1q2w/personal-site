data "aws_route53_zone" "zone" {
  name = "${var.root_domain_name}."
}

resource "aws_route53_record" "cloudfront-record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.root_domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.personal_site_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.personal_site_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Example DNS record using Route53.
# Route53 is not specifically required; any DNS host can be used.
resource "aws_route53_record" "api-gateway-record" {
  name    = aws_api_gateway_domain_name.email_api.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.zone.zone_id

  alias {
    evaluate_target_health = false
    name                   = aws_api_gateway_domain_name.email_api.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.email_api.cloudfront_zone_id
  }
}