
class ntp {

  $ntpservice = $facts['os']['family'] ? {
    'redhat'  => 'ntpd',
    'debian'  => 'ntp',
    default   => 'ntp',
  }

  $ntpservers = hiera("ntpservers")

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
