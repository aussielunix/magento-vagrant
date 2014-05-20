# == Class varnish::service
#
# This class is meant to be called from varnish
# It ensures the service is running or not
#
class varnish::service {
  $ensure = $varnish::start ? {true => running, default => stopped}

  service { $varnish::service_name:
    ensure     => $ensure,
    enable     => $varnish::enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
