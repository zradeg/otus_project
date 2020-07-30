resource "vsphere_virtual_machine" "backup-server" {
  name             = "backup-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 2
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk2"
    size             = "8"
    unit_number      = "1"
    thin_provisioned = "false"
  }

  disk {
    label            = "disk1"
    size             = "20"
    unit_number      = "0"
    thin_provisioned = "false"
  }


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "backup-server"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.10"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "balancer1" {
  name             = "balancer1"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 1048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "balancer1"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.21"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "balancer2" {
  name             = "balancer2"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 1048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "balancer2"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.22"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "postfix1" {
  name             = "postfix1"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "postfix1"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.31"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "postfix2" {
  name             = "postfix2"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "postfix2"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.32"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "postfix3" {
  name             = "postfix3"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "postfix3"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.33"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "galera1" {
  name             = "galera1"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "galera1"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.41"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}

resource "vsphere_virtual_machine" "galera2" {
  name             = "galera2"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "galera2"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.42"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}
resource "vsphere_virtual_machine" "galera3" {
  name             = "galera3"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id


  num_cpus = 1
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  
  network_interface {
    network_id   = data.vsphere_network.ext.id
  }




  
  disk {
    label            = "disk1"
    size             = "8"
    unit_number      = "0"
    thin_provisioned = "false"
  }

 


  clone {
      template_uuid = data.vsphere_virtual_machine.template.id

      customize {
          linux_options {
              host_name = "galera3"
              domain = "mm.test"
          }

      

  network_interface {
    ipv4_address    = "10.1.14.43"
    ipv4_netmask    = 24
  }


      ipv4_gateway      = "10.1.14.1"

      }
  }
  

   
}


