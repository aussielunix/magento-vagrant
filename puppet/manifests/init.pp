#
node default  {
  class {'roles::web::apache::mod_php':
    serveradmin         => hiera('roles::web::serveradmin'),
    url                 => hiera('url'),
    apc_enabled         => hiera('php::module::apc::enabled'),
    apc_max_file_size   => hiera('php::module::apc::max_file_size'),
    apc_shm_size        => hiera('php::module::apc::shm_size'),
    apc_num_files_hint  => hiera('php::module::apc::num_files_hint'),
    apc_enable_cli      => hiera('php::module::apc::enable_cli'),
    startservers        => hiera('roles::web::startservers'),
    minspareservers     => hiera('roles::web::minspareservers'),
    maxspareservers     => hiera('roles::web::maxspareservers'),
    serverlimit         => hiera('roles::web::serverlimit'),
    maxclients          => hiera('roles::web::maxclients'),
    maxrequestsperchild => hiera('roles::web::maxrequestsperchild'),
  }
}
