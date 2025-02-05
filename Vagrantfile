NUM_NODE = 1 
IP_NW = "192.168.2."
MANAGED_IP_START = 200


Vagrant.configure("2") do |config|
  config.vm.box = "generic/rhel9"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :libvirt do |libvirt|
    libvirt.cpu_mode = 'host-passthrough'
    libvirt.graphics_type = 'none'
    libvirt.default_prefix = "managed_"
    libvirt.memory = 4096
    libvirt.cpus = 2
    libvirt.qemu_use_session = false
  end


  (0..NUM_NODE-1).each do |i|
    config.vm.define "server#{i}" do |server|
      server.vm.provision "shell", path: "config.sh"
      server.vm.network :private_network, ip: IP_NW + "#{MANAGED_IP_START + i}"
    end
  end
end
