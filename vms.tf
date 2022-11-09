resource "aws_instance" "project-iac" {
  count = 3
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = "${aws_subnet.public_subnet1.id}"
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  #associate_public_ip_address = true
  key_name = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.public_security_group1.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp2"
  }
  tags = {
    Name ="SERVER-${count.index+1}"
    OS = "UBUNTU"
  }

  depends_on = [ aws_security_group.public_security_group1 ]
}


# output "ec2instance" {
#   value = [aws_instance.project-iac[count.index]].public_ip
# }

output "instance_ips" {
  value = "aws_instance.project-iac.*.public_ip"
}
