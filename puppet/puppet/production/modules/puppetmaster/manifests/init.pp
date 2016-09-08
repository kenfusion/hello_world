
class puppetmaster {

  class { 'puppetdb':
    manage_firewall => false,
  }
  class { 'puppetdb::master::config':

  }
}
