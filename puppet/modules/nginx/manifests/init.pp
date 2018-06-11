class nginx {

    # Symlink guest /var/www/app to host /vagrant
    # file { '/var/www/app':
    #   ensure  => 'link',
    #   target  => '/vagrant/app',
    # }

    package { 'nginx':
      ensure => 'present',
      require => Exec['apt-get update'],
    }

    service { 'nginx':
      ensure => running,
      require => Package['nginx'],
    }

    # Disable default nginx vhost
    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    # Virtual Hosts
    ###############################

    # Add vhost template
    file { 'vhost-symdemo':
        path => '/etc/nginx/sites-available/symdemo.conf',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/symdemo.conf',
    }

    # # Symlink our vhost in sites-enabled
    file { 'vhost-symdemo-enable':
        path => '/etc/nginx/sites-enabled/symdemo.conf',
        target => '/etc/nginx/sites-available/symdemo.conf',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vhost-symdemo'],
            File['default-nginx-disable'],
        ],
    }
}