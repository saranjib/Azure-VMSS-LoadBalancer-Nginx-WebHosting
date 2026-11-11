resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku       = "Standard_B2s"
  instances = 2

  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  upgrade_mode = "Automatic"

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.subnet.id

      load_balancer_backend_address_pool_ids = [
        azurerm_lb_backend_address_pool.backend.id
      ]
    }
  }

  tags = {
    environment = "production"
    project     = "nginx-vmss"
  }
}

resource "azurerm_virtual_machine_scale_set_extension" "nginx" {
  name                         = "install-nginx"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.vmss.id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  auto_upgrade_minor_version = true

  protected_settings = jsonencode({
    script = base64encode(
      file("${path.module}/../scripts/install-nginx.sh")
    )
  })
}
