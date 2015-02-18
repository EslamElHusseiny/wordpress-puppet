class wordpress::service{

    service { 'apache22':
        ensure => running,
        enable => true,
    }
}