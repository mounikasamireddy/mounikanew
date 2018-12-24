variable "accesskey" {
  default = "string"
}

variable "secretkey" {
  default = "string"
}



provider "aws" {
    access_key = "${var.accesskey}"
    secret_key ="${var.secretkey}"
    region = "us-east-1"
  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.10.0.0/16"  
}

resource "aws_subnet" "vpcsub" {
  count      = 2
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.myvpc.cidr_block, 8, count.index)}"
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = "${aws_vpc.myvpc.id}"
}

resource "aws_route_table" "mypublicrt" {
    vpc_id = "${aws_vpc.myvpc.id}"

    route {
        gateway_id = "${aws_internet_gateway.myigw.id}"
        cidr_block = "0.0.0.0/0"
    }
}

resource "type" "name" {
  
}



