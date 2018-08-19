resource "aws_elb" "ps_app_elb" {
  name = "${var.ps_app_elb-name}-${var.env}"

  subnets         = ["${var.subnet_zone1}", "${var.subnet_zone2}"]
  security_groups = ["${aws_security_group.ps_app_elb.id}"]
  internal        = true

  tags {
    Name                  = "${replace(var.ec2_host_ps_app-name, "/", ".")}-01"
    servicename           = "${var.ps_app_elb-name}-${var.env}"
    env                   = "${var.env}"
    automation            = "shutdown=exempt:backup=g:ret=7"
  }

  listener {
    instance_port     = 8443
    instance_protocol = "tcp"
    lb_port           = 443
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTPS:8443/pnp/health/index.jsp"
    interval = 5
  }
}
