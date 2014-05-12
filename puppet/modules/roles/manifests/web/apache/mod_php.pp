# web::role::apache::mod_php
#
# WIP
#
class roles::web::apache::mod_php(
  $serveradmin         = 'root@localhost',
  $url                 = 'example.org',
  $apc_enabled         = '1',
  $apc_max_file_size   = '4',
  $apc_shm_size        = '256',
  $apc_num_files_hint  = '15000',
  $apc_enable_cli      = '1',
  $startservers        = '8',
  $minspareservers     = '5',
  $maxspareservers     = '20',
  $serverlimit         = '256',
  $maxclients          = '256',
  $maxrequestsperchild = '4000'
)
{
  class { '::apache':
    default_vhost       => true,
    default_mods        => true,
    default_confd_files => true,
    mpm_module          => false
  }

  class {'::apache::mod::prefork':
    startservers        => $startservers,
    minspareservers     => $minspareservers,
    maxspareservers     => $maxspareservers,
    serverlimit         => $serverlimit,
    maxclients          => $maxclients,
    maxrequestsperchild => $maxrequestsperchild
  }

  ::apache::vhost { $url:
    port          => '80',
    docroot       => "/var/www/${url}",
    docroot_owner => 'root',
    docroot_group => 'vagrant',
    serveradmin   => $serveradmin,
  }

  file{"/var/www/${url}/index.php":
    content => "Hello World - ${url}",
    require => Apache::Vhost[$url]
  }

  class {'::apache::mod::php': } ->

  php::ini { '/etc/php5/apache2/php.ini':
    mail_add_x_header => 'Off',
    require => Package['apache2']
  } ->

  class { 'php::mod_php5':
    inifile => '/etc/php5/apache2/php.ini'
  }

  class { 'php::cli':
    inifile => '/etc/php5/cli/php.ini'
  }

  php::ini { '/etc/php5/cli/php.ini':
    display_errors => 'On',
    memory_limit   => '64M',
  }

  class { 'apt': }

  #  apt::key { 'ufirst':
  #    key        => '4BD6EC30',
  #    key_server => 'pgp.mit.edu',
  #  }

  apt::ppa { 'ppa:ufirst/php': }
  php::module { 'gd': }
  php::module { 'mcrypt': }
  php::module { 'curl': }
  php::module { 'mysqlnd': }
  php::module { 'redis':
    require => Apt::Ppa['ppa:ufirst/php']
  }
  php::module { 'snappy':
    require => Apt::Ppa['ppa:ufirst/php']
  }

  php::module { 'apc': }
  php::module::ini { 'apc':
    settings               => {
      'apc.enabled'        => $apc_enabled,
      'apc.max_file_size'  => $apc_max_file_size,
      'apc.shm_size'       => $apc_shm_size,
      'apc.num_files_hint' => $apc_num_files_hint,
      'apc.enable_cli'     => $apc_enable_cli
    }
  }
}
