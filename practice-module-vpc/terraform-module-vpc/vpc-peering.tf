
resource "aws_vpc_peering_connection" "vpc-p-1" {
   
    count = var.ispeering_needed ? 1 : 0
    vpc_id = aws_vpc.vpc1.id
    peer_vpc_id = data.aws_vpc.default-vpc.id    #peer_owner_id,peer_region use if peer is other region or account
    auto_accept = true
    tags = merge (local.comman_tags, {Name = local.comman_name})
}


resource "aws_route" "rt-req-pcx-1" {
    count = var.ispeering_needed ? 1 : 0
    route_table_id = aws_route_table.pub-rt-1.id
    destination_cidr_block = data.aws_vpc.default-vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc-p-1[0].id
}


resource "aws_route" "rt-resp-pcx-1" {
    count = var.ispeering_needed ? 1 : 0
    route_table_id = data.aws_vpc.default-vpc.main_route_table_id
    destination_cidr_block = aws_vpc.vpc1.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc-p-1[0].id
}