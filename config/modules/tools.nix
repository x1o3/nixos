{ pkgs, ...}: {

environment.systemPackages = with pkgs; [
    exiftool
    binwalk
    crunch
    netcat-gnu
    nmap
    wireshark
    tshark
    aircrack-ng
    metasploit
    hydra
    john
    ettercap
    # samba
    responder
    rustscan
    enum4linux
    enum4linux-ng
    wifite2
    burpsuite
    netdiscover
    gobuster
    nikto
    hashcat
    bloodhound
  ];
}
