resource "aws_vpc_peering_connection" "vpc-peer1" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = data.aws_vpc.default.id
  auto_accept = true
  tags        = merge(local.common_tags, { Name = "${local.common_name}-peering" })
}

#add route to peer vpc  in pub rt
resource "aws_route" "RT-pub1-route-req" {
  route_table_id            = aws_route_table.RT-pub1.id            #vpc-publicrt
  destination_cidr_block    = data.aws_vpc.default.cidr_block       #<peer-vpc-cidr>
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peer1.id    #pcx-<id>
}

#add route to  vpc  in pub rt of peer vpc
resource "aws_route" "RT-pub1-route-res" {
  route_table_id            = data.aws_vpc.default.main_route_table_id      #peervpc-publicrt
  destination_cidr_block    = aws_vpc.vpc1.cidr_block           # 10.0.0.0/16
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peer1.id       #pcx-<id>
}