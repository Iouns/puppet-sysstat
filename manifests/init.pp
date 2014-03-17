# == Class: systat
#
# This class installs and configures the sysstat agent.
#
# === Parameters:
#
# $package_name::                  Package's name.
#                                  Defaults to : "sysstat"
#                                  type: string
#
# $history::                       How long to keep log files (in days).
#                                  Defaults to : 30
#                                  type: integer
#
# $interval::                      Cron interval between each sysstat runs.
#                                  Defaults to : "5-55/10 * * * *" (10 minutes)
#                                  type: string
#
# $compress_after::                Compress (using gzip or bzip2) sa and sar files older than (in days).
#                                  Defaults to : 10
#                                  type: integer
#
# $sadc_options::                  Parameters for the system activity data collector (see sadc manual page).
#                                  Defaults to: "-S DISK"
#                                  type: string
#
#
# === Examples
#
#  class { sysstat:
#    history => 30,
#  }
#
# === Authors
#
# Iounes Gardon <iounes.gardon@gmail.com>
#
class sysstat (
  $package_name   = $sysstat::params::package_name,
  $interval       = $sysstat::params::interval,
  $history        = $sysstat::params::history,
  $compress_after = $sysstat::params::compress_after,
  $sadc_options   = $sysstat::params::sadc_options,
) inherits sysstat::params {
  class { 'sysstat::install': } ->
  class { 'sysstat::config': } ->
  class { 'sysstat::service': }
}
