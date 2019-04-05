
# This will install the docker package for Nagios and configure it for you
# Docker needs to be installed before running this.

# https://hub.docker.com/r/jasonrivers/nagios

# Work out of the profile for now.. this will change I am sure
cd ~

# Generate a folder structure for docker data
echo "Generating folder structure for Nagios"
mkdir docker
mkdir docker/nagios
mkdir docker/nagios/etc
mkdir docker/nagios/var
mkdir docker/nagios/plugins
mkdir docker/nagios/nagiosgraph-var
mkdir docker/nagios/nagiosgraph-etc

echo "Pulling jasonrivers/nagios:latest"
sudo docker pull jasonrivers/nagios:latest

echo "Starting Nagios"
sudo docker run --name nagios4  \
  -v /docker/nagios/etc/:/opt/nagios/etc/ \
  -v /docker/nagios/var:/opt/nagios/var/ \
  -v /docker/nagios/plugins:/opt/Custom-Nagios-Plugins \
  -v /docker/nagios/nagiosgraph-var:/opt/nagiosgraph/var \
  -v /docker/nagios/nagiosgraph-etc:/opt/nagiosgraph/etc \
  -p 0.0.0.0:8080:80 jasonrivers/nagios:latest \
  -d \
  --restart

echo "Nagios should be now active on port 8080"
