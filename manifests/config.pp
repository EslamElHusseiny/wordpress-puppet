class wordpress::config{

    File{
        ensure => file,
        mode   => '0644',
        owner  => 'root',
        group  => 'sys',
    }

    exec { 'create wp db':
        command => '/usr/bin/mysql -u root -e "create database wp"',
    }

    file { '/var/apache2/2.2/wordpress/wp-config.php' :
        source => 'puppet:///modules/wordpress/wp-config.php',
    }

    file { '/etc/apache2/2.2/conf.d/wp.conf' :
        source => 'puppet:///modules/wordpress/wp.conf',
    }
}