# == Class: varnish
#
# Full description of class varnish here.
#
# === Parameters
#
# ensure        - explicit version, ensure or absent
# add_repo      - if set to false (defaults to true), the yum/apt repo is not added
#
class varnish (
  $ensure       = present,
  $start        = true,
  $enable       = true,
  $add_repo     = true,
  $package_name = 'varnish',
  $service_name = 'varnish',
  $conf_file    = '/etc/default/varnish',
  $nfiles       = '131072',
  $memlock      = '82000',
  $cli_buffer   = '16384',
  $esi_syntax   = '0x2',
) {

  # validate parameters here

  class { 'varnish::install': } ->
  class { 'varnish::config': } ~>
  class { 'varnish::service': } ->
  Class['varnish']
}
