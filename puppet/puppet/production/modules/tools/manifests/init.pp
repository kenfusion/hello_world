
class tools {
  $packages = ['tree', 'vim']

  package { $packages:
  ensure => installed,
  }
}
