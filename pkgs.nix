{
  inputs,
  pkgs,
  ...
}: let
  packages = {
    general = with pkgs; [
      (pkgs.buildFHSEnv (pkgs.appimageTools.defaultFhsEnvArgs
        // {
          name = "fhs";
          profile = ''export FHS=1'';
          runScript = "$(awk -F: -v user=\"$USER\" '$1 == user {print $NF}' /etc/passwd)";
          meta = {
            description = "FHS environment that allows running dynamically linked executables on NixOS";
          };
        }))
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

    web = with pkgs;
      [
        ffuf
        dirb
        wfuzz
        gobuster
        wpscan
        nikto
        knockpy
        subfinder
        burpsuite
        sqlmap
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.hostPlatform.isx86_64) [
        caido
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
      ghidra-bin
    ];

    forensics = with pkgs;
      [
        stegseek
        foremost
        binwalk
        exiftool
        git-secret
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.hostPlatform.isx86_64) [
        autopsy
      ];

    windows = with pkgs;
      [
        enum4linux-ng
        mimikatz
        powersploit
        nbtscan
        netexec
        evil-winrm
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.hostPlatform.isx86_64) [
        bloodhound
      ];
  };
in
  packages
