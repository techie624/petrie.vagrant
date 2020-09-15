# --- Vagrantfile Example --- #

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # https://vagrantcloud.com/ubuntu
  config.vm.box = "gadm/scGDM"
  config.vm.box_version = "1.2.1"
  config.vm.hostname = "scgdm-server"
  # config.disksize.size = '25GB'
  
  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "public_network", bridge: "enp4s0"

  ### Forward ports
  # config.vm.network "forwarded_port", guest: 8081, host: 8081 # web server
  # config.vm.network "forwarded_port", guest: 5432, host: 5432 # Postgres
  # config.vm.network "forwarded_port", guest: 389, host: 389 # ldap
  # config.vm.network "forwarded_port", guest: 8083, host: 8083 # kdcompute
  # config.vm.network "forwarded_port", guest: 8084, host: 8084 # owncloud
  
  config.vm.provider "virtualbox" do |v|
    v.name = "scgdm-server"
    v.memory = 2048
    v.cpus = 2
  end

  ### If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true
  config.ssh.keep_alive = true

  ### Share additional folders to the guest VM.
  # config.vm.synced_folder "data", "/data"
  # config.vm.synced_folder ".", "/vagrant", disabled: true


  ### Bash provision script
  config.vm.provision "shell", path: "provision/setup.sh"

  # Upload users ssh key into box so it can be used for downloading stuff from stash
  # ssh_key_path = "~/.ssh/"
  # config.vm.provision "shell", inline: "mkdir -p /home/vagrant/.ssh"
  # config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa' }", destination: "/home/vagrant/.ssh/id_rsa"
  # config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa.pub' }", destination: "/home/vagrant/.ssh/id_rsa.pub"

end
