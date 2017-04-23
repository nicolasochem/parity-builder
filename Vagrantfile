# -*- mode: ruby -*-
# vi: set ft=ruby :
#

if ENV['RUST_VERSION']
    RUST_VERSION = ENV['RUST_VERSION']
else
    RUST_VERSION = "stable"
end

if ENV['PARITY_VERSION']
    PARITY_VERSION = ENV['PARITY_VERSION']
else
    PARITY_VERSION = "stable"
end

$script = <<SCRIPT.gsub("$RUST_VERSION", RUST_VERSION).gsub("$PARITY_VERSION", PARITY_VERSION)

echo "Building parity version $PARITY_VERSION with Rust version $RUST_VERSION."

# Install dependencies
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y install docker-ce

# Build in a container
docker build -t parity-builder --build-arg RUST_VERSION=$RUST_VERSION --build-arg PARITY_VERSION=$PARITY_VERSION  .

#Copy back parity binary to Vagrant host
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
