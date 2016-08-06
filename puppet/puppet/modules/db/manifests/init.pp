
class db {
  $db_user = 'dbuser'
  $db_name = 'my_awsome_db'
  $db_password = 'abc123'

  class { '::mysql::server':
    root_password           => '123abc',
    remove_default_accounts => true,
    override_options => {
        mysqld => { bind-address => '0.0.0.0'} #Allow remote connections
      },
  }

  mysql::db { $db_name:
    user     => $db_user,
    password => $db_password,
    host     => "%",
  }
}
