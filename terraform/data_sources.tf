data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  name          = var.host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "lan_vlan_14" {
  name          = "lan_vlan_14"
  datacenter_id = data.vsphere_datacenter.dc.id
  depends_on    = [vsphere_host_port_group.lan_port]
}

data "vsphere_network" "ext" {
  name          = "ext"
  datacenter_id = data.vsphere_datacenter.dc.id
  depends_on    = [vsphere_host_port_group.wan_port]
}
