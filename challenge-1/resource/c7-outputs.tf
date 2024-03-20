# 1. Output Values - Resource Group
output "rg_name" {
  value = module.resource_group.rg_name
  description = "Name of the resource group created"
  
}

output "storage_id" {
  value = module.storage_account_module.storage_account_id
  description = "Name of the resource group created"
  
}
output "container_name" {
  value = module.container_module.container_name
  description = "Name of the resource group created"
  
}

output "vnet_output" {
  value = module.virtual_network.vnet
  description = "The virtual network created"
  
}

output "subnet_output" {
  value = module.virtual_network.subnet
  description = "The subnet created"
  
}

output "nic_id" {
  value = module.virtual_machine.nic-id
  description = "The network interface created"
}

output "vm_name" {
  value = module.virtual_machine.vm-name
  description = "The virtual machine created"
  
}

output "name_id" {
  value = module.load-balancer.lb-id
  description = "The load balancer created"
}

output "server_name" {
  value = module.database.server_name
  description = "The database server created"
  
}

output "database_name" {
  value = module.database.database_name
  description = "The database created"
}

output "key_vault_name" {
  value = module.key-vault.key-vault
  description = "The key vault created"
  
}