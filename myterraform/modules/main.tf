provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region     = "us-east-1"
}
module "mysg" {
  source = "./securitygroup"
  name = "open for all"
  
}
output "sgid" {
  value = "${module.mysg.securitygroupid}"
}
