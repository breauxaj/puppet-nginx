nginx
=====

NGINX is a free, open-source, high-performance HTTP server and reverse proxy,
as well as an IMAP/POP3 proxy server. NGINX is known for its high performance,
stability, rich feature set, simple configuration, and low resource consumption.

Samples
-------
```
include nginx
```
```
nginx::config {
  'user':                       value => 'nginx';
  'worker_processes':           value => '4';
  'events/worker_connections':  value => '32768';
  'events/multi_accept':        value => 'on';
  'events/use':                 value => 'epoll';
  'http/server_tokens':         value => 'off';
  'http/sendfile':              value => 'on';
  'http/tcp_nopush':            value => 'on';
  'http/tcp_nodelay':           value => 'on';
  'http/keepalive_timeout':     value => '60';
  'http/gzip':                  value => 'on';
  'http/gzip_disable':          value => '"MSIE [1-6]\.(?!.*SV1)"';
}
```
```
nginx::server { 'default':
  'server/listen':                      value => '80';
  'server/server_name':                 value => 'localhost';
  'server/access_log':                  value => '/var/log/nginx/log/host.access.log main';
  'server/error_page 500 502 503 504':  value => '/50x.html';
}
```
```
nginx::service { 'default': ensure => running, enable => true }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
