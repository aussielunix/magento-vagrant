# == Class varnish::config
#
# This class is called from varnish
#
class varnish::config {
  $running    = $varnish::start ? {true => 'yes', default => 'no'}
  $nfiles     = $varnish::nfiles
  $memlock    = $varnish::memlock
  $cli_buffer = $varnish::cli_buffer
  $esi_syntax = $varnish::esi_syntax

  file {'varnish-conf':
    ensure  => $varnish::ensure,
    path    => $varnish::conf_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('varnish/default/varnish.erb'),
  }

  file {'/etc/varnish/default.vcl':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('varnish/default.vcl.erb'),
  }
}
