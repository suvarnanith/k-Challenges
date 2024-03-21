# Input Variables
variable "resource_groups" {
  description = "The name of the resource group in which the resources will be created"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "environment" {
  description = "The environment in which the resources will be created"
  type        = string
}

variable "storage_account" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        account_tier = string
        account_replication_type = string
        access_tier = string
        min_tls_version = string
        account_kind = string
        is_hns_enabled = string
        service_vnet_name = string
        service_subnet_name = string
    }))
  
}

variable "containers"{
    type = map(object({
        name = string
        storage_account_name = string
        resource_group_name = string
        container_access_type = string
    }))
    description = "The fileshare to be created in the storage account"
}

variable "vnets" {
  type = map(object({
    address_space = string
    dns_servers = list(string)
    subnets = list(object({
      subnet_name    = string
      subnet_address = string,
      service_endpoints = list(string)
    }))
  }))
}

variable "resource_group_name_vnet" {
  type = string
  description = "The name of the resource group in which the resources will be created"
}

# variable "network_rules" {
#   description = "Network rules restricing access to the storage account."
#   type        = object({  subnet_ids = list(string) })
#   default     = null
# }

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = map(object({
    subnet_name = string
    vnet_name = string
    resource_group_name = string
  }))
  default     = null
  
}

variable "nics" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        subnet_name = string
        virtual_network_name = string
    }))
}

variable "vms" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        vm_size = string
        nicname = string
        avsetname = string
        os_disk = object({
            caching = string
            managed_disk_type = string
            create_option = string
        })
        image_reference = object({
            publisher = string
            offer     = string
            sku       = string
            version   = string
       })
        os_profile = object({
            computer_name = string
            admin_username = string
        })
        linux_config = object({
        disable_password_authentication = bool
        })
    }))
  
}

variable "availability_set" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
    }))
  
}

variable "load_balancers" {
    type = map(object({
        name = string
        subnet_name = string
        sku = string
        resource_group_name = string
        virtual_network_name = string
    }))
    description = "The load balancer to be created" 
}
variable "resource_group_name_lb" {
    type = string
    description = "The name of the resource group in which the resources will be created"
  
}
variable "lbsku" {
    type = string
    description = "The SKU of the load balancer"
    default = "Standard"
  
}

variable "resource_group_name_db" {
    type = string
    description = "The name of the resource group in which the resources will be created"
  
}

variable "server" {
    type = map(object({
        name = string
        version = string
        administrator_login = string
    }))
  
}

variable "database" {
    type = map(object({
        name = string
        collation = string
        max_size_gb = number
        server_name = string
        sku_name = string
        zone_redundant = bool
    }))
  
}
variable "key_vault" {
    type = map(object({
        name = string
        sku_name = string
        soft_delete_retention_days = number
        purge_protection_enabled = bool
        enable_rbac_authorization = bool
        sku_name = string
    }))
    description = "The key vault to be created"
}

variable "key_vault_name" {
    type = string
    description = "value of the keyvault"
}
variable "key_vault_rg" {
    type = string
    description = "value of the keyvault"
}


variable "resource_group_name_nsg" {
  type        = string
  description = "Name of the resource group"
}
variable "custom_rules" {
  type        = any
  default     = []
  description = "Security rules for the network security group using this format name = [name, priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
}

variable "nsgname" {
  type = string
  description = "NSG Name"
}