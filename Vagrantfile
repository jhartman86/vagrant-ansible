# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6"

Vagrant.configure("2") do |config|

  # Basic info
  config.vm.box               = "ubuntu/trusty64"
  config.ssh.forward_agent    = true
  config.vm.synced_folder "../", "/home/vagrant/app"

  # Configure port forwarding list
  {80 => 8080, 443 => 4433, 3306 => 3307}.each do |from, to|
    config.vm.network :forwarded_port, guest:from, host:to, auto_correct:true
  end

  # Box name and resource settings
  begin
    config.vm.provider :virtualbox do |v|
      v.name    = File.basename(File.expand_path("../"))
      v.memory  = 1024
      v.cpus    = 2
    end
  rescue
    $stdout.puts "VM Configuration Error (in Vagrantfile)"
  end

  # Ansible run
  config.vm.provision :shell, :keep_color => true, :path => "provisioning/init.sh"

end