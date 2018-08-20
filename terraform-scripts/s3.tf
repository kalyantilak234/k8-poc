resource "aws_s3_bucket" "pnp_s3_bucket" {
  region = "${var.s3_region}"

  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  tags {
    Name        = "${var.pnp_s3_app-name}"
    Environment = "${var.env}"
  }
}
