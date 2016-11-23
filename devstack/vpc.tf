resource "aws_vpc" "dev_kubernetes" {
	cidr_block = "${var.vpc_cidr}"
	enable_dns_hostnames = true
   tags {
	Name = "${var.vpc_name}"
	Owner = "${var.owner}"
	}

}

####### Keypair ###########

resource "aws_key_pair" "default_keypair" {
	key_name ="${var.default_keypair_name}"
	public_key ="${var.default_keypair_public_key}"
	}



############ Subnet ##############
resource "aws_subnet" "kubernetes" {
	vpc_id = "${aws_vpc.dev_kubernetes.id}"
	cidr_block = "${var.vpc_cidr}"
	availability_zone ="${var.zone}"

	tags {
	Name ="Kubernetes"
	Owner = "${var.owner}"
	}
}


########### Internet Gateway #############

resource "aws_internet_gateway" "gw" {
	vpc_id ="${aws_vpc.dev_kubernetes.id}"
	tags {
	Name = "Dev Kubernetes"
	Owner ="${var.owner}"
	}
}


###### Attach IG Gw Routing ###############
resource "aws_route_table" "kubernetes" {
	vpc_id ="${aws_vpc.dev_kubernetes.id}"
	
	route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.gw.id}"
	}
	tags {
	Name = "Dev Kubernetes"
	Owner = "${var.owner}"
	}
}

resource "aws_route_table_association" "kubernetes" {
	subnet_id ="${aws_subnet.kubernetes.id}"
	route_table_id = "${aws_route_table.kubernetes.id}"
	}


############ Security ######################

resource "aws_security_group" "dev_kubernetes" {
	vpc_id = "${aws_vpc.dev_kubernetes.id}"
	name = "Dev Kubernetes"

#### Allow all outbound	
	egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}

###### Allow ICMP from host IP

	ingress {
	from_port = 8
	to_port = 0
	protocol = "icmp"
	cidr_blocks = ["0.0.0.0/0"]
	}
}

