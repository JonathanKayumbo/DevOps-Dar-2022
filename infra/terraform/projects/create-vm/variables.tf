variable "num_jenkinsagents" {
  type    = number
  default = 1
}

variable "jenkinsagents_size" {
  type    =  string
  default = "Standard_D2s_v3"
}

variable "jenkinsagents_disksize" {
  type    =  number
  default = 200
}

variable "keyvault_name"{
  type    =   string
  default =   "jenkinsCredentials"
}