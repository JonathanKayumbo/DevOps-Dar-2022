output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}

output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}


####NOTE
# To use SSH to connect to the virtual machine, do the following steps:

# Run terraform output to get the SSH private key and save it to a file.

# terraform output -raw tls_private_key > id_rsa
# Run terraform output to get the virtual machine public IP address.

# terraform output public_ip_address
# Use SSH to connect to the virtual machine.

# ssh -i id_rsa azureuser@<public_ip_address>
