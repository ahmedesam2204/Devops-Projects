
resource "aws_eip" "nat-ip" {

}




resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.nat-ip.id
  subnet_id     = aws_subnet.public-01.id

}