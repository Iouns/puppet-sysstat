# Configure sysstat package.
class sysstat::config {
  case $::operatingsystem {
    Debian,Ubuntu: {
      $config_dir = '/etc/sysstat'
      $cron_tmpl  = 'sysstat/sysstat.cron.debian.erb'

      # Put init file to enable sysstat service.
      file {'/etc/default/sysstat':
        ensure  => present,
        content => template('sysstat/sysstat.default.erb'),
        require => Class['sysstat::install'],
        before  => Class['sysstat::service'],
      }
    }
    RedHat,CentOS: {
      $config_dir = '/etc/sysconfig'
      $cron_tmpl  = 'sysstat/sysstat.cron.redhat.erb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

  # Main sysstat file.
  file { "${config_dir}/sysstat":
    ensure  => present,
    content => template('sysstat/sysstat.erb'),
    require => Class['sysstat::install'],
    before  => Class['sysstat::service'],
  }

  # Cron config file.
  file { '/etc/cron.d/sysstat':
    ensure  => present,
    content => template($cron_tmpl),
    require => Class['sysstat::install'],
    before  => Class['sysstat::service'],
  }
}
