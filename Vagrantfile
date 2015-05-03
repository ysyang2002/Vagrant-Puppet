Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  #config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.11"

  #config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
  #config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end
end
