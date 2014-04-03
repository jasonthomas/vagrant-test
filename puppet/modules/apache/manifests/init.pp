# apache
class apache (
  $config_dir = '/etc/httpd/conf.puppet.d'
){

  include apache::packages
  include apache::service

  File {
    require => Class['apache::packages'],
  }

  file {
    $config_dir:
      ensure  => directory,
      purge   => true,
      recurse => true;

    '/etc/httpd/conf.d/apache.puppet.conf':
      content => "include ${config_dir}/*.conf\n";
  }

  Class['apache::packages'] ~> Class['apache::service']

}
