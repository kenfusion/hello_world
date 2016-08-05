
class ntp {
  $ntpserver1 = '0.pool.ntp.org'
  $ntpserver2 = '1.pool.ntp.org'
  $ntpserver3 = '2.pool.ntp.org'
  $ntpserver4 = '3.pool.ntp.org'

  package { 'ntp':
    ensure => installed,
  }

  service { 'ntpd':
    require => Package['ntp'],
    ensure => running,
    enable => true,
  }

  file { '/etc/ntp.conf':
    notify => Service['ntpd'],
    ensure => present,
    content => template('/vagrant/puppet/modules/ntp/templates/ntp.conf.erb'),

  }
}
