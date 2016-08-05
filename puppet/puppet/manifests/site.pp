node default {
  include ntp
}

node 'node-01' {
  include lb
}
