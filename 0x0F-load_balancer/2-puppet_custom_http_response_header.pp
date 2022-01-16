# setting up creating a custom HTTP header response

package { 'nginx':
    ensure  => installed,
}

file_line { 'http_response':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    after  => 'listen 80 default_server',
    line   => 'add_header X-Served-By $hostname;',
}

file_line { 'redirecting':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { 'content_inside':
    content => 'Holberton School',
    require => Package['nginx'],
}

service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
}