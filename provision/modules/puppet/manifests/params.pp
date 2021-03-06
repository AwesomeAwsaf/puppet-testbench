# == Class: puppet::params
#
# This class manages the Puppet parameters.
#
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
# This class file is not called directly.
#
class puppet::params {

  $client_ensure = 'latest'
  $server_ensure = 'latest'

  case $::osfamily {
    'redhat': {
      $server_package_name = 'puppet-server'
      $server_service_name = 'puppetmaster'
    }
    'debian': {
      #$server_package_name = 'puppetmaster-passenger'
      #$server_service_name = 'apache2'
      $server_service_name = 'puppetmaster'
      $server_package_name = 'puppetmaster'
    }
    default: {
      fail("Module 'puppet' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
