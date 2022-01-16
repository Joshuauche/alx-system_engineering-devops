# setting up creating a custom HTTP header response

exec { 'apt-update':
    command => '/usr/bin/apt-get update',
}

# installing nginx
package { 'nginx':
    ensure  => installed,
    require => Exec['apt-update'],
}

file_line { 'redirecting':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
    require => Package['nginx'],
}

# custom header response
file_line { 'http_response':
    ensure  => present,
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default_server',
    line    => 'add_header X-Served-By $hostname;',
    require => Package['nginx'],
}

# write into file
file { 'contain':
    content => 'Holberton School',
    require => Package['nginx'],
}

# restart nginx
service { 'nginx':
    ensure  => 'running',
    require => Package['nginx'],
}