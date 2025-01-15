#!/bin/bash

# Warna
blue='\033[34;1m'
cyan='\033[36;1m'
red='\033[31;1m'
yellow='\033[33;1m'

# Direktori
scanning="$HOME/sudah_terinstall"
scanning1="$HOME/Toolsv7"
scanning2="/data/data/com.termux"

while true; do
  if [ -d "$scanning2" ]; then
    if [[ -f "$scanning" && -d "$scanning1" ]]; then
      cd "$scanning1"
      git pull origin main &> /dev/null
      echo -e "${red} Memeriksa Update Toolsv7!!"
      cd Toolsv7
      clear
      git pull origin main &> /dev/null
      echo -e "${red} Memeriksa Update Toolsv7!!"

      # Periksa file Thonxyzz404.sh
      if [ -f "Thonxyzz404.sh" ]; then
        echo -e "${blue} File Thonxyzz404.sh ditemukan!"
        bash Thonxyzz404.sh
        exit 0
      else
        echo -e "${red} File Thonxyzz404.sh tidak ditemukan!"
        exit 1
      fi

    else
      clear
      echo -e "${cyan} Proses Instalasi Yang Di Butuhkan Toolsv7 Harap Tunggu Sebentar!!$yellow"
      sleep 5

      # Instalasi dependencies
      pkg update && pkg upgrade -y
      pkg install python2 python3 bash coreutils grep git mpv ffmpeg sox -y
      pip install psutil
      pip2 install bash
      wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O $PREFIX/bin/yt-dlp &> /dev/null
      chmod a+rx $PREFIX/bin/yt-dlp &> /dev/null

      # Clone repository
      cd $HOME
      git clone https://github.com/Cyber404119/Toolsv7.git
      cd Toolsv7
      git pull origin main &> /dev/null

      # Clone repository lagi
      git clone --depth 32 https://github.com/Yzz404/Toolsv7.git
      cd Toolsv7
      git pull origin main &> /dev/null
      echo -e "${red} Sedang Mengupdate Toolsv7!!"
      clear

      # Buat file sudah_terinstall
      echo "BY GALIRUS OFFICIAL EDITING" > $scanning
      clear
      echo -e "${cyan} Semua Instalasi Sudah Terinstall Terimakasih Sudah Bersabar!!"
      sleep 3
    fi
  else
    echo -e "${yellow} Hanya Khusus Di Termux Saja!!"
    sleep 5
    exit 0
  fi
done