class nginx {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nginx',
  }

  $paths = [ '/etc/nginx', '/etc/nginx/conf.d', '/var/log/nginx' ]

  package { $required: ensure => latest }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
