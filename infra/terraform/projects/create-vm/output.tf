output "resource_group_name" {
  value = azurerm_resource_group.jenkinsagents.name
}



####NOTE
# To use SSH to connect to the virtual machine, do the following steps:

# Run terraform output to get the SSH private key and save it to a file.

# terraform output -raw tls_private_key > id_rsa
# Run terraform output to get the virtual machine public IP address.

# terraform output public_ip_address
# Use SSH to connect to the virtual machine.

# ssh -i id_rsa azureuser@<public_ip_address>
