resource "aws_vpc" "vpc_business" {
  cidr_block = var.cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-VPC"
    }
  )
}