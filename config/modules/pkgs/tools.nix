{ pkgs, ...}: {

environment.systemPackages = with pkgs; [
    ### Recon 
    netdiscover 
    rustscan 
    nmap 
    ### Network scanning & enumeration 
    smtp-user-enum
    braa
    onesixtyone
    net-snmp
    nfs-utils
    netcat-gnu 
    netexec 
    inetutils 
    ### Info gathering 
    dig 
    dnsenum # run via shell -p dnsenum 
    ### Web enumeration 
    sqlmap
    zap
    burpsuite
    chromium
    gobuster 
    ffuf
    nikto 
    whatweb 
    ### Network traffic & MITM 
    proxychains-ng
    wireshark 
    tshark 
    ettercap 
    responder 
    ### SMB / Active Directory / AD analysis 
    smbmap
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
    sqsh
    evil-winrm
    rdesktop
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
