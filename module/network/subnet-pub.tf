resource "aws_subnet" "subnet_pub_1a_business" {
  vpc_id                  = aws_vpc.vpc_business.id
  cidr_block              = cidrsubnet(var.cidr, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-subnet_pub_1a_business"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "assoc_pub_1a_business" {
  subnet_id      = aws_subnet.subnet_pub_1a_business.id
  route_table_id = aws_route_table.route_table_public_business.id
}



resource "aws_subnet" "subnet_pub_1b_business" {
  vpc_id                  = aws_vpc.vpc_business.id
  cidr_block              = cidrsubnet(var.cidr, 8, 2)
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-subnet_pub_1b_business"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "assoc_pub_1b_business" {
  subnet_id      = aws_subnet.subnet_pub_1b_business.id
  route_table_id = aws_route_table.route_table_public_business.id
}
