node default {
  include ntp
}

node 'node-01' {
  include lb
}

node 'node-02' {
  include db
}

node 'node-03', 'node-04' {
  include web
}
