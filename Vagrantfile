Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.network "33.33.33.10"
  config.vm.share_folder "v-root", "/vagrant", "."
  config.vm.customize do |vm|
    vm.memory_size = 1024
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"
  
    # You may also specify custom JSON attributes:
    chef.json.merge!({
                       :mysql => {:server_root_password => "walkah" },
                       :hosts => ["d6.dev", "d7.dev"]
                     })
  end
end
