class wordpress::service{

    service { 'mysql':
        ensure   => running,
        enable   => true,
        require  => Class['wordpress::config'],
        provider => smf,
    }

    service { 'apache22':
        ensure  => running,
        enable  => true,
        require => Class['wordpress::config'],
    }
}