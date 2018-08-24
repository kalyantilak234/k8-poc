resource "aws_security_group" "k8_worker_security_group" {
  name                 = "${var.k8_node_security_group}"
  description          = "The default security group for k8 worker}"
  vpc_id               = "${var.vpc}"
  tags {
    env                = "${var.env}"
  }
}

resource "aws_security_group" "pub_elb-name" {
  name                 = "${var.k8_elb_security_group}"
  description          = "The default security group for k8 worker}"
  vpc_id               = "${var.vpc}"
  tags {
    env                = "${var.env}"
  }
}
