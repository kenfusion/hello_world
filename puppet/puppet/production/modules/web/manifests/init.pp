
class web {
  $db_user = dbuser
  $db_password = abc123
  $packages = ['httpd', 'php', 'php-mysql']

  package { $packages:
    ensure => installed,
  }

  service { 'httpd':
    require => Package['httpd'],
    ensure => running,
    enable => true,
  }

  file { '/etc/httpd/conf.d/headers.conf':
    notify => Service['httpd'],
    ensure => present,
    content => template('web/headers.conf.erb'),
  }

  file { '/var/www/html/index.php':
    notify => Service['httpd'],
    ensure => present,
    content => template('web/index.php.erb'),
  }

}
