# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    config.vm.network :forwarded_port, guest: 3000, host: 3000    # rails
    config.vm.network :forwarded_port, guest: 4000, host: 4000    # jekyll

    config.vm.provision :shell, :inline => 'apt-get update'
    config.vm.provision :shell, :inline => 'sudo apt-get install build-essential --no-upgrade --yes'

    config.vm.provision "chef_solo" do |chef| 
        chef.add_recipe "ruby_build"
        chef.add_recipe "chef_gem"
        chef.add_recipe "rvm::system"
    end
end
