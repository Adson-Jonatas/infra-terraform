module "Network" {
  source       = "./module/network"
  project_name = var.project_name
  tags         = local.tag
  region       = data.aws_region.current.name
  cidr         = var.cidr
}