variable "vsphere_user" {
    description = "The vSphere user with permission"
}

variable "vsphere_password" {
  description = "The vSphere password for vsphere_user"
}

variable "vsphere_server" {
  description = "The domain or ip address of vSphere server"
}

variable "vsphere_datacenter" {
  type        = "string"
}

variable "vsphere_datastore" {
  type        = "string"
}

variable "vsphere_resource_pool" {
  type        = "string"
}

variable "vsphere_network" {
  type        = "string"
}

variable "vsphere_virtual_machine" {
  type        = "string"
}

variable "count_instance" {
  default     = 0
}

variable "chef_provision" {
  type = map(string)
  description = "Configuration details for chef server"

  default = {
    environment     = "staging"
    server_url      = "https://chef.moneyman.ru/organizations/moneyman_test"
    recreate_client = true
  }
}

variable "connection_chef" {
  type = map(string)
  description = "Configuration details for connecting to the remote machine"

  default = {
      connection_type = "ssh"
      connection_user = "root"
      connection_password = "Alamos1267$"
      
  }
}

#### GLOBAL NETWORK PARAMS
# Virtual switch used
variable "vswitchwan" {
  default = "vSwitch0"
}

variable "vswitchlan" {
  default = "vSwitch1"
}

# Set host where you want deploy your vm
variable "host" {
  default = "10.200.5.15"
}
