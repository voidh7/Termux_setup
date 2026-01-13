#!/data/data/com.termux/files/usr/bin/bash

# 🔄 Atualiza os pacotes
pkg update -y
pkg upgrade -y

# 📂 Solicita acesso ao armazenamento interno
termux-setup-storage

# 🧰 Instala pacotes essenciais para hacking
pkg install -y nmap
pkg install -y whois
pkg install -y iproute2
pkg install -y python3

echo "✅ Ambiente Termux configurado com sucesso!"
