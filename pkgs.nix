{ pkgs, ... }:
let
  pkgslist = with pkgs; [
    # Essentials
    git
    python3
    wget
    curl
    zsh
    netcat-gnu
    wordlists
    python2
    unrar
    unzip
    p7zip
    zip
    unzip
    freerdp3
    remmina
    tigervnc
    samba
    openvpn
    util-linux
    vim

    # Cracking
    thc-hydra
    hashcat
    hashcat-utils
    john

    # Exploits
    metasploit
    pwntools
    exploitdb
    go-exploitdb
    sploitscan

    # Web
    ffuf
    burpsuite
    caido
    sqlmap
    dirb
    wfuzz
    gobuster
    wpscan
    nikto

    # Networking
    rustscan
    nmap
    wireshark
    tcpdump
    smbmap
    knockpy

    # Reverse and Binary
    gdb
    pwndbg
    autopsy
    ghidra-bin

    # Forensics and Steganography
    stegseek
    autopsy
    binwalk
    exiftool

    # Windows
    enum4linux-ng
    mimikatz
    powersploit
    nbtscan
    bloodhound
    netexec
  ];
in pkgslist
