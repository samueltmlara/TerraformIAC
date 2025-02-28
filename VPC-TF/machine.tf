
resource "aws_key_pair" "keypar" {
  key_name = "aws-key"
  public_key = file("./aws-key.pub")
}


resource "aws_instance" "publicvm" {
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypar.key_name
  subnet_id = aws_subnet.subnetpublic.id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
}

resource "aws_instance" "privatevm" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypar.key_name
  subnet_id = data.terraform_remote_state.vpc.outputs.subnetprivate
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
}

