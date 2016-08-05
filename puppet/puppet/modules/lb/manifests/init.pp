
class lb {
  $webhost1 = 'node-03'
  $webhost2 = 'node-04'
  $webip1 = '10.0.15.23'
  $webip2 = '10.0.15.24'

  package { 'haproxy':
    ensure => installed,
  }

  service { 'haproxy':
    require => Package['haproxy'],
    ensure => running,
    enable => true,
  }

  file { '/etc/haproxy/haproxy.cfg':
    notify => Service['haproxy'],
    ensure => present,
    content => template('/vagrant/puppet/modules/lb/templates/haproxy.cfg.erb'),

  }
}
