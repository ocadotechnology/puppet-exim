# == Define: exim::authenticator
#
# This module configures a single authenticator in exims configuration
#
# === Parameters
#
# [*driver*]
#  driver to use for the authenticator
#
# [*public_name*]
#  How to anounce the authenticator to the outside (PLAIN/LOGIN)
#
# [*server_condition*]
#  The authentication check
#
# [*server_secret*]
#  The server secret
#
# [*server_set_id*]
#  Set the $authenticated_id variable for later use
#
# [*server_prompts*]
#  Promt used in the smtp session to ask for data  (User: Password:)
#
# [*client_name*]
#  This string is expanded, and the result used as the user name data when
#   computing the response to the server's challenge
#
# [*client_secret*]
#  This option must be set for the authenticator to work as a client; its
#  value is expanded and the result used as the secret string when computing
#  the response
#

define exim::authenticator (
  $driver,
  $public_name,
  $server_condition = undef,
  $server_set_id    = undef,
  $server_prompts   = undef,
  $server_secret    = undef,
  $client_name      = undef,
  $client_secret    = undef,
  ){
  concat::fragment { "authenticator-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/authenticator/authenticator.erb"),
    order   => 5001,
  }
}
