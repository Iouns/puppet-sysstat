# Install sysstat package.
class sysstat::install {
  package{ $sysstat::package_name:
    ensure  => present,
  }
}
