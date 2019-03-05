DO_BOX_URL = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
PRIVATE_KEY_PATH = "./id_rsa"
TOKEN = "YOUR_TOKEN"

Vagrant.configure("2") do |config|
  config.vm.define "droplet1" do |droplet|
    droplet.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = PRIVATE_KEY_PATH
      override.vm.box = 'digital_ocean'
      override.vm.box_url = DO_BOX_URL
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      provider.token = TOKEN
      provider.image = 'ubuntu-18-04-x64'
      provider.region = 'nyc1'
      provider.size = '512mb'

      override.vm.provision "shell" do |shell|
        shell.path = "droplet1/droplet1.sh"
      end
    end
  end
end
