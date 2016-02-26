#!/bin/sh

# Run on VM to bootstrap Puppet Master server
if 
 ps aux | grep "puppet master" | grep -v grep 2> /dev/null
 then
    echo "Puppet Master is already installed. Exiting..."
     sudo puppet agent --enable 
     sudo puppet agent --test
 else
    echo "Puppet Master should have been installed using the puppet provisioner but apt-get update & upgrade now"
fi
    echo "apt-get update & upgrade now"
    #sudo apt-get update -yq 2> /dev/null && sudo apt-get upgrade -yq 2> /dev/null #&&
    
    #sudo puppet resource package puppetmaster ensure=latest &&
    #sudo service puppetserver restart

    