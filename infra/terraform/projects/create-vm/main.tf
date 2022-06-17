locals {
  common_tags = {
    dept            = "infra"
    env             = terraform.workspace
    managed_by      = "terraform"
    managed_by_team = "avengers"
    team            = "av"
    tf_project      = "jenkinsagent"
  }
  username = "ci"
}
resource "azurerm_resource_group" "jenkinsagents" {
  name     = "${terraform.workspace}-av-jenkinsagent"
  location = "North Europe"

  tags = merge(
    local.common_tags,
    { description = "Resource group for Jenkins Agents" }
  )
}
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.jenkinsagents.name
  location            = azurerm_resource_group.jenkinsagents.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "jenkinsagents_nic" {
  name                          = "${terraform.workspace}-av-jenkinsagent-${format("%02s", count.index + 1)}-nic"
  location                      = azurerm_resource_group.jenkinsagents.location
  resource_group_name           = azurerm_resource_group.jenkinsagents.name
  count                         = var.num_jenkinsagents
  enable_accelerated_networking = true

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.av_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  tags = merge(
    local.common_tags,
    { description = "Network interface for ${terraform.workspace}-av-jenkinsagents-${format("%02s", count.index + 1)}" }
  )
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "jenkinsagents" {
  name                = "${terraform.workspace}-av-da-${format("%02s", count.index + 1)}"
  resource_group_name = azurerm_resource_group.jenkinsagents.name
  location            = azurerm_resource_group.jenkinsagents.location
  size                = var.jenkinsagents_size
  admin_username      = local.username
  admin_password      = "${data.azurerm_key_vault_secret.vmpassword.value}"
  network_interface_ids = [
    azurerm_network_interface.jenkinsagents_nic[count.index].id,
  ]
  count = var.num_jenkinsagents

  admin_ssh_key {
    username   = local.username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 128
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = merge(
  local.common_tags,
  { description = "VM Machine for ${terraform.workspace}-av-jenkinsagents-${format("%02s", count.index + 1)}" }
)
}