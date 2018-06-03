# OS
VAGRANT_BOX = 'ubuntu/trusty64'
# Memorable name for your
VM_NAME = 'ubuntu-virtual'
# VM User — 'vagrant' by default
VM_USER = 'vagrant'

# Optimized for Vagrant 1.7 and above.
Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|

  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VM_NAME

  config.vm.provider "virtualbox" do |v|
    v.name = VM_NAME
    v.memory = 512
  end


  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  config.ssh.insert_key = false

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = ""
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.synced_folder '../', '/var/www/'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 81, host: 8081
  config.vm.network "forwarded_port", guest: 82, host: 8082
  config.vm.network "private_network", ip: "192.168.50.4"
end