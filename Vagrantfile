# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

sh_update_puppet = <<-EOS
    echo "Get puppet from the puppetlabs repo if we haven't already."
    # Assume that this file's existence means we have the Puppet Labs repo added
    DEB_PROVIDES="/etc/apt/sources.list.d/puppetlabs.list"

    if [ ! -e $DEB_PROVIDES ]
    then
        DISTRIB_CODENAME=$(lsb_release --codename --short)
        DEB="puppetlabs-release-${DISTRIB_CODENAME}.deb"

        # Print statement useful for debugging, but automated runs of this will interpret any output as an error
        # print "Could not find $DEB_PROVIDES - fetching and installing $DEB"
        wget -q http://apt.puppetlabs.com/$DEB
        sudo dpkg -i $DEB

        sudo apt-get update
        sudo apt-get install --yes puppet
    fi
EOS

boxes = Dir.glob("puppet/hiera/nodes/*.yaml").map {|f| YAML.load(File.read(f)) }

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  boxes.each do |attrs|
    ip_address = attrs['ip_address']
    fqdn       = attrs['fqdn']
    hostname   = fqdn.split('.').first

    config.vm.define(hostname) do |config|
      config.vm.network 'private_network', ip: ip_address
      config.vm.hostname = fqdn
    end
  end

  config.rspec.suppress_ci_stdout = false
  config.rspec.dirs = ['spec/unit', 'spec/integration']
  config.rspec.tests = ['*_spec.rb']

  config.vm.provision :shell, :inline => sh_update_puppet
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options        = "--hiera_config=/vagrant/puppet/hiera.yaml"
  end
end
