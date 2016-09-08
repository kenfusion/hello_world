
class tools {
  $packages = hiera('tools_packages')

  package { $packages:
  ensure => installed,
  }
}
