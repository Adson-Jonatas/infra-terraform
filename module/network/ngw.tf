resource "aws_eip" "eip_1a_business" {
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip_1a"
    }
  )
}

resource "aws_eip" "eip_1b_business" {
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip_1b"
    }
  )
}


resource "aws_nat_gateway" "ngw_1a_business" {
  allocation_id = aws_eip.eip_1a_business.id
  subnet_id     = aws_subnet.subnet_pub_1a_business.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw_1a"
    }
  )
}

resource "aws_nat_gateway" "ngw_1b_business" {
  allocation_id = aws_eip.eip_1b_business.id
  subnet_id     = aws_subnet.subnet_pub_1b_business.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw_1b"
    }
  )
}

resource "aws_route_table" "route_table_private_1a_business" {
  vpc_id = aws_vpc.vpc_business.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_1a_business.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-route_table_private_1a"
    }
  )
}

resource "aws_route_table" "route_table_private_1b_business" {
  vpc_id = aws_vpc.vpc_business.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_1b_business.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-route_table_private_1b"
    }
  )
}