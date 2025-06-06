#!/bin/bash
easter_egg() {
    clear
    echo -e "\033[1;32mMenjalankan Mode Matrix...\033[0m"
    sleep 1
    echo -e "\e[1;32m"
    yes "010101010101010101010101010101" | pv -qL 100
    echo -e "\e[0m"
    echo
}

kirim_wa_twilio() {
    clear
    echo -e "\033[1;36m--- KIRIM WHATSAPP VIA TWILIO ---\033[0m"

    # Ganti ini dengan datamu dari Twilio
    ACCOUNT_SID="AKUN_SID_KAMU"
    AUTH_TOKEN="TOKEN_KAMU"
    FROM="whatsapp:+14155238886"  # Sandbox Twilio
    TO="whatsapp:+62XXXXXXXXXX"   # Nomor tujuan (sudah join sandbox)
    read -p "Masukkan pesan: " PESAN

    curl -X POST https://api.twilio.com/2010-04-01/Accounts/$ACCOUNT_SID/Messages.json \
    --data-urlencode "From=$FROM" \
    --data-urlencode "To=$TO" \
    --data-urlencode "Body=$PESAN" \
    -u $ACCOUNT_SID:$AUTH_TOKEN

    echo -e "\n\033[1;32mPesan dikirim (jika sandbox sudah aktif dan nomor sudah join).\033[0m"
}

ip_lookup() {
    clear
    echo -e "\033[1;36m--- IP LOOKUP ---\033[0m"
    read -p "Masukkan IP target: " ip
    curl -s http://ip-api.com/json/$ip | jq
    echo
}

trace_target() {
    clear
    echo -e "\033[1;36m--- TRACEROUTE ---\033[0m"
    read -p "Masukkan domain/IP target: " target
    traceroute $target
    echo
}

virus_prank() {
    clear
    echo -e "\033[1;31m--- VIRUS SIMULATOR ---\033[0m"
    echo "Memulai penghapusan sistem..."
    for i in {1..10}; do
        echo "Menghapus system32 [$i/10]..."
        sleep 0.3
    done
    echo -e "\033[1;32mSistem kamu aman, cuma prank Bro 😎\033[0m"
    echo
}

passgen() {
    clear
    echo -e "\033[1;36m--- PASSWORD GENERATOR ---\033[0m"
    read -p "Panjang password: " panjang
    openssl rand -base64 48 | cut -c1-$panjang
    echo
}

base64_encode() {
    clear
    echo -e "\033[1;36m--- ENCODE BASE64 ---\033[0m"
    read -p "Masukkan teks biasa: " teks
    echo "$teks" | base64
    echo
}

base64_decode() {
    clear
    echo -e "\033[1;36m--- DECODE BASE64 ---\033[0m"
    read -p "Masukkan teks base64: " teks
    echo "$teks" | base64 -d
    echo
}
ddos_ping() {
    clear
    echo -e "\033[1;31m--- DDoS Ping Flood ---\033[0m"
    read -p "Masukkan IP / domain target: " target
    read -p "Jumlah ping (misal 1000): " jumlah
    echo -e "\033[1;33mMenyerang $target dengan $jumlah ping...\033[0m"
    ping -f -c $jumlah $target
    echo -e "\033[1;32mSelesai!\033[0m"
}

red='\033[1;31m'
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
cyan='\033[0;36m'
white='\033[1;37m'
nc='\033[0m'
banner() {
    clear
    echo
    bash install.sh
    echo
    echo -e "${red}"
    echo '  ██╗  ██╗██╗  ██╗ █████╗ ██╗'
    echo '  ██║ ██╔╝██║ ██╔╝██╔══██╗██║'
    echo '  █████╔╝ █████╔╝ ███████║██║'
    echo '  ██╔═██╗ ██╔═██╗ ██╔══██║██║'
    echo '  ██║  ██╗██║  ██╗██║  ██║███████╗'
    echo '  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝'
    echo -e "${white}      TOOLS BY: Khai Sigma Abis
      MODIFIKASI : Zannnyx
      TIKTOK : Khai
      IG : opedzzz13
${nc}"
    echo -e "${cyan}═══════════════════════════════════════════════${nc}"
    echo -e "${green}[+] Memuat sistem..."
    sleep 0.5
    echo -e "[+] Inisialisasi tools..."
    sleep 0.5
    echo -e "[+] Siap digunakan.${nc}"
    echo -e "${cyan}═══════════════════════════════════════════════${nc}"
}

