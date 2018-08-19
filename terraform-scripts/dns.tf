resource "aws_route53_record" "prd_api_dns_A" {
   zone_id                = "${var.web_hosted_zone_id}"
   name                   = "${var.prod_api-cluster_services-dns-a}"
   type                   = "A"
   alias {
     name                    = "${aws_elb.ps_app_elb.dns_name}"
     zone_id                 = "${aws_elb.ps_app_elb.zone_id}"
     evaluate_target_health  = false
   }
   lifecycle {
    prevent_destroy = false
    ignore_changes = ["*"]
   }
}
resource "aws_route53_record" "prd_api_dns_CNAME" {
   zone_id                = "${var.web_hosted_zone_id}"
   name                   = "${var.prod_api-cluster_services-dns-c}"
   type                   = "CNAME"
   ttl                    = "300"
  records                = ["${var.prod_api-cluster_services-dns-a}.${var.api_dns_tld}"]
}
