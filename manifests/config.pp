# == Class: qpid::config
#
# Handles Qpid configuration
#
class qpid::config {

  group { $qpid::group:
    ensure => present
  } ->
  user { $qpid::user:
    ensure => present,
    groups => [$qpid::user_groups],
  }

  # Qpidd 0.24+ expects the config file in this location
  file { '/etc/qpid/qpidd.conf':
    ensure  => file,
    content => template('qpid/qpidd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Qpidd 0.18 and 0.22 expects the config file in this location
  file { '/etc/qpidd.conf':
    ensure => link,
    target => '/etc/qpid/qpidd.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/sysconfig/qpidd':
    ensure  => file,
    content => template('qpid/sysconfig.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
