resource "aws_subnet" "public-01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-subnet-1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch= "true"
}

resource "aws_subnet" "public-02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-subnet-2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch= "true"
}

resource "aws_subnet" "private-01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private-subnet-1
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private-02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private-subnet-2
  availability_zone = "us-east-1b"
}
