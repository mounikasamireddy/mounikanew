variable "accesskey" {
  type = "string"
}

variable "secretkey" {
  type = "string"
}

provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region     = "us-east-1"
}
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.mouni.id}"
}
resource "aws_vpc" "mouni" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "vpcsub" {
  count      = 2
  vpc_id     = "${aws_vpc.mouni.id}"
  cidr_block = "${cidrsubnet(aws_vpc.mouni.cidr_block, 8, count.index)}"
}
resource "aws_route_table" "myrt1" {
  vpc_id = "${aws_vpc.mouni.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}  
resource "aws_route_table_association" "mysass" {
  subnet_id      = "${aws_subnet.vpcsub.*.id[0]}"
  route_table_id = "${aws_route_table.myrt1.id}"
}
output "aws_internet_gateway" {
  value = "${aws_internet_gateway.igw.id}"
}

output "vpc_id" {
  value = "${aws_vpc.mouni.id}"
}
output "aws_route_table" {
  value = "${aws_route_table.myrt1.id}"
}

output "all_subnet_ids" {
  value = "${aws_subnet.vpcsub.*.id}"
}

output "subnet_id_0" {
  value = "${aws_subnet.vpcsub.*.id[0]}"
}

output "subnet_id_1" {
  value = "${aws_subnet.vpcsub.*.id[1]}"
}