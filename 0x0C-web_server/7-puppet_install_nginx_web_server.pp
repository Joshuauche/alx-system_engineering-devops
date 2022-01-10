# install nginx
include stdlib
package { 'nginx':
    ensure  =>  'installed',
}


file_line { 'redirecting':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    line   => 'rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent',
    port   =>  80,
}

file {'/var/www/html/404.html/index.html':
    content =>  'Hello World!',
}