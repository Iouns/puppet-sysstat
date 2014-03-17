# Configure sysstat service
class sysstat::service {
  service{ 'sysstat':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
  }
}
