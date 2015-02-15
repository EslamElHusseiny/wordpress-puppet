class wordpress::config{

    File{
        ensure => file,
        mode   => '0644',
        owner  => 'root',
        group  => 'sys',
    }

    Exec { path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin'}

    exec { 'create wp db':
        command => 'mysql -u root -e "create database wp"',
        unless  => 'mysql -u root -e "show databases"|grep -w wp',
    }

    file { '/var/apache2/2.2/wordpress/wp-config.php' :
        source => 'puppet:///modules/wordpress/wp-config.php',
    }

    file { '/etc/apache2/2.2/conf.d/wp.conf' :
        source => 'puppet:///modules/wordpress/wp.conf',
    }
}