Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Forward port 8080-8089
  for i in 8080..8089
    config.vm.network :forwarded_port, guest: i, host: i
  end

  # install docker and add user vagrant to group docker
  config.vm.provision "shell", inline: <<-SHELL
     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
     add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
     apt-get update
     apt-get -y dist-upgrade
     apt-get install -y \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        docker-ce
     usermod -aG docker vagrant
  SHELL

  # run test container
  config.vm.provision "shell",run: "always", inline: <<-SHELL
    chmod a+x /vagrant/test_script.sh
    /vagrant/test_script.sh
  SHELL
end
