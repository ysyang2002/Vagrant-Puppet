class tools {

	package { ['gawk']:
	  ensure => present,
	  require => Exec['apt-get update'],
	}
}
