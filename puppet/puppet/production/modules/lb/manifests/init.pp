
class lb {

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
    content => template('lb/haproxy.cfg.erb'),

  }
}
