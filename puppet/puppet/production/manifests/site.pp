
node default {
  include common
}

node 'node-01' {
  $webhost1 = 'node-03'
  $webhost2 = 'node-04'
  $webip1 = '10.0.15.23'
  $webip2 = '10.0.15.24'

  include common
  include lb
}

node 'node-02' {
  $db_user = 'dbuser'
  $db_name = 'my_awsome_db'
  $db_password = 'abc123'

  include common
  include db
}

node 'node-03', 'node-04' {
  include common
  include web
}
