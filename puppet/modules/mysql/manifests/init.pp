class mysql {
  package { ['mysql-server', 'php5-mysqlnd']:
    ensure => present,
    require => Exec['apt-get update'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    mode => 644,
    require => Package['mysql-server'],
    notify  => Service['mysql'],
  }

}
