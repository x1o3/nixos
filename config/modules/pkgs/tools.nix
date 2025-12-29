{ pkgs, ...}: {

environment.systemPackages = with pkgs; [
    ### Recon 
    netdiscover 
    rustscan 
    nmap 
    ### Network scanning & enumeration 
    netcat-gnu 
    netexec 
    inetutils 
    ### Info gathering 
    dig 
    dnsenum # run via shell -p dnsenum 
    ### Web enumeration 
    zap
    burpsuite
    gobuster 
    ffuf
    nikto 
    whatweb 
    ### Network traffic & MITM 
    proxychains
    wireshark 
    tshark 
    ettercap 
    responder 
    ### SMB / Active Directory / AD analysis 
    samba 
    enum4linux 
    enum4linux-ng
    bloodhound 
    ### Exploitation & post-exploitation frameworks 
    metasploit 
    exploitdb 
    ### Passwords, hashes & cracking 
    john 
    hashcat 
    thc-hydra 
    crunch 
    hash-identifier
    ### Remote desktop/service clients
    freerdp 
    ### Forensics 
    hivex
    file 
    exiftool 
    hexedit 
    unixtools.xxd 
    binwalk 
    ### Wireless 
    aircrack-ng 
    wifite2 
  ];
}
