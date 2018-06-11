
class php {

    exec { 'add-php-repo': 
        command => '/usr/bin/apt-add-repository ppa:ondrej/php',
        require => Exec['apt-get update']
    }

    package { [ 'php7.2-cli', 'php7.2-fpm']:
      ensure => present,
      require => Exec['apt-get update']
    }

    service { 'php7.2-fpm':
      ensure => running,
      require => Package['php7.2-fpm'],
    }
}