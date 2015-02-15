class wordpress::service{

    service { 'mysql':
        ensure   => running,
        enable   => true,
        provider => smf,
    }

    service { 'apache22':
        ensure => running,
        enable => true,
    }
}