# junk node
# dumping ground for things that are normally
# outsourced to various AWS services
# *Note* services here are not tuned perfectly
#
node /aws/ {

  # mysql server - normally provided by aws rds
  #
  class { '::mysql::server':
    root_password    => hiera('mysql::server::root_password'),
  }

  create_resources(mysql::db, hiera_hash('mysql::server::dbs'))

  class { 'apt': }
  apt::ppa {'ppa:chris-lea/redis-server': } ->
  class {'redis': }
}
