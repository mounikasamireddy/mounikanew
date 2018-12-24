output "securitygroup" {
  value = "${aws_security_group.allow_all.id}"
}
output "networkid" {
  value = "${aws_security_group.allow_all.id}"
}

