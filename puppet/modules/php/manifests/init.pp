class php {

	package { ['php5-fpm','php5-cli', 'php5-mysql', 'php5-imagick', 'imagemagick']:
	  ensure => present,
	  require => Exec['apt-get update'],
	}

	service { 'php5-fpm':
	  ensure => running,
	  require => Package['php5-fpm'],
	}

        # Disable default php.ini file
        #file { '/etc/php5/fpm/php.ini':
        #    ensure => absent,
        #    require => Package['php5-fpm'],
        #}

	# Add customized php.ini, increase max post size
        #file { '/etc/php5/fpm/php.ini':
        #    ensure => file,
	#    notify => Service['php5-fpm'],
        #    source => 'puppet:///modules/php/php.ini',
	#    require => [
	#	File['disable-default-php-ini'],
	#	Package['php5-fpm'],
	#    ],
        #}
}
