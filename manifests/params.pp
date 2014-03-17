# Class params
class sysstat::params {
  $package_name   = 'sysstat'
  $interval       = '5-55/10 * * * *'
  $history        = 7
  $compress_after = 10
  $sadc_options   = '-S DISK'
}
