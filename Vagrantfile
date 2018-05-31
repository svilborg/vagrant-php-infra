# OS
VAGRANT_BOX = 'ubuntu/trusty64'
# Memorable name for your
VM_NAME = 'ubuntu-virtual'
# VM User — 'vagrant' by default
VM_USER = 'vagrant'
# Host folder to sync
HOST_PATH = '/opt/work/vagrant/home'
# Where to sync to on Guest — 'vagrant' is the default user name
GUEST_PATH = '/home/' + VM_USER + '/' + VM_NAME
# # VM Port — uncomment this to use NAT instead of DHCP
# VM_PORT = 8080
Vagrant.configure(2) do |config|
  # Vagrant box from Hashicorp
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VM_NAME
  
  config.vm.provider "virtualbox" do |v|
    v.name = VM_NAME
    v.memory = 1024
  end
  
  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "public_network", ip: "192.168.1.10"
  config.vm.network "forwarded_port", guest: 80, host: 8888
  
  # config.vm.synced_folder HOST_PATH, GUEST_PATH
  # config.vm.synced_folder '.', '/home/'+VM_USER+'', disabled: true
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/playbook.yml"
  end
end