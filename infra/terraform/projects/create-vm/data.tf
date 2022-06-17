data "azurerm_virtual_network" "tobii_vnet" {
  name                = "Tobii-Azure-Linked-RM"
  resource_group_name = "PlatformLinked"
}

data "azurerm_subnet" "av_subnet" {
  name                 = "Azure_Tech_Platform02"
  resource_group_name  = data.azurerm_virtual_network.tobii_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.tobii_vnet.name
}

data "azurerm_key_vault" "keyvault" {
  name                = "${var.keyvault_name}"
  resource_group_name = "avengers-keyvault"
}

data "azurerm_key_vault_secret" "vmpassword" {
  name           = "ci"
  key_vault_id  = "${data.azurerm_key_vault.keyvault.id}"
}

