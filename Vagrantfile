# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.rspec.suppress_ci_stdout = false
  config.rspec.dirs = ['spec/unit', 'spec/integration']
  config.rspec.tests = ['*_spec.rb']

  #config.vm.provision "shell", inline: "sudo apt-get install -y apache2"
  config.vm.provision :puppet, :options => ["--debug", "--verbose", "--summarize"] do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "init.pp"
  end
end
