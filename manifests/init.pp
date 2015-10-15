class nginx (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nginx',
  }

  $dist = $::operatingsystem ? {
    /(?i-mx:centos)/ => 'centos',
    /(?i-mx:redhat)/ => 'rhel',
  }

  yumrepo { 'nginx':
    baseurl        => "http://nginx.org/packages/${dist}/${::lsbmajdistrelease}/${::hardwaremodel}/",
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '0',
    descr          => 'NGINX',
  }

  package { $required:
    ensure  => $ensure,
    require => Yumrepo['nginx'],
  }

}
