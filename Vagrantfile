
Vagrant.configure("2") do |config|

  config.vm.box = "AntonioMeireles/coreos-alpha"
  config.vm.network :private_network, ip: "192.168.80.100"

  config.vm.synced_folder ".", "/var/docker",
    :type => :nfs,
    :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1']

  config.vm.provider "virtualbox" do |v|
    v.name = "docker-atlassian"
    v.auto_nat_dns_proxy = false
    v.customize ["modifyvm", :id, "--memory", 3048, "--cpus", 4]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "off" ]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "off" ]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]
  end

  config.vm.provision "shell", path: "vagrant/setup.sh"
end
