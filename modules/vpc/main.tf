# create a vpc
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "asim"
  }
}

# create a publicsubnet1
resource "aws_subnet" "demo-subnet1" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.subnet_id1
  availability_zone = "us-east-2a"

  tags = {
    Name = "publicsunet1"
  }
}

# create a publicsubnet2
resource "aws_subnet" "demo-subnet2" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.subnet_id2
  availability_zone = "us-east-2b"

  tags = {
    Name = "publicsubnet2"
  }
}


# create a privatesubnet1
resource "aws_subnet" "demo-privatesubnet1" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.privatesubnet_id1
  availability_zone = "us-east-2a"

  tags = {
    Name = "privatesubnet1"
  }
}
# create a privatesubnet2
resource "aws_subnet" "demo-privatesubnet2" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.privatesubnet_id2
  availability_zone = "us-east-2b"

  tags = {
    Name = "privatesubnet2"
  }
}
# create a privatesubnet3
resource "aws_subnet" "demo-privatesubnet3" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.privatesubnet_id3
  availability_zone = "us-east-2a"

  tags = {
    Name = "privatesubnet3"
  }
}

# create a privatesubnet4
resource "aws_subnet" "demo-privatesubnet4" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.privatesubnet_id4
  availability_zone = "us-east-2b"

  tags = {
    Name = "privatesubnet4"
  }
}

# create Internetgateway

resource "aws_internet_gateway" "demo-Internetgateway" {
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "main"
  }
}
# create route table

resource "aws_route_table" "publicroutetable" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-Internetgateway.id
  }
}

# Subnet association with route table

resource "aws_route_table_association" "demo-aws_route_table_association1" {
  subnet_id      = aws_subnet.demo-subnet1.id
  route_table_id = aws_route_table.publicroutetable.id
}


# Subnet association with route table

resource "aws_route_table_association" "demo-aws_route_table_association2" {
  subnet_id      = aws_subnet.demo-subnet2.id
  route_table_id = aws_route_table.publicroutetable.id
}


#elastic Ip 
resource "aws_eip" "asim_eip" {
  vpc = true

}


#createnatçclear

resource "aws_nat_gateway" "asim_nat" {

  allocation_id = aws_eip.asim_eip.id
  subnet_id     = aws_subnet.demo-subnet1.id

  tags = {
    Name = "asim NAT"
  }
}

# Create Route Table and Add Private Route
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.asim_nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Associate Private Subnet 1 to "Private Route Table"
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.demo-privatesubnet1.id
  route_table_id = aws_route_table.private-route-table.id
}

# Associate Private Subnet 2 to "Private Route Table"
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.demo-privatesubnet2.id
  route_table_id = aws_route_table.private-route-table.id
}

# Associate Private Subnet 3 to "Private Route Table"
resource "aws_route_table_association" "private-subnet-3-route-table-association" {
  subnet_id      = aws_subnet.demo-privatesubnet3.id
  route_table_id = aws_route_table.private-route-table.id
}

# Associate Private Subnet 4 to "Private Route Table"
resource "aws_route_table_association" "private-subnet-4-route-table-association" {
  subnet_id      = aws_subnet.demo-privatesubnet4.id
  route_table_id = aws_route_table.private-route-table.id
}