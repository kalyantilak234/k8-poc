variable "cloudwatch_topic" {
	type = "string"
}

variable "manage_cloudwatch" {
	type = "string"
}

variable "region" {
	type = "string"
}

variable "api_dns_tld" {
	type = "string"
}

variable "secrets_tar_file_uri" {
	type = "string"
}

variable "iam_instance_profile" {
		type = "string"
}

variable "web_hosted_zone_id" {
		type = "string"
}

variable "prod_api-cluster_services-dns-a" {
		type = "string"
}

variable "prod_api-cluster_services-dns-c" {
		type = "string"
}

variable "env" {
	type = "string"
}


variable "vpc" {
	type = "string"
}

variable "subnet_zone1" {
	type = "string"
}

variable "subnet_zone2" {
	type = "string"
}

variable "aws_security_key_name" {
	type = "string"
}
variable "aws_ami_id" {
	type = "string"
}

variable "count" {
	type = "string"
}
variable "ec2_host_ps_app-instance_type" {
	type = "string"
}

#variable "ec2_host_ps_app1-ip" {
#	type = "string"
#}

#variable "ec2_host_ps_app2-ip" {
#	type = "string"
#}

#variable "ec2_host_ps_app3-ip" {
#	type = "string"
#}

#variable "ec2_host_ps_app4-ip" {
#	type = "string"
#}

variable "ec2_host_ps_app-name" {
	type = "string"
}

variable "ec2_host_ps_app_vol_size" {
	type = "string"
}

variable "ps_server-egress_count" {
	type = "string"
}

variable "ps_app-cluster_name" {
	type = "string"
}

variable "ps_server-ingress_count" {
	type = "string"
}

variable "ps_server-ingress_cidrs" {
	type ="map"
	default = {}
}

variable "ps_server-ingress_ports" {
	type = "map"
	default = {}
}

variable "ps_server-ingress_port_types" {
	type = "map"
	default = {}
}

variable "ps_server-egress_cidrs" {
	type ="map"
	default = {}
}

variable "ps_server-egress_ports" {
	type = "map"
	default = {}
}

variable "ps_server-egress_port_types" {
	type = "map"
	default = {}
}

variable "ps_app-cluster_service_name" {
	type = "string"
}

variable "ps_app_elb-name" {
	type = "string"
}
variable "ps_app_elb-ingress_count" {
	type = "string"
}
variable "ps_app_elb-ingress_ports" {
	type = "map"
	default = {}
}

variable "ps_app_elb-ingress_port_types" {
	type = "map"
	default = {}
}

variable "ps_app_elb-ingress_cidrs" {
	type = "map"
	default = {}
}
variable "vpc_main_route_table_id" {
	type = "string"
}

variable "ec2_host_pslm_app-instance_type" {
	type = "string"
}

variable "ec2_host_pslm_app-name" {
	type = "string"
}

variable "ec2_host_pslm_app_vol_size" {
	type = "string"
}

variable "pslm_app-cluster_name" {
	type = "string"
}

variable "pslm_app-cluster_service_name" {
	type = "string"
}

variable "pslm_server-ingress_count" {
	type = "string"
}

variable "pslm_server-ingress_ports" {
	type = "map"
	default = {}
}

variable "pslm_server-ingress_port_types" {
	type = "map"
	default = {}
}

variable "pslm_server-ingress_cidrs" {
	type = "map"
	default = {}
}

variable "pslm_server-egress_count" {
	type = "string"
}

variable "pslm_server-egress_ports" {
	type = "map"
	default = {}
}

variable "pslm_server-egress_port_types" {
	type = "map"
	default = {}
}

variable "pslm_server-egress_cidrs" {
	type = "map"
	default = {}
}

variable "ec2_host_aux_app-name" {
	type = "string"
}

variable "ec2_host_aux_app-instance_type" {
	type = "string"
}

variable "ec2_host_aux_app_vol_size" {
	type = "string"
}

variable "aux_app-cluster_name" {
	type = "string"
}

variable "aux_app-cluster_service_name" {
	type = "string"
}

variable "aux_server-ingress_count" {
	type = "string"
}

variable "aux_server-ingress_ports" {
	type = "map"
	default = {}
}

variable "aux_server-ingress_port_types" {
	type = "map"
	default = {}
}

variable "aux_server-ingress_cidrs" {
	type = "map"
	default = {}
}

variable "aux_server-egress_count" {
	type = "string"
}

variable "aux_server-egress_ports" {
	type = "map"
	default = {}
}

variable "aux_server-egress_port_types" {
	type = "map"
	default = {}

}

variable "aux_server-egress_cidrs" {
	type = "map"
	default = {}
}

variable "ps_launch_config_name" {
	type = "string"
}

variable "ps_server_auto_scaling_group-name" {
	type = "string"
}

variable "ps_asg_min" {
	type = "string"
}
variable "ps_asg_max" {
	type = "string"
}

variable "ps_servef_scale_up_adjustment" {
	type = "string"
}

variable "ps_servef_scale_down_adjustment" {
	type = "string"
}

variable "ps_cooldown_period" {
	type = "string"
}

variable "ps_evaluation_periods" {
	type = "string"
}

variable "ps_metric_name" {
	type = "string"
}

variable "ps_aws_mertic_namespace" {
	type = "string"
}

variable "ps_high_usage_threshold" {
	type = "string"
}

variable "ps_low_usage_threshold" {
	type = "string"
}

variable "ps_consecutive_periods" {
	type = "string"
}

variable "ps_asg_desired" {
	type = "string"
}

variable "availability_zones" {
	type = "list"
	default = []
}

variable "services_hosted_zone_id" {
	type = "string"
}

variable "prod_api-cluster_services-dns" {
	type = "string"
}

variable "prod_api_dns_tld" {
	type = "string"
}

variable "jfrog_user_name" {
	type = "string"
}

variable "jfrog_password" {
	type = "string"
}

variable "jfrog_art_base_url" {
	type = "string"
}

variable "chef_tar_file_uri" {
	type = "string"
}
