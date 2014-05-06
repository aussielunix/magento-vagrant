node default  {

  class { 'apache':
    default_mods        => true,
    default_confd_files => false,
    mpm_module          => 'prefork'
  }

  class {'::apache::mod::php': }

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
}
