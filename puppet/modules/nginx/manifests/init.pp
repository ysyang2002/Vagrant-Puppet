class nginx {

	# Symlink guest /var/www/app to host /vagrant
	#file { '/var/www/app':
	#  ensure  => 'link',
	#  target  => '/vagrant/app',
	#}

	package { 'nginx':
	  ensure => 'present',
	  require => Exec['apt-get update'],
	}

	service { 'nginx':
	  ensure => running,
	  require => Package['nginx'],
	}

	# Disable default nginx conf
        #file { 'disable-default-nginx-conf":
	#    path => "/etc/nginx/nginx.conf",
        #    ensure => absent,
        #    require => Package['nginx'],
        #}

        #use the customized nginx conf file
	#file { '/etc/nginx/nginx.conf':
	#  ensure => file,
	#  require => Package['nginx'],
	#  source => 'puppet:///modules/nginx/nginx.conf',
  	#}

	# Add vhost template
	file { 'vagrant-nginx':
	    path => '/etc/nginx/sites-available/127.0.0.1',
	    ensure => file,
	    require => Package['nginx'],
	    source => 'puppet:///modules/nginx/127.0.0.1',
	}

	# Add discz static url configure
        file { '/etc/nginx/discuz.conf':
            ensure => file,
            source => 'puppet:///modules/nginx/discuz.conf',
	    require => Package['nginx'],
	    notify => Service['nginx'],
        }

	# Disable default nginx vhost
	file { 'disable-nginx-default-site':
	    path => '/etc/nginx/sites-enabled/default',
	    ensure => absent,
	    require => Package['nginx'],
	}

	# Symlink our vhost in sites-enabled
	file { 'vagrant-nginx-enable':
	    path => '/etc/nginx/sites-enabled/127.0.0.1',
	    target => '/etc/nginx/sites-available/127.0.0.1',
	    ensure => link,
	    notify => Service['nginx'],
	    require => [
	        File['vagrant-nginx'],
		File['disable-nginx-default-site'],
		#File['enable-new-nginx-conf'],
	    ],
	}
}
