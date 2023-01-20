variable "rgname" {
    type = string
    description = "resource group name"
}
variable "loc" {
    type = string
    description = "location"
}



variable "vnet" {
    type = string
    description = "vnet name"
}

variable "subnet_address" {
    type = list
    description = "subnet address"  
}

variable "vnet_address" {
    type = list 
}

variable "subnet_name" {
    description = "subnet name"
}

variable "nic" {
  type = string
  description = "network interface"
}

variable "pip" {
  type = string
}

variable "NSG" {
  type = string
}

variable "vmname" {
    type = string
    description = "vm name"  
}
variable "organization" {
    type = string
}

variable "environment" {
      type = string
}

variable "app" { 
     type = string
}

variable "tier" {
      type = string
}

variable "tagging" {
    type = object ({
        CreatedBy = string
        CostCenter = number
        Org = string
    })
    }
  