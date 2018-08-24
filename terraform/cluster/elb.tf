resource "aws_elb" "pub_elb" {
  name = "${var.pub_elb-name}-${var.env}"

  subnets         = ["${var.subnet_zone1}", "${var.subnet_zone2}"]
  security_groups = ["${aws_security_group.pub_elb-name.id}"]
  internal        = true
  instances       = ["${aws_instance.ec2_k8_worker}"]
  #, "${aws_instance.ec2_host_ca_app_ins2.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "tcp"
    lb_port           = 80
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTPS:8080/health/index.jsp"
    #target = "HTTPS:8080"
    interval = 5
  }
}
