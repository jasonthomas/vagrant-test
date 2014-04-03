# app instance class
class app (
  $base_dir = '/data',
  $instances = {},
) {
  file {
    $base_dir:
      ensure => 'directory',
      owner  => 'root',
      mode   => '0755';
  }
  create_resources(app::instances, $instances)
}
