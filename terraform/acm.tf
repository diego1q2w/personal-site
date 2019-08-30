resource "aws_acm_certificate" "certificate" {
  // We want a wildcard cert so we can host subdomains later.
  domain_name       = "*.${var.root_domain_name}"
  validation_method = "DNS"

  // We also want the cert to be valid for the root domain
  subject_alternative_names = [var.root_domain_name]
}
