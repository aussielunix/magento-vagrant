#
node default  {
  class {'roles::web':
    php_runtime        => hiera('roles::web::php_runtime'),
    webserver          => hiera('roles::web::webserver'),
    url                => hiera('url'),
    apc_enabled        => hiera('php::module::apc::enabled'),
    apc_max_file_size  => hiera('php::module::apc::max_file_size'),
    apc_shm_size       => hiera('php::module::apc::shm_size'),
    apc_num_files_hint => hiera('php::module::apc::num_files_hint'),
    apc_enable_cli     => hiera('php::module::apc::enable_cli')
  }
}
