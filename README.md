🛡️ Bugbunti PRO – Overkill Menu Edition (2025)

Automated Recon & Offensive Toolkit · Bash

Bugbunti PRO es una herramienta integral para pentesters, analistas de seguridad y entusiastas de ciberseguridad. Incluye módulos nativos (sin dependencias) y módulos PRO que integran herramientas profesionales como Nmap, Nikto, FFUF, Subfinder, Nuclei, enum4linux-ng, entre otras.

Esta versión “Overkill Menu Edition” combina velocidad, estética, automatización y potencia ofensiva en un solo script Bash totalmente interactivo.


---

🚀 Características principales

🔹 Módulos nativos (no requieren ninguna instalación)

Escaneo de puertos 1–1024 con bash puro

Directory bruteforce con curl

Bruteforce de HTTP Basic Auth

Generador automático de Reverse Shell (texto + base64)


🔹 Módulos PRO (requieren instalación previa)

Nmap rápido (safe)

Nmap FULL agresivo

Nikto + FFUF automáticos (Ataque Web Completo)

Enumeración SMB avanzada (enum4linux-ng + smbclient + NSE SMB)

Subfinder (Subdominios)

Subdomain Takeover (Subfinder + Nuclei)

Nuclei (severidad High/Critical)

Modo NUKEM TOTAL: Nmap + Nuclei + SMB a la vez


🔹 Instalador PRO (automático)

Un solo módulo ([50]) instala:

nmap

nikto

ffuf

smbclient

git

whois

jq

curl/wget

enum4linux-ng desde GitHub

subfinder (última versión)

nuclei (última versión)



---

📦 Instalación

🔹 1. Clonar el repositorio

git clone https://github.com/TU-USUARIO/bugbunti-pro.git
cd bugbunti-pro

🔹 2. Dar permisos de ejecución

chmod +x bugbunti_pro1.sh

🔹 3. Ejecutar

./bugbunti_pro1.sh


---

🔧 Instalar todas las herramientas (PRO Installer)

Desde el menú opción:

[50] Installer PRO Completo (instala TODO)

O manualmente:

./bugbunti_pro1.sh
# Selecciona opción 50


---

🧰 Requisitos

Linux (Debian, Ubuntu, Parrot, Kali, Arch, Termux)

Bash 5+

Permiso sudo (para instalar herramientas PRO)



---

📑 Estructura del proyecto

bugbunti_pro1.sh        # Script principal
README.md               # (Este archivo)


---

📷 Capturas (opcional)

Puedes añadir imágenes aquí cuando las subas a GitHub.


---

🛠️ Tecnologías utilizadas

Bash

Curl / Wget

Nmap

Nikto

FFUF

Subfinder

Nuclei

enum4linux-ng

smbclient



---

⚠️ Aviso Legal

Esta herramienta es únicamente para:

pruebas autorizadas

auditorías de seguridad

fines educativos


No la utilices contra sistemas sin permiso.
El desarrollador no se hace responsable del mal uso.


---

🤝 Contribuciones

Las contribuciones son bienvenidas:

mejoras

corrección de bugs

nuevos módulos


Puedes abrir un Pull Request o Issue en GitHub.


---

📬 Contacto

Si deseas mejorar o personalizar tu herramienta, puedo ayudarte a extenderla.
