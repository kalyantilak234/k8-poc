resource "aws_security_group" "ps_server_security_group" {
  name                 = "${replace(var.ps_app-cluster_name, "/", ".")}-sg-${var.env}"
  description          = "The default security group for ${var.ps_app-cluster_name}-sg."
  vpc_id               = "${var.vpc}"
  tags {
    servicename        = "${var.ps_app-cluster_service_name}"
    env                = "${var.env}"
  }
}

resource "aws_security_group_rule" "ps_server_security_group_ingress" {
  count                   = "${var.ps_server-ingress_count}"
  type                    = "ingress"
  from_port               = "${lookup(var.ps_server-ingress_ports, count.index)}"
  to_port                 = "${lookup(var.ps_server-ingress_ports, count.index)}"
  protocol                = "${lookup(var.ps_server-ingress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.ps_server-ingress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.ps_server_security_group.id}"
}

resource "aws_security_group_rule" "ps_server_security_group_egress" {
  count                   = "${var.ps_server-egress_count}"
  type                    = "egress"
  from_port               = "${lookup(var.ps_server-egress_ports, count.index)}"
  to_port                 = "${lookup(var.ps_server-egress_ports, count.index)}"
  protocol                = "${lookup(var.ps_server-egress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.ps_server-egress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.ps_server_security_group.id}"
}

resource "aws_security_group_rule" "ps_server_security_group_ingress_8443" {
  security_group_id = "${aws_security_group.ps_server_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = "8443"
  to_port = "8443"
  source_security_group_id = "${aws_security_group.ps_app_elb.id}"
  # description = "To access stg services on HTTPS. Allow inbound from stg-svc-elb."
}

resource "aws_security_group" "pslm_server_security_group" {
  name                 = "${replace(var.pslm_app-cluster_name, "/", ".")}-sg"
  description          = "The default security group for ${var.pslm_app-cluster_name}-sg."
  vpc_id               = "${var.vpc}"
  tags {
    servicename        = "${var.pslm_app-cluster_service_name}"
    env                = "${var.env}"
  }
}

resource "aws_security_group_rule" "pslm_server_security_group_ingress" {
  count                   = "${var.pslm_server-ingress_count}"
  type                    = "ingress"
  from_port               = "${lookup(var.pslm_server-ingress_ports, count.index)}"
  to_port                 = "${lookup(var.pslm_server-ingress_ports, count.index)}"
  protocol                = "${lookup(var.pslm_server-ingress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.pslm_server-ingress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.pslm_server_security_group.id}"
}

resource "aws_security_group_rule" "pslm_server_security_group_egress" {
  count                   = "${var.pslm_server-egress_count}"
  type                    = "egress"
  from_port               = "${lookup(var.pslm_server-egress_ports, count.index)}"
  to_port                 = "${lookup(var.pslm_server-egress_ports, count.index)}"
  protocol                = "${lookup(var.pslm_server-egress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.pslm_server-egress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.pslm_server_security_group.id}"
}

resource "aws_security_group" "aux_server_security_group" {
  name                 = "${replace(var.aux_app-cluster_name, "/", ".")}-sg"
  description          = "The default security group for ${var.pslm_app-cluster_name}-sg."
  vpc_id               = "${var.vpc}"
  tags {
    servicename        = "${var.pslm_app-cluster_service_name}"
    env                = "${var.env}"
  }
}

resource "aws_security_group_rule" "aux_server_security_group_ingress" {
  count                   = "${var.aux_server-ingress_count}"
  type                    = "ingress"
  from_port               = "${lookup(var.aux_server-ingress_ports, count.index)}"
  to_port                 = "${lookup(var.aux_server-ingress_ports, count.index)}"
  protocol                = "${lookup(var.aux_server-ingress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.aux_server-ingress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.aux_server_security_group.id}"
}

resource "aws_security_group_rule" "aux_server_security_group_egress" {
  count                   = "${var.aux_server-egress_count}"
  type                    = "egress"
  from_port               = "${lookup(var.aux_server-egress_ports, count.index)}"
  to_port                 = "${lookup(var.aux_server-egress_ports, count.index)}"
  protocol                = "${lookup(var.aux_server-egress_port_types, count.index)}"
  cidr_blocks             = ["${lookup(var.aux_server-egress_cidrs, count.index)}"]
  security_group_id       = "${aws_security_group.aux_server_security_group.id}"
}


# Security group for the ELB so it is accessible via the web
resource "aws_security_group" "ps_app_elb" {
  name        = "${var.ps_app_elb-name}-sg-${var.env}"
  description = "Page servers elb for business users"
  vpc_id      = "${var.vpc}"

  tags {
    servicename        = "${var.ps_app_elb-name}"
    env                = "${var.env}"
  }
}

resource "aws_security_group_rule" "ps_app_elb_ingress" {
    count                   = "${var.ps_app_elb-ingress_count}"
    type                    = "ingress"
    from_port               = "${lookup(var.ps_app_elb-ingress_ports, count.index)}"
    to_port                 = "${lookup(var.ps_app_elb-ingress_ports, count.index)}"
    protocol                = "${lookup(var.ps_app_elb-ingress_port_types, count.index)}"
    cidr_blocks             = ["${lookup(var.ps_app_elb-ingress_cidrs, count.index)}"]
    security_group_id       = "${aws_security_group.ps_app_elb.id}"
  }
  resource "aws_security_group_rule" "ps_app_elb_egress_8443" {
    security_group_id = "${aws_security_group.ps_app_elb.id}"
    type = "egress"
    protocol = "tcp"
    from_port = "8443"
    to_port = "8443"
    source_security_group_id = "${aws_security_group.ps_server_security_group.id}"
    # description = "To access stg services on HTTPS. Allow inbound from stg-svc-elb."
      }
