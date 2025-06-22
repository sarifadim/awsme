#!/bin/bash

# Color variables
red='\033[0;91m'
green='\033[1;92m'
yellow='\033[1;93m'
blue='\033[1;94m'
magenta='\033[1;95m'
cyan='\033[1;96m'
# Clear the color after that
clear='\033[0m'
echo -e "$cyan"
echo "Install Socks!!"
echo -e "$clear"
wget -qO script.py https://raw.githubusercontent.com/anihsugiarti9/services/main/sokpy.py
wget https://raw.githubusercontent.com/anihsugiarti9/washil/main/myscript.service
cp myscript.service /etc/systemd/system/
sleep 1
sudo systemctl start myscript
sleep 1
sudo systemctl enable myscript
sleep 1
echo -e "$cyan"
echo "Install FRPC..!!!!"
echo -e "$clear"
wget https://github.com/fatedier/frp/releases/download/v0.50.0/frp_0.50.0_linux_amd64.tar.gz
tar -xvzf frp_0.50.0_linux_amd64.tar.gz
cd frp_0.50.0_linux_amd64
sleep 1
seq 7010 7999 > port.txt

sleep 1
PRT=$(shuf -n 1 port.txt)
USER=$1

cat > frpc.ini <<END
[common]
server_addr = 152.42.243.83
server_port = 7000

[$PRT]
type = tcp
local_ip = 127.0.0.1
local_port = 443
remote_port = $PRT
END
sleep 1
sudo mkdir -p /etc/frp
sudo cp frpc.ini /etc/frp/frpc.ini
sudo cp frpc /usr/local/bin/frpc
sleep 1
wget https://raw.githubusercontent.com/anihsugiarti9/washil/main/frpc.service
sleep 1
sudo cp frpc.service /etc/systemd/system/
sleep 1

sudo systemctl daemon-reload
sleep 1
sudo systemctl enable frpc
sleep 1
sudo systemctl start frpc
sleep 1
echo -e "${blue}Your Proxy Server:${clear}"
echo -e "$yellow"
echo 152.42.243.83:$PRT
echo -e "$clear"
echo -e "${blue}IP Address:${clear}"
echo -e "$yellow"
curl ipinfo.io/ip
echo -e "$clear"
echo
echo -e "${blue}ISP & Country:${clear}"
echo -e "$green"
curl ipinfo.io/org
curl ipinfo.io/country
echo -e "$clear"
