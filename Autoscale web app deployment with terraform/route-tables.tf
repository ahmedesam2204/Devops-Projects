resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route" "public-route" {
  route_table_id            = aws_route_table.public-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public-01.id
  route_table_id = aws_route_table.public-RT.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public-02.id
  route_table_id = aws_route_table.public-RT.id
}


resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route" "private-route" {
  route_table_id            = aws_route_table.private-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.mynat.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private-01.id
  route_table_id = aws_route_table.private-RT.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private-02.id
  route_table_id = aws_route_table.private-RT.id
}
