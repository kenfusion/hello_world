node default {
  include ntp
}

node 'node-01' {
  include lb
}

node 'node-02' {
  include db
}
