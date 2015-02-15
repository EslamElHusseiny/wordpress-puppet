class wordpress::install{
    
    $packages =['php-53', 'mysql-55', 'mysql-55/client', 'apache-22', 'wget']

    package { $wordpress::install::packages:
        ensure   => installed,
        provider => pkg,
    }

    exec { 'download wp':
        command => '/usr/bin/wget -O /tmp/wp.tar.gz https://wordpress.org/latest.tar.gz',
    }

    exec { 'untar wp':
        command => '/usr/bin/tar zxvf /tmp/wp.tar.gz',
        require => Exec['download wp'],
    }

    exec { 'mv wp':
        command => '/usr/bin/mv /tmp/wordpress /var/apache2/2.2',
        require => [Package[$wordpress::install::packages], Exec['untar wp']],
    }
}
