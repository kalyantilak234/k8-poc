resource "aws_autoscaling_group" "ps_autoscaling_group" {
  availability_zones   = "${var.availability_zones}"
  name                 = "${var.ps_server_auto_scaling_group-name}"
  max_size             = "${var.ps_asg_max}"
  min_size             = "${var.ps_asg_min}"
  desired_capacity     = "${var.ps_asg_desired}"
  vpc_zone_identifier  = ["${var.subnet_zone1}", "${var.subnet_zone2}"]
  force_delete         = true
  launch_configuration = "${aws_launch_configuration.ps_launch_configuration.name}"
  load_balancers       = ["${aws_elb.ps_app_elb.name}"]

  vpc_zone_identifier = ["${var.subnet_zone1}", "${var.subnet_zone2}"]
  tags = [
      {
        key                 = "Name"
        value               = "${var.ps_server_auto_scaling_group-name}"
        propagate_at_launch = "true"
      },
      {
        key                 = "env"
        value               = "${var.env}"
        propagate_at_launch = true
      },
      {
        key                 = "app_cluster_type"
        value               = "prd"
        propagate_at_launch = true
      },
      {
        key                 = "app_type"
        value               = "svc"
        propagate_at_launch = true
      }

  ]
}

resource "aws_autoscaling_policy" "ps_server_scale_up_policy" {
    name = "ps-server-scale-up-policy"
    scaling_adjustment = "${var.ps_servef_scale_up_adjustment}"
    adjustment_type = "ChangeInCapacity"
    cooldown = "${var.ps_cooldown_period}"
    autoscaling_group_name = "${aws_autoscaling_group.ps_autoscaling_group.name}"
}

resource "aws_autoscaling_policy" "ps_server_scale_down_policy" {
    name = "ps-server-scale-down-policy"
    scaling_adjustment = "${var.ps_servef_scale_down_adjustment}"
    adjustment_type = "ChangeInCapacity"
    cooldown = "${var.ps_cooldown_period}"
    autoscaling_group_name = "${aws_autoscaling_group.ps_autoscaling_group.name}"
}

resource "aws_cloudwatch_metric_alarm" "ps_cpu_usage_high" {
    alarm_name = "ps-server-cpu-usage-high"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "${var.ps_evaluation_periods}"
    metric_name = "${var.ps_metric_name}"
    namespace = "${var.ps_aws_mertic_namespace}"
    period = "${var.ps_consecutive_periods}"
    statistic = "Average"
    threshold = "${var.ps_high_usage_threshold}"
    alarm_description = "Page server cpu high utilization"
    alarm_actions = [
        "${aws_autoscaling_policy.ps_server_scale_up_policy.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.ps_autoscaling_group.name}"
    }
}

resource "aws_cloudwatch_metric_alarm" "ps_cpu_usage_down" {
    alarm_name = "ps-server-cpu-usage-down"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "${var.ps_evaluation_periods}"
    metric_name = "${var.ps_metric_name}"
    namespace = "AWS/EC2"
    period = "${var.ps_consecutive_periods}"
    statistic = "Average"
    threshold = "${var.ps_low_usage_threshold}"
    alarm_description = "Page server cpu low utilization"
    alarm_actions = [
        "${aws_autoscaling_policy.ps_server_scale_down_policy.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.ps_autoscaling_group.name}"
    }
}

resource "aws_launch_configuration" "ps_launch_configuration" {
  name          = "${var.ps_launch_config_name}"
  image_id      = "${var.aws_ami_id}"
  instance_type = "${var.ec2_host_ps_app-instance_type}"
  key_name                = "${var.aws_security_key_name}"
  user_data               = "${data.template_file.ps_asg_userdata.rendered}"

  iam_instance_profile    = "${var.iam_instance_profile}"
  # Security group
  security_groups = ["${aws_security_group.ps_server_security_group.id}"]

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = "${var.ec2_host_ps_app_vol_size}"
    encrypted             = "false"
    delete_on_termination = false
  }

}


data "template_file" "ps_asg_userdata" {
  template               = "${file("${path.module}/user_data.sh")}"

  vars {
    name                 = "${var.ec2_host_ps_app-name}"
    env                  = "${var.env}"
    jfrog_user_name      = "${var.jfrog_user_name}"
    jfrog_password       = "${var.jfrog_password}"
    jfrog_art_base_url   = "${var.jfrog_art_base_url}"
    chef_tar_file_uri    = "${var.chef_tar_file_uri}"
    secrets_tar_file_uri = "${var.secrets_tar_file_uri}"
    app_instance_name    = "prdsvc"
    app_cluster_type     = "prd"
    count                = "${var.count}"
    app_launching_type   = "auto"
    subnet_zone1 = "${var.subnet_zone1}"
  }
}
