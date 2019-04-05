# Built for Ubuntu 
# This uses Samba to join the domain
# I might change this later but as joining a linux box to a domain is still new to me, lets see what happens and document the adventure.

# https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member

# Check to see if any of the samba processes are running
ps ax | egrep "samba|smbd|nmbd|winbindd"

# If the system had a install of samba already we will want to build a new config file.
# if this is a new install, skip this and the next step
smbd -b | grep "CONFIGFILE" 
  CONFIGFILE: /usr/local/samba/etc/samba/smb.conf
smbd -b | egrep "LOCKDIR|STATEDIR|CACHEDIR|PRIVATE_DIR"
  LOCKDIR: /usr/local/samba/var/lock/
  STATEDIR: /usr/local/samba/var/locks/
  CACHEDIR: /usr/local/samba/var/cache/
  PRIVATE_DIR: /usr/local/samba/private/

# Install Samba if it was not installed
echo 'Installing Samba'
sudo apt-get install samba -y

# Install ntp for network time protocol so we can keep the system clock synced with AD
echo 'Installing ntp'

# Test to make sure we are able to talk to the DNS server
nslookup DM-DC02.directorsmortgage.net

nslookup 172.20.0.183

# both of those should look correct
# Configure Kerberos


