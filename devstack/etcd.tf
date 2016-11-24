resource "aws_instance" "etcd" {
	count = 3
	ami = "${lookup(var.amis,var.region)}"
	instance_type = "${var.etcd_instance_type}"
	subnet_id = "${aws_subnet.kubernetes.id}"
	private_ip = "${cidrhost(var.vpc_cidr,10 + count.index)}"
	associate_public_ip_address =true
	
	availability_zone ="${var.zone}"
	vpc_security_group_ids = ["${aws_security_group.dev_kubernetes.id}"]
	key_name = "${var.default_keypair_name}"
}
