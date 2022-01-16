# setting up creating a custom HTTP header response

exec { 'apt_update':
    command => 'usr/bin/apt-get update',
}

package { 'nginx':
    ensure  => installed,
    require => Exec['apt_update'],
}

file_line { 'http_response':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server',
    line    => 'add_header X-Served-By $hostname;',
    require => Package['nginx'],
}

file_line { 'redirecting':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
    require => Package['nginx'],
}

file { 'content_inside':
    content => 'Holberton School',
    require => Package['nginx'],
}

service { 'nginx':
    ensure  => 'running',
    require => Package['nginx'],
}