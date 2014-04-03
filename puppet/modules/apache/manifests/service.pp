# class apache::service
class apache::service (
  $enable = true,
  $ensure = 'running',
  $service = 'httpd',
){

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
