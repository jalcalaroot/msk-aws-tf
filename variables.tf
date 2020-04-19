#ingresar credenciales
variable "access_key" {}
variable "secret_key" {}
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}
variable "cluster_name" {
  type        = "string"
  description = "indicar el nombre del cluster"
}

variable "subnet_1" {
  type        = "string"
  description = "indicar id de la subnet_1"
}

variable "subnet_2" {
  type        = "string"
  description = "indicar id de la subnet_2"
}

variable "subnet_3" {
  type        = "string"
  description = "indicar id de la subnet_3"
}
variable "sg_id" {
  type        = "string"
  description = "indicar id del security group"
}
