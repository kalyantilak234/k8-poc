
resource "aws_instance" "ec2_host_aux_app_ins1" {
  count                   = "1"
  iam_instance_profile    = "${var.iam_instance_profile}"
  ami                     = "${var.aws_ami_id}"
  instance_type           = "${var.ec2_host_aux_app-instance_type}"
  subnet_id               = "${var.subnet_zone1}"
  key_name                = "${var.aws_security_key_name}"

  user_data               = "${data.template_file.aux_app1_userdata.rendered}"

  tags {
    Name                  = "${replace(var.ec2_host_aux_app-name, "/", ".")}-01"
    env                   = "${var.env}"
    automation            = "shutdown=exempt:backup=g:ret=7"
    app_cluster_type      = "prd"
    app_type              = "aux"
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = "${var.ec2_host_aux_app_vol_size}"
    encrypted             = "false"
    delete_on_termination = true
  }

  root_block_device {
    delete_on_termination = true
  }

  vpc_security_group_ids  = ["${aws_security_group.aux_server_security_group.id}"]


  # Prevents server from being recreated, for now.
  lifecycle {
    prevent_destroy = false
  }
}

data "template_file" "aux_app1_userdata" {
  template               = "${file("${path.module}/user_data.sh")}"

  vars {
    name                 = "${var.ec2_host_aux_app-name}"
    env                  = "${var.env}"
    jfrog_user_name      = "${var.jfrog_user_name}"
    jfrog_password       = "${var.jfrog_password}"
    jfrog_art_base_url   = "${var.jfrog_art_base_url}"
    chef_tar_file_uri    = "${var.chef_tar_file_uri}"
    secrets_tar_file_uri    = "${var.secrets_tar_file_uri}"
    app_instance_name      = "aux1a"
    app_launching_type   = "manual"
    subnet_zone1 = "${var.subnet_zone1}"
    app_cluster_type     = "prd"
  }
}

resource "aws_instance" "ec2_host_pslm_app_ins1" {
  count                   = "1"
  iam_instance_profile    = "${var.iam_instance_profile}"
  ami                     = "${var.aws_ami_id}"
  instance_type           = "${var.ec2_host_pslm_app-instance_type}"
  subnet_id               = "${var.subnet_zone1}"
  key_name                = "${var.aws_security_key_name}"

 user_data               = "${data.template_file.pslm_app1_userdata.rendered}"

  tags {
    Name                  = "${replace(var.ec2_host_pslm_app-name, "/", ".")}-01"
    env                   = "${var.env}"
    automation            = "shutdown=exempt:backup=g:ret=7"
    app_cluster_type      = "prd"
    app_type              = "lock"
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = "${var.ec2_host_pslm_app_vol_size}"
    encrypted             = "false"
    delete_on_termination = true
  }

  root_block_device {
    delete_on_termination = true
  }

  vpc_security_group_ids  = ["${aws_security_group.pslm_server_security_group.id}"]



  # Prevents server from being recreated, for now.
  lifecycle {
    prevent_destroy = false
  }
}

data "template_file" "pslm_app1_userdata" {
  template               = "${file("${path.module}/user_data.sh")}"

  vars {
    name                 = "${var.ec2_host_pslm_app-name}"
    env                  = "${var.env}"
    jfrog_user_name      = "${var.jfrog_user_name}"
    jfrog_password       = "${var.jfrog_password}"
    jfrog_art_base_url   = "${var.jfrog_art_base_url}"
    chef_tar_file_uri    = "${var.chef_tar_file_uri}"
    secrets_tar_file_uri = "${var.secrets_tar_file_uri}"
    app_instance_name    = "lock1a"
    app_cluster_type     = "prd"
    app_launching_type   = "manual"
    subnet_zone1         = "${var.subnet_zone1}"
  }
}



resource "aws_instance" "ec2_host_pslm_app_ins2" {
  count                   = "1"
  iam_instance_profile    = "${var.iam_instance_profile}"
  ami                     = "${var.aws_ami_id}"
  instance_type           = "${var.ec2_host_pslm_app-instance_type}"
  subnet_id               = "${var.subnet_zone2}"
  key_name                = "${var.aws_security_key_name}"

  user_data               = "${data.template_file.pslm_app2_userdata.rendered}"

  tags {
    Name                  = "${replace(var.ec2_host_pslm_app-name, "/", ".")}-02"
    env                   = "${var.env}"
    automation            = "shutdown=exempt:backup=g:ret=7"
    app_cluster_type      = "prd"
    app_type              = "lock"
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = "${var.ec2_host_pslm_app_vol_size}"
    encrypted             = "false"
    delete_on_termination = true
  }

  root_block_device {
    delete_on_termination = true
  }

  vpc_security_group_ids  = ["${aws_security_group.pslm_server_security_group.id}"]


  # Prevents server from being recreated, for now.
  lifecycle {
    prevent_destroy = false
  }
}

data "template_file" "pslm_app2_userdata" {
  template               = "${file("${path.module}/user_data.sh")}"

  vars {
    name                 = "${var.ec2_host_pslm_app-name}"
    env                  = "${var.env}"
    jfrog_user_name      = "${var.jfrog_user_name}"
    jfrog_password       = "${var.jfrog_password}"
    jfrog_art_base_url   = "${var.jfrog_art_base_url}"
    chef_tar_file_uri    = "${var.chef_tar_file_uri}"
    secrets_tar_file_uri    = "${var.secrets_tar_file_uri}"
    app_instance_name    = "lock1b"
    app_cluster_type     = "prd"
    app_launching_type   = "manual"
    subnet_zone1         = "${var.subnet_zone1}"
  }
}
