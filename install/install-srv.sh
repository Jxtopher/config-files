# VAR
URI="https://raw.githubusercontent.com/Jxtopher/config/main"

# OS Check
source /etc/os-release
if ! [[ $VERSION_ID =~ ^(11|10)$ ]] || ! [ $ID = 'debian' ] ; then
  >&2 echo "[-] Bad os version"
fi

exit 0
# Install screen
sudo apt-get install -y screen
wget $(URI)/.screenrc -O /etc/screenrc

# Privilage
apt-get install sudo


# vim
apt-get install -y vim
wget $(URI)/vimrc -O /etc/vimrc

# 
apt-get install -y openssh-server
wget $(URI)/sshd_config -O /etc/screenrc


# iptables
sudo apt-get install -y iptables-persistent
