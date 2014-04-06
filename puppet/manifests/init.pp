node default {
  class { 'nginx': }

  nginx::resource::vhost { 'example.org':
    www_root => '/var/www/example.org',
  }
}