while true; do
    banner
    echo -e "${yellow}[ MENU UTAMA ]${nc}"
    echo -e "${cyan}[1]${nc} Tampilkan Info HP"
    echo -e "${cyan}[2]${nc} Cek Lokasi GPS"
    echo -e "${cyan}[3]${nc} Status Baterai Detail"
    echo -e "${cyan}[4]${nc} Download Video dari YouTube"
    echo -e "${cyan}[5]${nc} Tambah Followers"
    echo -e "${cyan}[6]${nc} Hack Account google"
    echo -e "${cyan}[7]${nc} DDOS attack"
    echo -e "${cyan}[8]${nc} IP Loopkup"
    echo -e "${cyan}[9]${nc} Traceroute Target"
  echo -e "${cyan}[10]${nc} Virus"
  echo -e "${cyan}[11]${nc} Password Generator"
  echo -e "${cyan}[12]${nc} Base64 Encode"
  echo -e "${cyan}[13]${nc} Base64 Decode"
  echo -e "${cyan}[14]${nc} spam w.a/band"
  echo -e "${cyan}[14]${nc} menu easter_egg"
    echo -e "${cyan}[99]${nc} Keluar"
    echo ""
    echo -ne "${green}Pilih opsi (1-99): ${nc}"
    read pilihan

    case $pilihan in
        1)
            echo -e "\n${yellow}[INFO] Menampilkan info perangkat...${nc}"
            sleep 1
            bash show_info.sh
            read -p $'\n[ Tekan enter untuk kembali ke menu... ]'
            ;;
        2)
            echo -e "\n${yellow}[INFO] Mengambil lokasi GPS...${nc}"
            sleep 1
            loc=$(termux-location)
            lat=$(echo "$loc" | grep latitude | awk '{print $2}' | tr -d ',')
            lon=$(echo "$loc" | grep longitude | awk '{print $2}' | tr -d ',')
            echo -e "${green}Latitude : $lat"
            echo -e "Longitude: $lon"
            echo -e "Link Maps: https://maps.google.com/?q=$lat,$lon${nc}"
            read -p $'\n[ Tekan enter untuk kembali ke menu... ]'
            ;;
        3)
            echo -e "\n${yellow}[INFO] Mengecek status baterai...${nc}"
            sleep 1
            termux-battery-status
            read -p $'\n[ Tekan enter untuk kembali ke menu... ]'
            ;;
        4)
            echo -e "\n${yellow}[INFO] Download video dari YouTube...${nc}"
            echo -ne "${cyan}Masukkan link YouTube: ${nc}"
            read link
            echo -ne "${cyan}Masukkan nama file (tanpa .mp4): ${nc}"
            read filename
            yt-dlp -f mp4 "$link" -o "${filename}.mp4"
            echo -e "${green}Download selesai! File disimpan sebagai ${filename}.mp4${nc}"
            read -p $'\n[ Tekan enter untuk kembali ke menu... ]'
            ;;
        5)
    echo -e "\\n${yellow}[INFO] Mengarahkan ke situs Fayupedia...${nc}"
    sleep 1
    termux-open-url "https://fayupedia.my.id"
    read -p $'\n[ Tekan enter untuk kembali ke menu... ]'
    ;;
7)
        ddos_ping
        ;;
8)
        ip_lookup
        ;;
    9)
        trace_target
        ;;
    10)
        virus_prank
        ;;
    11)
        passgen
        ;;
    12)
        base64_encode
        ;;
    13)
        base64_decode
        ;;
        14) kirim_wa_twilio ;;
        15) easter_egg ;;
99)
    echo -e "\\n${red}[!] Keluar...${nc}"
    exit
    ;;
        *)
            echo -e "${red}[!] Opsi tidak valid!${nc}"
            sleep 1
            ;;
    esac
done
