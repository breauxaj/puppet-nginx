class nginx {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nginx',
  }

  package { $required: ensure => latest }
    
  $paths = [ '/etc/nginx', '/etc/nginx/conf.d', '/var/log/nginx' ]
    
  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}

define nginx::service ( $ensure = running,
                        $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nginx',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
