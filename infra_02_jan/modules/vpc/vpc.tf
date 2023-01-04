##########VPC############################

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "main"
  }
}

###########internet gateway################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}
############################################

resource "aws_eip" "nat" {
  vpc = true

  }
}

########### NAT GATEWAY #####################

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = aws_subnet.pubsub.id
  
  tags = {
    Name = "gw NAT"
  }
}
########### PublicSubnet ###################

resource "aws_subnet" "pubsub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.sub_pub_cidr_block
  availability_zone = var.azs
  tags = {
    Name = "Main"
  }
}

########### PrivateSubnet ###################

resource "aws_subnet" "prisub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.sub_pri_cidr_block
  availability_zone = var.azs
  tags = {
    Name = "Main"
  }
 
}

########### Public_RouteTable########################

resource "aws_route_table" "pubroute" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pubsub.id
  route_table_id = aws_route_table.pubroute.id
  
}

########### Private_RouteTable########################
  
  resource "aws_route_table" "priroute" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.nat_destination
    nat_gateway_id = aws_nat_gateway.nat.id
      }
      }

  resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.prisub.id
  route_table_id = aws_route_table.priroute.id
}