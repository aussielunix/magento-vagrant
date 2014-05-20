# == Class varnish::install
#
class varnish::install {
  $add_repo = $varnish::add_repo ? {
    true    => 'present',
    false   => 'absent',
    default => 'present'
  }

  #FIXME: break out to own varnish::repo class
  apt::source { 'varnish':
    ensure     => $add_repo,
    location   => 'http://repo.varnish-cache.org/ubuntu',
    repos      => 'varnish-3.0',
    key        => '60E7C096C4DEFFEB',
    key_source => 'http://repo.varnish-cache.org/debian/GPG-key.txt',
  } ->
  package { $varnish::package_name:
    ensure => $varnish::ensure,
  }
}
