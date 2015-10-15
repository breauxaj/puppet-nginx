define nginx::config (
  $value
) {
  include ::nginx

  $key = $title

  $context = '/etc/nginx/nginx.conf'

  augeas { "nginx_conf/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}
