data "aws_route53_zone" "zone" {
  name = "${var.root_domain_name}."
}

resource "aws_route53_record" "cloudformation-record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.root_domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.personal_site_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.personal_site_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}