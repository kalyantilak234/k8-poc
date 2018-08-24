variable "region" {
        type = "string"
}


variable "aws_ami_id" {
        type = "string"
}

variable "ec2_k8_master-instance_type" {
        type = "string"
}

variable "subnet_zone1" {
        type = "string"
}

variable "aws_security_key_name" {
        type = "string"
}

variable "env" {
        type = "string"
}


variable "ec2_k8_master-instance_vol_size" {
        type = "string"
}

variable "k8_node_security_group" {
        type = "string"
}

variable "vpc" {
        type = "string"
}



variable "pub_elb-name" {
        type = "string"
}
variable "subnet_zone2" {
        type = "string"
}
variable "k8_elb_security_group" {
        type = "string"
}
