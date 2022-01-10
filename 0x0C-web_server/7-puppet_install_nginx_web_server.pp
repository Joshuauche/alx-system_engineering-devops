# setting up nginx enviroment
# installing nginx
package { 'nginx':
    ensure  =>  'installed',
}

# file redirecting
file_line { 'redirecting':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    line   => 'rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
    after  =>  'listen 80 defualt_server;',
}

# file content
file {'/var/www/html/404.html/index.html':
    content =>  'Hello World!',
}

# restarting nginx
service {'nginx start':
    ensure  =>  'running',
    require => Package['nginx'],
}