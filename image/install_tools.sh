
#!/bin/bash
apt update \
&& apt install -y \
apt-transport-https \
ca-certificates \
gnupg-agent \
software-properties-common \
less \
unzip \
nmap \
curl \
wget \
git \
vim
apt-get clean