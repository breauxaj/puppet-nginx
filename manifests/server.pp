define nginx::server (
  $value
) {
  include ::nginx

  $key = $title

  $config = "/etc/nginx/conf.d/${title}.conf"

  augeas { "nginx_server/${key}":
    lens    => 'Nginx.lns',
    incl    => $config,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => File["/etc/nginx/conf.d/${title}.conf"],
  }

  file { "/etc/nginx/conf.d/${title}.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
