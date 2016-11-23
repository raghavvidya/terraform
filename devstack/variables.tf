variable control_cidr {
	description = "CIDR for test inbound"
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
	default ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/C1ghx14OGN6FSDDmXJ3K8L5nU83x0YP8WZ51O9YBbevhd2GVDT7eBxzsBbbR1nd4KyAckggEe/0jbI+mU+26KtZZpTtNqTK9TlEMkn7Il6ja7RovgJPFKDlVt0UE1feDbPviBoAGIL0CceHWQlYYw+klx1fex1HFCxVkUEDJw+iAHooDJ0mX8g/jdMq8RcZVl5vcEjGXhcsb6kth6flwv76CtptkYaeMQur0Syk6zs1X5+ajQZsPdE3e5c4kUityUId+3KSQZsjFZZ83QtKGvMzJ8ILTOLYHxIuLx7wg62LD4ZoAKOGp0VKvAjyUnVfJaYYAXA98BPIA8G73LPoV imported-openssh-key"
	}


variable default_keypair_name {
	description = "Name of default keypair used for all nodes"
	default = "dev_kube"
}

