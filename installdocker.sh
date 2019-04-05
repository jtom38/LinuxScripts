# Made for Ubuntu

# Remove old packages if this was a existing install
sudo apt-get remove docker docker-engine docker.io containerd runc

# Add the docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Confirm the key
sudo apt-key fingerprint 0EBFCD88

# Add docker repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update packages
sudo apt-get update

# Installs docker requirements
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common


