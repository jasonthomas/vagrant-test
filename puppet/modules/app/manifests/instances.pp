# define app::instances
define app::instances (
  $app_content,
  $group = 'nobody',
  $is_php = false,
  $owner = 'nobody',
  $port = '80',
  $server_name = 'locahost',
){
  $app_name = $name
  $document_root = "${app::base_dir}/${app_name}"

  File {
    owner => $owner,
    group => $group,
    mode  => '0644',
  }

  if $is_php {
    include php
    $suffix = '.php'
  }
  else {
    $suffix = '.html'
  }

  if $port != '80' {
    apache::config {
      "port_${port}":
        content => "Listen ${port}\n"
    }
  }

  file {
    $document_root:
      ensure => 'directory',
      mode   => '0755';

    "${document_root}/index${suffix}":
      ensure  => 'file',
      content => $app_content;
  }

  apache::config {
    $app_name:
      content => template('app/virtualhost.conf.erb'),
  }
}
