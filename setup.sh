#!/data/data/com.termux/files/usr/bin/bash

set -e

clear
echo "[*] Starting Termux setup..."

read -p "Enter your future username: " USERNAME

echo "[*] Updating system..."
pkg update -y && pkg upgrade -y

termux-setup-storage

echo "[*] Installing basic packages..."
pkg install -y figlet lolcat git micro curl wget

clear
echo "Select your user type:"
echo "[1] Hacker (offensive cybersecurity)"
echo "[2] Web Developer"
echo "[3] Low level Developer"

read -p "> " TYPESETUP

case "$TYPESETUP" in
  1)
    echo "[*] Installing hacker toolkit..."

    pkg install -y python php nodejs sqlite nmap whois dnsutils hydra dirb

    mkdir -p ~/tools ~/laboratory

    cd ~/tools
    git clone https://github.com/sqlmapproject/sqlmap
    git clone https://github.com/lanmaster53/recon-ng
    git clone https://github.com/aboul3la/Sublist3r
    git clone https://github.com/voidh7/Logger-hell

    cd ~/laboratory
    git clone https://github.com/omerbenamram/VulnerablePHP
    git clone https://github.com/juice-shop/juice-shop
    git clone https://github.com/LukaTheBrave/dvwa-lit
    echo "[✓] Installed : SqlMap, Recon-NG, Sublist3r, Logger-Hell, VulterablePHP, Juice-Shop, Dvwa-lit"
    ;;
    
  2)
    echo "[*] Installing web dev environment..."

    pkg install -y python nodejs php
    mkdir -p ~/projects
    echo "[✓] Installed : Python, Nodejs, Php"
    ;;

  3)
    echo "[*] Installing Languages..."
    pkg install clang nasm -y
    echo "[*] Installing Tools..."
    pkg install micro make cmake -y
    mkdir -p ~/projects
    echo "[✓] Installed : Gcc, Clang++, Nasm, Make, Cmake, Micro"
    ;;
    
  *)
    echo "[!] Invalid option. Exiting."
    exit 1
    ;;
esac

echo "[*] Configuring shell..."

cat <<EOF >> ~/.bashrc

clear
figlet "Welcome back" | lolcat
export PS1="[$USERNAME@termux \\W]\\$ "

EOF

echo
echo "[✓] Termux environment configured successfully."
