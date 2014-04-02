# list of required env vars
envvars = [
  'aws_access_key_id',
  'aws_secret_access_key',
  'aws_keypair_name'
]

envvars.each do |var|
  raise ArgumentError, "ENV['#{var}'] is not set." unless ENV[var]
end

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id             = ENV['aws_access_key_id']
    aws.secret_access_key         = ENV['aws_secret_access_key']
    aws.keypair_name              = ENV['aws_keypair_name']
    aws.region                    = 'ap-southeast-2'
    aws.subnet_id                 = 'subnet-3d001954'
    aws.elastic_ip                = true
    aws.security_groups           = ['sg-06b85e63']
    aws.ami                       = "ami-09f26b33"
    aws.terminate_on_shutdown     = true
    aws.tags                      = {
      'Name'                      => 'bprnd-vagrant-test-01',
      'Contact'                   => 'Mick Pollard'
    }
    override.ssh.username         = "ubuntu"
    override.ssh.private_key_path = "~/.ssh/ec2/#{ENV['aws_keypair_name']}.pem"
  end
  #TODO replace this with some puppet love
  config.vm.provision "shell", inline: "sudo apt-get install -y apache2"
end
