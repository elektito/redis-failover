# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "10.1.1.10"

    node1.vm.provision "shell", path: "provision1.sh"

    node1.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2"
    node2.vm.network "private_network", ip: "10.1.1.20"

    node2.vm.provision "shell", path: "provision2.sh"

    node2.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end
end
