group { 'puppet':
    ensure => present,
}

exec { 'apt-get update': 
    command => '/usr/bin/apt-get update',
}

package { 'nano':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

include nginx, php