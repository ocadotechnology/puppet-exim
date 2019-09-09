# == class: exim::install
#
# This class installes the exim package
#
class exim::install {
  if ($::exim::heavy) {
    $exim_packages = $::exim::params::exim_heavy_package
  }
  else {
    $exim_packages = $::exim::params::exim_light_packages
  }
  package { $exim_packages:
    ensure => $::exim::pkg_ensure,
  }
}
