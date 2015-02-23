# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6"

Vagrant.configure("2") do |config|

  # Basic info
  config.vm.box               = "ubuntu/trusty64"
  config.ssh.forward_agent    = true
  config.vm.synced_folder "../", "/home/vagrant/app", :mount_options => [
      "dmode=777", "fmode=666"
  ]

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

  # Prior to the ansible run (called via shell), set bash env to eliminate "stdout: not a tty"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Ansible run
  config.vm.provision :shell, :keep_color => true, :path => "provisioning/init.sh"

  # Concrete5 provision
  #config.vm.provision :shell, :inline => "php /home/vagrant/app/cli/install-concrete5.php " << {
  #  '--admin-email'     => 'change@me.com',
  #  '--admin-password'  => 'c5@dmin',
  #  '--db-database'     => 'concrete5_site',
  #  '--db-username'     => 'root',
  #  '--db-password'     => 'root',
  #  '--db-server'       => 'localhost',
  #  '--core'            => '/home/vagrant/app/web/concrete/',
  #  '--target'          => '/home/vagrant/app/web/'
  #}.map { |k, v| "#{k}=#{v} " }.join(' ')

end