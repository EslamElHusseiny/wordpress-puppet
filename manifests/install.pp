class wordpress::install{
    
    $packages =['php-53', 'mysql-55', 'mysql-55/client', 'apache-22', 'wget']

    Exec {
        path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        cwd  => '/var/apache2/2.2',
    }

    package { $wordpress::install::packages:
        ensure   => installed,
        provider => pkg,
    }

    exec { 'download wp':
        command => 'wget https://wordpress.org/latest.tar.gz',
        unless  => 'test -e wordpress',
    }

    exec { 'untar wp':
        command => 'tar zxvf latest.tar.gz',
        unless  => 'test -e wordpress',
    }

    exec { 'rm archive':
        command => 'rm latest.tar.gz',
        onlyif  => 'test -e latest.tar.gz',
    }
}
