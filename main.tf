resource "aws_kms_key" "msk" {
description = "msk"
}


resource "aws_msk_cluster" "msk" {
cluster_name = "${var.cluster_name}"
kafka_version = "2.4.1"
number_of_broker_nodes = 3
broker_node_group_info {
instance_type = "kafka.m5.large"
client_subnets = [
"${var.subnet_1}",
"${var.subnet_2}",
"${var.subnet_3}",
]
ebs_volume_size = 50
security_groups = ["${var.sg_id}"]
}

encryption_info {
encryption_at_rest_kms_key_arn = "${aws_kms_key.msk.arn}"
encryption_in_transit = [{client_broker="TLS_PLAINTEXT"}]
}
tags = {
Name = "${var.cluster_name}"
}
}

resource "aws_msk_configuration" "msk" {
kafka_versions = ["2.4.1"]
name = "sample"
server_properties = <<PROPERTIES
auto.create.topics.enable = true
delete.topic.enable = true
PROPERTIES
}
