# == Class: qpid::params
#
# Default parameter values
#
class qpid::params {

  $require_encryption = true

  $ssl      = false
  $ssl_port = 5671

  $user_groups = []

  $user = 'qpidd'
  $group = 'qpidd'

}
