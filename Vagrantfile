# -*- mode: ruby -*-
# vi: set ft=ruby :
#
$script = <<SCRIPT
# This script installs the latest stable version of docker.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y install docker-ce
docker build -t parity-builder - < Dockerfile
docker run --rm --entrypoint cat parity-builder /build/parity/target/release/parity > /vagrant/parity
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "file", source: "Dockerfile", destination: "Dockerfile"

  config.vm.provision "shell", inline: $script

end
