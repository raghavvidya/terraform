variable control_cidr {
	description = "CIDR for test inbound"
	default = "0.0.0.0/0"
	}

variable vpc_name {
	description = "Name of the VPC"
	default = "Dev_kubernetes"
	}
variable vpc_owner {
	default = "Kubernetes - Dev"
	}

variable region {
	default = "eu-central-1"
	}
variable owner {
	default = "Raghavendra"
	}

variable zone {
	default = "eu-central-1a"
	}


variable vpc_cidr {
	default = "10.43.0.0/16"
	}

variable default_keypair_public_key {
	description = "Public Key of the default keypair"
	#default =""
	}


variable default_keypair_name {
	description = "Name of default keypair used for all nodes"
	default = "dev_kube"
}

variable amis {
	description = "Default AMIs"
	type = "map"
	default = {
	eu-central-1 = "ami-8504fdea"
	eu-west-1 = "ami-0d77397e"
	}
	
}
variable default_instance_user {
	default = "ubuntu"
	}

variable etcd_instance_type {
	default = "t2.micro"
	}


