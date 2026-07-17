resource "aws_vpc" "vpc1"{
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = merge(local.comman_tags,{ Name = local.comman_vpc_name })
    
}

resource "aws_internet_gateway" "IGW1" {
    vpc_id = aws_vpc.vpc1.id
    tags =  merge(local.comman_tags,{ Name = local.comman_igw_name })
}

resource "aws_subnet" "pub-subnet-1" {
    count = length(var.pub_cidr_block)
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.pub_cidr_block[count.index]
    availability_zone = local.az_name[count.index]
    map_public_ip_on_launch = true
    tags = merge(local.comman_tags, {Name = "${local.comman_subnet_name}-public-${count.index}"})
}


resource "aws_subnet" "priv-subnet-1" {
    count = length(var.priv_cidr_block)
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.priv_cidr_block[count.index]
    availability_zone = local.az_name[count.index]
    tags = merge(local.comman_tags, {Name = "${local.comman_subnet_name}-private-${count.index}"})

}


resource "aws_subnet" "data-subnet-1" {
    count = length(var.data_cidr_block)
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.data_cidr_block[count.index]
    availability_zone = local.az_name[count.index]
    tags = merge(local.comman_tags, {Name = "${local.comman_subnet_name}-data-${count.index}"})
}

# public route table 
resource "aws_route_table" "pub-rt-1"{
    vpc_id = aws_vpc.vpc1.id
    tags = merge(local.comman_tags,{Name = "${local.comman_RT_name}-public"})

}
resource "aws_route" "pub-route-1" {
    route_table_id = aws_route_table.pub-rt-1.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW1.id
}
resource "aws_route_table_association" "pub-rt-ass-1" {
    count= length(var.pub_cidr_block)
    subnet_id = aws_subnet.pub-subnet-1[count.index].id
    route_table_id = aws_route_table.pub-rt-1.id
}

# private route table
resource "aws_route_table" "priv-rt-1"{
    vpc_id = aws_vpc.vpc1.id
    tags = merge(local.comman_tags,{Name = "${local.comman_RT_name}-private"})

}

resource "aws_eip" "eipd1" {
    domain = "vpc"
    tags = merge(local.comman_tags,{Name = "${local.comman_name}-eip"})
}

resource "aws_nat_gateway" "nat1" {
    allocation_id = aws_eip.eipd1.id
    subnet_id = aws_subnet.pub-subnet-1[0].id  # pub-subnet-1[ creates list of 2 pub subnets as count used
    depends_on = [aws_internet_gateway.IGW1]   # create igw first then nat bcs using igw only nat talks to net
}
resource "aws_route" "priv-route-1" {
    route_table_id = aws_route_table.priv-rt-1.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
}

resource "aws_route_table_association" "priv-rt-ass-1" {
    count= length(var.priv_cidr_block)
    subnet_id = aws_subnet.priv-subnet-1[count.index].id
    route_table_id = aws_route_table.priv-rt-1.id
}


# data route
resource "aws_route_table" "data-rt-1"{
    vpc_id = aws_vpc.vpc1.id
    tags = merge(local.comman_tags,{Name = "${local.comman_RT_name}-data"})

}
resource "aws_route" "data-route-1" {
    route_table_id = aws_route_table.data-rt-1.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
}

resource "aws_route_table_association" "data-rt-ass-1" {
    count= length(var.data_cidr_block)
    subnet_id = aws_subnet.data-subnet-1[count.index].id
    route_table_id = aws_route_table.data-rt-1.id
}
