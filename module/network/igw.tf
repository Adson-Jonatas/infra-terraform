resource "aws_internet_gateway" "igw_business" {
  vpc_id = aws_vpc.vpc_business.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_internet_gateway"
    }
  )
}


resource "aws_route_table" "route_table_public_business" {
  vpc_id = aws_vpc.vpc_business.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_business.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_route_table_public"
    }
  )
}
