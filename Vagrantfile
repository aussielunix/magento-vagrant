# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

def puppet_version
  puppet_version = ENV['puppet_version'] || ENV['PUPPET_VERSION'] || '3.4.3-1puppetlabs1'
  if puppet_version =~ /^latest$/i
    puppet_version = nil
  else
    puppet_version = "=#{puppet_version}"
  end
  puppet_version
end

def facter_version
  facter_version = ENV['facter_version'] || ENV['FACTER_VERSION'] || '2.0.1-1puppetlabs1'
  if facter_version =~ /^latest$/i
    facter_version = nil
  else
    facter_version = "=#{facter_version}"
  end
  facter_version
end

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
        sudo apt-get install --yes puppet#{puppet_version} puppet-common#{puppet_version} facter#{facter_version}
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
