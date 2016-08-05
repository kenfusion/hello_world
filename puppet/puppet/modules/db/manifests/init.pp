
class db {
  $db_user = 'dbuser'
  $db_name = 'my_awsome_db'
  $db_password = 'abc123'

  class { '::mysql::server':
  }

  mysql::db { $db_name:
    user     => $db_user,
    password => $db_password,
  }

  mysql_grant { 'dbuser@%/*.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'dbuser@%',
  }

}
