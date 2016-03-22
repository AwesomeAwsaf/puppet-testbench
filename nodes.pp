#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' { 
  class { 'puppet_lint': }
  class { 'helloworld': }
  class { 'host_entries': }
}

##### CLIENTS

node 'node1-ubuntu' {
  class { 'helloworld': }
  class { 'host_entries': }
  class { 'puppetconfigfile': }
  #class { 'puppetexec':}
}

node 'node2-centos' { 
  class { 'helloworld': }
  class { 'host_entries': }
  class { 'puppetconfigfile': }
}

node 'node3-windows' {
  class { 'host_entries': }
  class { 'git': }
  class { 'helloworld': }
  class { 'flush_dns': }
  #class { '7zip': }
  #class { 'basetools': }
}
