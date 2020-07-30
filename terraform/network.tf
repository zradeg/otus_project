#### bastion PORT CONFIG
# Create port bastion with vlan
resource "vsphere_host_port_group" "lan_port" {
  name                = "lan_vlan_14"
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = var.vswitchlan
  #vlan_id             = "14"
  allow_promiscuous   = true
  provisioner "local-exec" {
    command           = "sleep 10"
  }
}

#### node PORT CONFIG
# Create port node with vlan
resource "vsphere_host_port_group" "wan_port" {
  name                = "ext"
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = var.vswitchwan
  #wan_vlan_id             = "1"
  allow_promiscuous   = true
  provisioner "local-exec" {
    command           = "sleep 10"
  }
}
