node default  {

  class { 'apache':
    default_mods        => true,
    default_confd_files => false,
    mpm_module          => 'prefork'
  }

  apache::vhost { 'example.org':
    port          => '80',
    docroot       => '/var/www/example.org',
    docroot_owner => 'root',
    docroot_group => 'vagrant',
  }

  file{'/var/www/example.org/index.php':
    content => 'Hello World - example.org',
    require => Apache::Vhost['example.org']
  }

  class {'::apache::mod::php': } -> 
  php::ini { '/etc/php5/apache2/php.ini':
    mail_add_x_header => 'Off',
    # For the parent directory
    require => Package['apache2'],
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

  apt::key { 'ufirst':
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

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
      'apc.enabled'        => '1',
      'apc.max_file_size'  => '4',
      'apc.shm_size'       => '256',
      'apc.num_files_hint' => '15000',
      'apc.enable_cli'     => '1'
    }
  }
}
