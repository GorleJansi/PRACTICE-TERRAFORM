# create vpc
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.common_tags, { Name = "${local.common_name}-VPC" })
}

#create igw
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags   = merge(local.common_tags, { Name = "${local.common_name}-IGW" })
}

#create public subnets
resource "aws_subnet" "pub-subnet1" {
  count                   = length(var.pub_cidr)
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.pub_cidr[count.index]
  availability_zone       = local.az[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.common_tags, { Name = "${local.common_name}-public-${local.az[count.index]}" })
}

#create private subnets
resource "aws_subnet" "priv-subnet1" {
  count             = length(var.priv_cidr)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.priv_cidr[count.index]
  availability_zone = local.az[count.index]
  tags              = merge(local.common_tags, { Name = "${local.common_name}-private-${local.az[count.index]}" })
}

#create Route table for public subnet
resource "aws_route_table" "RT-pub1" {
  vpc_id = aws_vpc.vpc1.id
  tags   = merge(local.common_tags, { Name = "${local.common_name}-PUBLIC-RT" })
}

#create Route table for private subnet
resource "aws_route_table" "RT-priv1" {
  vpc_id = aws_vpc.vpc1.id
  tags   = merge(local.common_tags, { Name = "${local.common_name}-PRIVATE-RT" })
}

#create elatic ip for nat
resource "aws_eip" "eip1" {
  domain = "vpc"
  tags   = merge(local.common_tags, { Name = "${local.common_name}-EIP" })
}

#create nat place in subnetid,attach eip
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.pub-subnet1[0].id
  tags          = merge(local.common_tags, { Name = "${local.common_name}-NAT" })
}

#add route to IGW in public rt 
resource "aws_route" "RT-pub1-route" {
  route_table_id         = aws_route_table.RT-pub1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw1.id
}

#add route to NAT in private rt
resource "aws_route" "RT-priv1-route" {
  route_table_id         = aws_route_table.RT-priv1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat1.id
}

#associate public rt to public subnet
resource "aws_route_table_association" "RT-ass-pub" {
  count          = length(var.pub_cidr)
  route_table_id = aws_route_table.RT-pub1.id
  subnet_id      = aws_subnet.pub-subnet1[count.index].id
}

#associate private rt to private subnet
resource "aws_route_table_association" "RT-ass-priv" {
  count          = length(var.priv_cidr)
  route_table_id = aws_route_table.RT-priv1.id
  subnet_id      = aws_subnet.priv-subnet1[count.index].id
}