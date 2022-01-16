# setting up creating a custom HTTP header response


package { 'nginx':
    ensure  => installed,
}

file_line { 'http_response':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    line   => 'add_header X-Served-By \$hostname',
    after  => 'listen 80 default_server',
}

service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
}