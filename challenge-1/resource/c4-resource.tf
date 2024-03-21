# Resource-1: Azure Resource Group
module "resource_group" {
  source          = "../module/resource-group"
  resource_groups = var.resource_groups
  environment     = var.environment
}

#Storage Account-1: Azure Storage Account
module "storage_account_module" {
  source = "../module/Storage-Account"
  storage_account = var.storage_account
  environment = var.environment
  network_rules = var.network_rules
  depends_on = [ module.resource_group, module.virtual_network ]

}
#Azure Storage Container
module "container_module" {
  source = "../module/Storage-Container"
  containers = var.containers
  depends_on = [ module.storage_account_module ]
  
}
#Azure Vnet and Subnet
module "virtual_network" {
  source = "../module/virtual-network-subnet"
  vnets = var.vnets
  environment = var.environment
  resource_group_name_vnet = var.resource_group_name_vnet
  depends_on = [ module.resource_group ]
}

#Azure VM
module "virtual_machine" {
  source = "../module/azure-vm"
  vms = var.vms
  environment = var.environment
  key_vault_name = var.key_vault_name
  key_vault_rg = var.key_vault_rg
  nics = var.nics
  availability_set = var.availability_set
  depends_on = [ module.virtual_network ]
}

#Azure Load balancer
module "load-balancer" {
  source = "../module/load-balancer"
  load_balancers = var.load_balancers
  environment = var.environment
  resource_group_name_lb = var.resource_group_name_lb
  depends_on = [ module.virtual_machine ]
}

#Azure Database
module "database" {
  source = "../module/database"
  database = var.database
  server = var.server
  environment = var.environment
  resource_group_name_db = var.resource_group_name_db
  key_vault_name = var.key_vault_name
  depends_on = [ module.resource_group, module.key-vault ]
}

#Azure Key vault
module "key-vault" {
  source = "../module/key-vault"
  key_vault = var.key_vault
  environment = var.environment
  resource_group_name_db = var.resource_group_name_db
  depends_on = [ module.resource_group ]
}

module "nsg" {
  source = "../module/nsg"
  resource_group_name_nsg = var.resource_group_name_nsg
  nsgname = var.nsgname
  custom_rules = var.custom_rules
  environment = var.environment
  
}