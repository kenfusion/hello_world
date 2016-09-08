
node default {
  include common
}

node 'node-01' {
  $webhost1 = hiera("webhost1")
  $webhost2 = hiera("webhost2")
  $webip1 = hiera("webip1")
  $webip2 = hiera("webip2")

  include common
  include lb
}

node 'node-02' {
  $db_user = hiera("db_user")
  $db_name = hiera("db_name")
  $db_password = hiera("db_password")

  include common
  include db
}

node 'node-03', 'node-04' {
  include common
  include web
}
