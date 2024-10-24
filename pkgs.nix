{
  inputs,
  pkgs,
  ...
}: let
  packages = {
    general = with pkgs; [
      git
      python3
      wget
      curl
      htop
      ripgrep
      file
      zsh
      netcat-gnu
      wordlists
      unrar
      unzip
      p7zip
      zip
      cabextract
      freerdp3
      remmina
      tigervnc
      samba
      openvpn
      util-linux
      vim
      wireguard-go
      wireguard-tools
      xrdp
      dos2unix
      screen
      tmux
    ];

    cracking = with pkgs; [
      thc-hydra
      hashcat
      hashcat-utils
      john
    ];

    exploits = with pkgs; [
      metasploit
      pwntools
      exploitdb
      go-exploitdb
      sploitscan
    ];

    web = with pkgs; [
      ffuf
      dirb
      wfuzz
      gobuster
      wpscan
      nikto
      knockpy
      subfinder
      burpsuite
      caido
      sqlmap
      katana
      wapiti
    ];

    network = with pkgs; [
      wireshark
      wireshark-cli
      tcpdump
      smbmap
      rustscan
      nmap
    ];

    reverse = with pkgs; [
      checksec
      bingrep
      binwalk
      radare2
      unicorn
      gdb
      gef
      pwndbg
      ghidra-bin
      binsider.default
    ];

    forensics = with pkgs; [
      stegseek
      foremost
      autopsy
      binwalk
      exiftool
      git-secret
    ];

    windows = with pkgs; [
      enum4linux-ng
      mimikatz
      powersploit
      nbtscan
      bloodhound
      netexec
    ];
  };
in
  packages
