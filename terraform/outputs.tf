output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "load_balancer_public_ip" {
  value = azurerm_public_ip.lb_ip.ip_address
}

output "website_url" {
  value = "http://${azurerm_public_ip.lb_ip.ip_address}"
}

output "vmss_name" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.name
}
