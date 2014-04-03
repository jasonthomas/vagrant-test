# class apache::packages
class apache::packages {

  package {
    'httpd':
      ensure => 'installed',
  }

}
