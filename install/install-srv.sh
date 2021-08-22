# VAR
URI="https://raw.githubusercontent.com/Jxtopher/config/main"
USER="chris"
RSA_KEY_PUB="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCm0LL0DztzfyfaFG94cBnAmjXAljrRpIcU0Kr5vv/Jw51O9siIzWkwv+LxgCjzB95Rzx7BcoOYnP/Yh1RRRwvmcys45KpXwwRg3qevYtsZ9JTys+qt2oWwECfvo5FaS0x09mLn3NBClatJotQR81SnKOxq30K8iJFnA/XIX8RTGURfTFawVAQV3wWN3mo3yyJDm9TWlBeQqczVEwDFcNBHLZMObFwP2cv0CvKJAt51ODPF6EMcqkXRdqcJ/BuzWgRpdxfuNX9GTwBEWAKtdgnevh4BWoPKjH9w/s8wmX/6nYACK4ReaazxFIqCk3XCTvpsAA73tLlcBh0zCcQ/4Bf9AqTiNp17tIkxJADWl5tvrXCdNa/rHheK5vIsfrD1pmmEdlzYxtjwT85JFjZomMHnwcGcm8YMPCMwDTES4eym0erwTOwf3j3/b/bjgKj2kd3ggtaRH7R3kX5rck5X92xZfkQmz4I+vDeu8j1CvN+o5MortlnPLLS5L0DY0Vdn+NXMylpcpwEl4A0RaO3a6UcxbIZF8QmmDOl7dpMIxKC104bt9wXmwnJ2jHWXGeMGRAWlBj0BLGOQFYBKFhpKwjbSrK4RqhOeCLMpYNy8e3K5AgITPPWh0VbguOBb6FWVu0j6Pc00KrVf89MT0abxwxMiQvskuztNQvRg5rhEt6AL9w== chris@Zeus"

# OS Check
source /etc/os-release
if ! [[ "$VERSION_ID" =~ ^(11|10)$ ]] || ! [ "$ID" = 'debian' ] ; then
  >&2 echo "[-] Bad os version, only debian 10 and 10"
  exit 1
fi

if [ "$USER" = "" ] || ! grep -q "$USER:" /etc/passwd ; then
  >&2 echo "[-] User not fond"
  exit 1
fi

# # Install screen
# sudo apt-get install -y screen
# wget $(URI)/.screenrc -O /etc/screenrc

# # vim
# apt-get install -y vim
# wget $(URI)/vimrc -O /etc/vimrc

# Privilage
# apt-get install -y sudo
PATH_AUTHORIZED_KEYS="/home/$USER/.ssh/authorized_keys"
if [ ! -f $PATH_AUTHORIZED_KEYS ]; then
    mkdir -p "/home/$USER/.ssh/" && touch $PATH_AUTHORIZED_KEYS
fi

if ! grep -q "$RSA_KEY_PUB" $PATH_AUTHORIZED_KEYS ; then
  echo $RSA_KEY_PUB > /home/chris/.ssh/authorized_keys
fi

# # sshd
# apt-get install -y openssh-server
# wget $(URI)/sshd_config -O /etc/sshd_config
# systemctl restart sshd

# # nftables
# wget $(URI)/nftables.conf -O /etc/nftables.conf
# systemctl restart nftables
