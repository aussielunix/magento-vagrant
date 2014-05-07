#
node default  {
  class {'roles::web':
    php_runtime => 'modphp',
    webserver   => 'apache2',
    url         => 'example.org'
  }
}
