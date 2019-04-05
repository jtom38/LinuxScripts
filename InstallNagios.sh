# Script was built with the assistance of https://linuxize.com/post/how-to-install-and-configure-nagios-on-ubuntu-18-04/

echo Please wait as we configure Nagios 4.4.3

sudo apt update && sudo apt upgrade
sudo apt install autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev
sudo apt install libmcrypt-dev libssl-dev bc gawk dc build-essential libnet-snmp-perl gettext
sudo apt install git -y

# Change the the directory for source code to be placed
cd /usr/src/

# Download the file
sudo wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.3.tar.gz

# Untar
sudo tar zxf nagios-4.4.3.tar.gz

# Remove tarball
sudo rm nagios-4.4.3.targ.gz

# Move into the directory
cd nagios-4.4.3

# Compile for apache
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all

# Creates nagios user and groups
sudo make install-groups-users

# Gives nagios account access to apache data
sudo usermod -a -G nagios www-data

sudo make install
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi
sudo make install-daemoninit

# Lets us access the web interface with nagiosadmin and the password defined
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo systemctl restart apache2

# Update firewall to allow apache
sudo ufw allow Apache

# Change dir to /usr/src
cd /usr/src

# Download plugins and untar
sudo git clone https://github.com/nagios-plugins/nagios-plugins.git
cd nagios-plugins

# Build and install
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install

sudo systemctl start nagios

# At this point nagios is active over http