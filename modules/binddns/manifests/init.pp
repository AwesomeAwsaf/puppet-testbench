## install DNS BIND utils

class binddns {

  #$updatecommand = $osfamily ? {
  #'Redhat'  => '/usr/bin/yum check-update',
  #'Debian'  => '/usr/bin/apt-get update',
  #'Windows' => 'choco list -la',
  #}

  $dnsutil = $osfamily ? {
    'Redhat'  => 'bind-utils.x86_64',
    'Debian'  => 'bind9utils',
    'Windows' => 'bind-toolsonly',
  }

    package { $dnsutil:
      ensure  => present,
      #require => Exec[ 'update' ]
  }

    #exec { update:
    #command => "$updatecommand",
  #}
}
