# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'awezone.com'

nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']

		Vagrant.configure(2) do |config|

		   nodes_config.each do |node|
		    node_name   = node[0] # name of node
		    node_values = node[1] # content of node

		    config.vm.define node_name do |nodeconfig|    

		     nodeconfig.vm.box = node_values[':box']
		     nodeconfig.vm.hostname = node_values[':hostname'] + '.' + domain
			 nodeconfig.vm.network :private_network, ip: node_values[':ip'], auto_config: false #, adapter:2, 
			 #nodeconfig.vm.network :private_network, type: "dhcp"
		     nodeconfig.vm.network :forwarded_port, guest: node_values[':fwdguest'], host: node_values[':fwdhost'], auto_correct: true
			 #nodeconfig.vm.synced_folder "../data", "/vagrant_data"
			 nodeconfig.vm.post_up_message = node_values[':msg']
				 nodeconfig.vm.provider :virtualbox do |vb|
				    vb.customize ["modifyvm", :id, "--memory", node_values[':ram']]
				    vb.customize ["modifyvm", :id, "--name", node_name]
				    vb.gui = node_values[':gui']
				    vb.cpus = node_values[':cpu']
			end
		

	      #config.vm.provision :shell, :path => node_values[':bootstrap']
	   

	      #node_config.vm.provision :puppet do |puppet|
	        #puppet.manifests_path = 'provision/manifests'
	        #puppet.module_path = 'provision/modules'
	    end
	end
end	