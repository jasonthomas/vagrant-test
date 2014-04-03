# add an apache config
define apache::config(
  $content
) {
  include apache

  $conf_name = $name

  file {
    "${apache::config_dir}/${conf_name}.conf":
      content => $content,
      notify  => Service[$apache::service::service],
  }

}
