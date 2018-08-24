resource "aws_instance" "ec2_k8_worker" {
  count                   = "1"
  ami                     = "${var.aws_ami_id}"
  instance_type           = "${var.ec2_k8_master-instance_type}"
  subnet_id               = "${var.subnet_zone1}"
  key_name                = "${var.aws_security_key_name}"

 user_data = "${data.template_file.k8-worker-user_data.rendered}"

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    #volume_size           = "${var.ec2_host_aux_app_vol_size}"
    volume_size           = "${var.ec2_k8_master-instance_vol_size}"
    encrypted             = "false"
    delete_on_termination = true
  }

  root_block_device {
    delete_on_termination = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

data "template_file" "k8-worker-user_data" {
template               = "${file("${path.module}/user-data.sh")}"
}
#  template               = "${file("${path.module}/user_data.sh")}"

#  vars {
#    #name                 = "${var.ec2_host_aux_app-name}"
#    env                  = "${var.env}"
#    subnet_zone1 = "${var.subnet_zone1}"
#    app_type     = "worker"
#  }
#}
