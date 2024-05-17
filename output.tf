output "name" {
  value = var.project_name
}

output "subnet_pub_1a" {
  value = module.Network.subnet_pub_1a
}


output "subnet_pub_1b" {
  value = module.Network.subnet_pub_1b
}