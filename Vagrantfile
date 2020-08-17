# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_version = "1905.1"
#  config.vbguest.iso_path = "../VBoxGuestAdditions.iso"
#  config.vbguest.auto_update = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provider "virtualbox" do |v|
	  v.memory = 768
  end

  config.vm.define "ngx01" do |ngx01|
    ngx01.vm.network "private_network", ip: "192.168.11.111", virtualbox__intnet: false
    ngx01.vm.hostname = "ngx01"
  end

  config.vm.define "ngx02" do |ngx02|
    ngx02.vm.network "private_network", ip: "192.168.11.112", virtualbox__intnet: false
    ngx02.vm.hostname = "ngx02"
  end

  config.vm.define "postfix01" do |postfix01|
    first_disk = './VirtualBox VMs/pf01/disk1.vdi'
#    second_disk = './VirtualBox VMs/pf01/disk2.vdi'
    postfix01.vm.network "private_network", ip: "192.168.11.113", virtualbox__intnet: false
    postfix01.vm.hostname = "postfix01"
    postfix01.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "postfix01"
      need_controller_pf01 = false
      unless File.exist?(first_disk)
        virtualbox.customize ['createhd', '--filename', first_disk, '--variant', 'Fixed', '--size', 4096]
        need_controller_pf01 = true
      end
#      unless File.exist?(second_disk)
#        virtualbox.customize ['createhd', '--filename', second_disk, '--variant', 'Fixed', '--size', 4096]
#        need_controller_pf01 = true
#      end
      if need_controller_pf01 == true
        virtualbox.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
      end
      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 0, '--device', 0, '--type', 'hdd', '--medium', first_disk]
#      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', second_disk]
      end
  end

  config.vm.define "postfix02" do |postfix02|
    first_disk = './VirtualBox VMs/pf02/disk1.vdi'
#    second_disk = './VirtualBox VMs/pf02/disk2.vdi'
    postfix02.vm.network "private_network", ip: "192.168.11.114", virtualbox__intnet: false
    postfix02.vm.hostname = "postfix02"
    postfix02.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "postfix02"
      need_controller_pf02 = false
      unless File.exist?(first_disk)
        virtualbox.customize ['createhd', '--filename', first_disk, '--variant', 'Fixed', '--size', 4096]
        need_controller_pf02 = true
      end
#      unless File.exist?(second_disk)
#        virtualbox.customize ['createhd', '--filename', second_disk, '--variant', 'Fixed', '--size', 4096]
#        need_controller_pf02 = true
#      end
      if need_controller_pf02 == true
        virtualbox.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
      end
      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 0, '--device', 0, '--type', 'hdd', '--medium', first_disk]
#      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', second_disk]
      end
  end

  config.vm.define "postfix03" do |postfix03|
    first_disk = './VirtualBox VMs/pf03/disk1.vdi'
#    second_disk = './VirtualBox VMs/pf03/disk2.vdi'
    postfix03.vm.network "private_network", ip: "192.168.11.115", virtualbox__intnet: false
    postfix03.vm.hostname = "postfix03"
    postfix03.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "postfix03"
      need_controller_pf03 = false
      unless File.exist?(first_disk)
        virtualbox.customize ['createhd', '--filename', first_disk, '--variant', 'Fixed', '--size', 4096]
        need_controller_pf03 = true
      end
#      unless File.exist?(second_disk)
#        virtualbox.customize ['createhd', '--filename', second_disk, '--variant', 'Fixed', '--size', 4096]
#        need_controller_pf03 = true
#      end
      if need_controller_pf03 == true
        virtualbox.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
      end
      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 0, '--device', 0, '--type', 'hdd', '--medium', first_disk]
#      virtualbox.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', second_disk]
      end
  end

#  config.vm.define "proxysql01" do |proxysql01|
#    proxysql01.vm.network "private_network", ip: "192.168.11.116", virtualbox__intnet: false
#    proxysql01.vm.hostname = "proxysql01"
#  end

  config.vm.define "pxc1" do |pxc1|
    pxc1.vm.network "private_network", ip: "192.168.11.120", virtualbox__intnet: false
    pxc1.vm.hostname = "pxc1"
  end

  config.vm.define "pxc2" do |pxc2|
    pxc2.vm.network "private_network", ip: "192.168.11.121", virtualbox__intnet: false
    pxc2.vm.hostname = "pxc2"
  end

  config.vm.define "pxc3" do |pxc3|
    pxc3.vm.network "private_network", ip: "192.168.11.122", virtualbox__intnet: false
    pxc3.vm.hostname = "pxc3"
  end
#
#  config.vm.define "backup" do |backup|
#    backup.vm.network "private_network", ip: "192.168.11.123", virtualbox__intnet: false
#    backup.vm.hostname = "backup"
#  end

#  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "v"
#    ansible.playbook = "playbook.yml"
#    ansible.become = "true"
#  end


end
