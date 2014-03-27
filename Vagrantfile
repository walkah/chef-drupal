# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "walkah/drupal-precise64"

  config.vm.network "private_network", ip: "33.33.33.10"

  config.ssh.forward_agent = true

  config.vm.synced_folder ".", "/vagrant", :type => "nfs"
  
  config.vm.provider "virtualbox" do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.name = "drupal"
    vb.memory = 2048
    vb.cpus = 2
  end
end
