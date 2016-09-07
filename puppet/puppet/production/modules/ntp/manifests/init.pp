
class ntp {

  $ntpservice = $facts['os']['family'] ? {
    'redhat'  => 'ntpd',
    'debian'  => 'ntp',
    default   => 'ntp',
  }

  $ntpserver1 = '0.pool.ntp.org'
  $ntpserver2 = '1.pool.ntp.org'
  $ntpserver3 = '2.pool.ntp.org'
  $ntpserver4 = '3.pool.ntp.org'

  package { 'ntp':
    ensure => installed,
  }

  service { $ntpservice:
    require => Package['ntp'],
    ensure => running,
    enable => true,
  }

  file { '/etc/ntp.conf':
    notify => Service['ntpd'],
    ensure => present,
    content => template('ntp/ntp.conf.erb'),

  }
}
