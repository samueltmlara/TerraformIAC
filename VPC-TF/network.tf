resource "aws_vpc" "terraformvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnetpublic" {
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-public"
  }
}

resource "aws_subnet" "subnetprivate" {
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-private"
  }

}

resource "aws_internet_gateway" "meuigw" {
  vpc_id = aws_vpc.terraformvpc.id

  tags = {
    Name = "meuigw"
  }

}

resource "aws_route_table" "rota-publica" {
  vpc_id = aws_vpc.terraformvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.meuigw.id
  }

}

resource "aws_route_table_association" "rtapublic" {
  subnet_id      = aws_subnet.subnetpublic.id
  route_table_id = aws_route_table.rota-publica.id
}

resource "aws_nat_gateway" "meunat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.subnetprivate.id
}


resource "aws_route_table" "rota-privada" {
  vpc_id = aws_vpc.terraformvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.meunat.id
  }
}

resource "aws_route_table_association" "rtaprivate" {
  subnet_id = aws_subnet.subnetprivate.id
  route_table_id = aws_route_table.rota-privada.id
  
}

resource "aws_security_group" "Terraform_SG" {
  name        = "permitir"
  description = "Permitir SSH, Http e SG inbound traffic"
  vpc_id      = aws_vpc.terraformvpc.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-terraform"
  }
}