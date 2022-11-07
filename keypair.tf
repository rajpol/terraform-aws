resource "aws_key_pair" "myseckey" {
  key_name   = lookup(var.awsprops, "keyname")
  public_key = var.keypair
}