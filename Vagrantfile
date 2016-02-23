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
		     nodeconfig.vm.hostname = node_values[':hostname'] #+ '.' + domain
			 
			 nodeconfig.vm.network :private_network, ip: node_values[':ip']#, auto_config: false # adapter:2, 
			 #nodeconfig.vm.network :private_network, type: "dhcp"
			 #nodeconfig.ssh.insert_key=false

			 if node_values[':fwdhost1']
        		nodeconfig.vm.network :forwarded_port, guest: node_values[':fwdguest1'], host: node_values[':fwdhost1'], id: node_values[':portid1'], auto_correct: true
      		 end

      		 if node_values[':fwdhost2']
        		nodeconfig.vm.network :forwarded_port, guest: node_values[':fwdguest2'], host: node_values[':fwdhost2'], id: node_values[':portid2'], auto_correct: true
      		 end


		     #nodeconfig.vm.network :forwarded_port, guest: node_values[':fwdguest1'], host: node_values[':fwdhost1'], id: node_values[':portid1'], auto_correct: true
		     #nodeconfig.vm.network :forwarded_port, guest: node_values[':fwdguest2'], host: node_values[':fwdhost2'], id: node_values[':portid2'], auto_correct: true
			 
			 nodeconfig.vm.synced_folder "testdata", "/test_data", create: true

			 #nodeconfig.vm.synced_folder "./", "/vagrant", disabled: true
			 #nodeconfig.vm.synced_folder "../data", "/vagrant_data", create: true
			 #nodeconfig.vm.synced_folder "./", "/vagrant", type: "rsync", rsync__exclude: ".git/"
			 		#rsync__args: ["--verbose", "--rsync-path='sudo rsync'", "--archive", "--delete", "-z"]
			 ### Need to run ###vagrant rsync### on host to trigger rsync OR 
			 ### Need to run ###"vagrant rsync-auto &"### command on the host to start the rsync on host and watch the sync from HOST-> GUEST in live
			 
			 nodeconfig.vm.post_up_message = node_values[':msg']

			  
				if  node_values[':guestos']
			 		nodeconfig.vm.guest = node_values[':guestos']
			 		nodeconfig.vm.communicator = node_values[':vmcomm'] 
    		 		nodeconfig.winrm.username = "vagrant"
			 		nodeconfig.winrm.password = "vagrant"
			 		nodeconfig.windows.halt_timeout = 15
				end
			 

			 nodeconfig.vm.provider :virtualbox do |vb, override|
				vb.customize ["modifyvm", :id, "--memory", node_values[':ram']]
				vb.customize ["modifyvm", :id, "--name", node_name]
				vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
				if  node_values[':gui']
					vb.gui = node_values[':gui']
				end
				vb.cpus = node_values[':cpu']
			end

	      #node_config.vm.provision :shell, :path => node_values[':bootstrap']
	   

	      #node_config.vm.provision :puppet do |puppet|
	        #puppet.manifests_path = 'provision/manifests'
	        #puppet.module_path = 'provision/modules'
	    end
	end
end	