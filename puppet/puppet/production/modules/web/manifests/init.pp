
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




# - name: configure web servers
#   hosts: web
#   remote_user: vagrant
#   become: True
#   vars:
#     db_user: dbuser
#     db_password: abc123

#   tasks:
#     - name: create the index.php file
#       template:
#         src: index.php.j2
#         dest: /var/www/html/index.php
#     - name: create headers.conf file
#       template:
#           src: headers.conf.j2
#           dest: /etc/httpd/conf.d/headers.conf
#       notify: restart httpd
#   handlers:
#     - name: restart httpd
#       service:
#         name: httpd
#         state: restarted
