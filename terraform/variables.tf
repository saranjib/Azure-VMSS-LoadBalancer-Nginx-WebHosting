variable "location" {
  default = "Central India"
}

variable "resource_group_name" {
  default = "rg-vmss-nginx-project"
}

variable "vmss_name" {
  default = "vmss-nginx-web"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "Linux VMSS admin password"
  type        = string
  sensitive   = true
}
