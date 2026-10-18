# Tools

Referenz zu allen Tools, die in den Übungen verwendet werden. Pro Tool eine `.md` mit Zweck und den wichtigsten Optionen. Gedacht als schnelles Nachschlagewerk – die ausführliche Anwendung steht jeweils in der konkreten Übung.

> Alle Tools nur gegen eigene, autorisierte Lab-Ziele verwenden.

## Scanning & Netzwerk

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [nmap](nmap.md) | Scanning | Universeller Port-/Service-/OS-Scanner inkl. Scripting (NSE) |
| [netdiscover](netdiscover.md) | Discovery | Aktives/passives ARP-Host-Discovery |
| [arp-scan](arp-scan.md) | Discovery | Schnelles ARP-Scanning im lokalen Segment |
| [masscan](masscan.md) | Scanning | Ultraschneller Port-Sweep über große Ranges |
| [ip](ip.md) | Netzwerk | Interfaces, Adressen, Routen anzeigen/konfigurieren |
| [ping](ping.md) | Netzwerk | Erreichbarkeit + TTL per ICMP prüfen |
| [traceroute](traceroute.md) | Netzwerk | Pfad/Hops zum Ziel ermitteln |
| [tcpdump](tcpdump.md) | Capture | Paketmitschnitt auf der Kommandozeile |
| [wireshark](wireshark.md) | Capture | Grafische Paketanalyse |
| [netcat (nc)](netcat.md) | Netzwerk | TCP/UDP-Verbindungen, Banner-Grabbing, Listener |
| [iptables](iptables.md) | Firewall | Linux-Paketfilter (zum Erzeugen von `filtered`-Ports) |
| [p0f](p0f.md) | Fingerprinting | Passives OS-Fingerprinting (nur mithören) |
| [proxychains](proxychains.md) | Pivoting | Tools durch einen SOCKS/HTTP-Proxy tunneln |
| [ssh](ssh.md) | Zugriff/Pivoting | Secure Shell inkl. Port-Forwarding / SOCKS-Proxy |
| [xsltproc](xsltproc.md) | Reporting | nmap-XML in HTML-Report wandeln |

## Reconnaissance & OSINT

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [whois](whois.md) | OSINT | Domain-/IP-Registrierungsdaten abfragen |
| [dig](dig.md) | DNS | Mächtigste DNS-Abfrage (Records, AXFR, Reverse) |
| [host](host.md) | DNS | Kompakte DNS-Abfrage |
| [nslookup](nslookup.md) | DNS | Klassische/plattformübergreifende DNS-Abfrage |
| [dnsenum](dnsenum.md) | DNS-Enum | DNS-Recon inkl. AXFR + Subdomain-Brute-Force |
| [dnsrecon](dnsrecon.md) | DNS-Enum | Flexible DNS-Enumeration (AXFR/Brute/Reverse) |
| [bind9](bind9.md) | DNS-Server | Eigener DNS-Server als Lab-Ziel (Zonentransfer) |
| [subfinder](subfinder.md) | Subdomains | Passive Subdomain-Enumeration |
| [amass](amass.md) | Subdomains | Attack-Surface-Mapping (passiv/aktiv) |
| [whatweb](whatweb.md) | Web | Technology-Fingerprinting von Websites |
| [wafw00f](wafw00f.md) | Web | WAF-Erkennung |
| [httpx](httpx.md) | Web | Schnelles Live-/Status-Probing von Hosts |
| [curl](curl.md) | HTTP | Header/robots/APIs abrufen |
| [theHarvester](theharvester.md) | OSINT | E-Mails/Hosts/Subdomains aggregieren |
| [exiftool](exiftool.md) | Metadaten | Metadaten lesen/entfernen (inkl. GPS) |
| [metagoofil](metagoofil.md) | Metadaten | Öffentliche Dokumente sammeln + auswerten |
| [shodan](shodan.md) | OSINT | Suchmaschine für exponierte Geräte/Dienste |
| [censys](censys.md) | OSINT | Alternative Internet-Scan-Suchmaschine |
| [jq](jq.md) | Hilfstool | JSON aus APIs filtern/auswerten |

## Enumeration (Dienste)

| Tool | Dienst | Zweck |
|------|--------|-------|
| [smtp-user-enum](smtp-user-enum.md) | SMTP | Gültige Benutzerkonten ermitteln |
| [smbclient](smbclient.md) | SMB | Shares auflisten/zugreifen (Null Session) |
| [smbmap](smbmap.md) | SMB | Shares + Berechtigungen anzeigen |
| [enum4linux](enum4linux.md) | SMB | All-in-one SMB/Samba-Enumeration |
| [rpcclient](rpcclient.md) | MSRPC | User/Gruppen/RIDs/Policy abfragen |
| [nbtscan](nbtscan.md) | NetBIOS | NetBIOS-Namen/Workgroup/MAC scannen |
| [nmblookup](nmblookup.md) | NetBIOS | NetBIOS-Namenstabelle eines Hosts |
| [snmpwalk](snmpwalk.md) | SNMP | MIB-Baum abfragen |
| [onesixtyone](onesixtyone.md) | SNMP | Community-Strings bruteforcen |
| [snmp-check](snmp-check.md) | SNMP | Aufbereitete SNMP-Gesamtübersicht |
| [showmount](showmount.md) | NFS | Exports auflisten |
| [rpcinfo](rpcinfo.md) | RPC | portmapper/RPC-Dienste auflisten |
| [ldapsearch](ldapsearch.md) | LDAP | Directory/User/Gruppen abfragen |
| [mysql](mysql.md) | MySQL | DB-Client: Datenbanken/User/Privilegien |
| [psql](psql.md) | PostgreSQL | DB-Client: Datenbanken/Rollen/Tabellen |
| [gobuster](gobuster.md) | Web/DNS | Directory-/DNS-/VHost-Brute-Force |
| [ffuf](ffuf.md) | Web | Flexibler Web-Fuzzer (`FUZZ`) |
| [feroxbuster](feroxbuster.md) | Web | Rekursiver Content-Scanner |

## Vulnerability Scanning

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [greenbone](greenbone.md) | Scanner | Umfassender Netz-Vuln-Scanner (OpenVAS/GVM) |
| [nessus](nessus.md) | Scanner | Kommerzieller Scanner (Essentials gratis, optional) |
| [nikto](nikto.md) | Web | Webserver-Vuln-/Misconfig-Scanner |
| [wpscan](wpscan.md) | Web | WordPress-Scanner (Plugins/Themes/User) |
| [nuclei](nuclei.md) | Web/Infra | Template-basierter Scanner (CVEs/Exposures) |
| [searchsploit](searchsploit.md) | Exploit-Recherche | Versionen/CVEs → Exploit-DB mappen |

## Exploitation

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [metasploit](metasploit.md) | Framework | msfconsole: Exploits/Payloads/Meterpreter/DB |
| [msfvenom](msfvenom.md) | Payloads | Standalone-Payloads generieren (+ multi/handler) |

## Web Exploitation

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [burpsuite](burpsuite.md) | Proxy | Intercepting Proxy / Repeater für Web-Tests |
| [zaproxy](zaproxy.md) | Proxy/Scanner | OWASP ZAP – Proxy + aktiver Scanner (Burp-Alternative) |
| [sqlmap](sqlmap.md) | SQLi | Automatische SQL-Injection + DB-Dump |
| [hydra](hydra.md) | Brute-Force | Online-Login-Brute-Force (SSH/HTTP-Form/SMB/…) |

## Password Attacks

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [hashcat](hashcat.md) | Offline-Cracking | GPU-Cracker (Wortliste/Rules/Masks) |
| [john](john.md) | Offline-Cracking | John the Ripper (CPU, Auto-Format, Rules) |
| [hashid](hashid.md) | Identifikation | Hash-Typ + Hashcat-Mode bestimmen |
| [crunch](crunch.md) | Wortlisten | Listen nach Länge/Muster generieren |
| [cewl](cewl.md) | Wortlisten | Zielbezogene Liste von Website scrapen |
| [netexec](netexec.md) | Netz-Credentials | PtH/Spraying/Enum über SMB/WinRM (ex-crackmapexec) |

## Privilege Escalation

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [linpeas](linpeas.md) | Enumeration | Auto-PrivEsc-Enum Linux/Windows (PEASS-ng) |
| [pspy](pspy.md) | Monitoring | Prozesse/Cron live ohne root beobachten |
| [linux-exploit-suggester](linux-exploit-suggester.md) | Kernel | passende Kernel-Exploits vorschlagen |
| [gtfobins](gtfobins.md) | Referenz | GTFOBins/LOLBAS – Binaries für PrivEsc missbrauchen |

## Post-Exploitation & Pivoting

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [sshuttle](sshuttle.md) | Pivoting | Subnetz-VPN über SSH (ohne proxychains) |
| [chisel](chisel.md) | Pivoting | TCP-Tunnel/SOCKS über HTTP/WebSocket |
| [ligolo-ng](ligolo-ng.md) | Pivoting | TUN-basiertes „VPN"-Pivoting |
| [sliver](sliver.md) | C2 | Open-Source Command-&-Control-Framework |

*(Pivoting nutzt außerdem [metasploit](metasploit.md), [proxychains](proxychains.md), [ssh](ssh.md), [netexec](netexec.md).)*

## Wireless Security

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [aircrack-ng](aircrack-ng.md) | WLAN-Suite | Monitor/Scan/Capture/Deauth/Crack |
| [hcxtools](hcxtools.md) | WLAN | PMKID/Handshake capturen + → hashcat 22000 |
| [reaver](reaver.md) | WLAN/WPS | WPS-PIN-Brute & Pixie-Dust (+bully) |
| [airgeddon](airgeddon.md) | WLAN-Framework | All-in-one inkl. Evil Twin/Enterprise |
| [wifite](wifite.md) | WLAN | automatisiertes WLAN-Audit |

*(WLAN-Cracking nutzt außerdem [hashcat](hashcat.md), Mode 22000.)*

## Social Engineering

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [setoolkit](setoolkit.md) | SE-Framework | Credential Harvester / Spear-Phishing (autorisiert) |
| [gophish](gophish.md) | Awareness | Phishing-Simulation + Metriken |
| [swaks](swaks.md) | SMTP | Mail-/SPF-/DMARC-Verhalten testen |

*(SE nutzt außerdem [theHarvester](theharvester.md) für OSINT und [msfvenom](msfvenom.md) für Payloads.)*

## Active Directory

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [impacket](impacket.md) | AD-Toolsammlung | Roasting/DCSync/secretsdump/psexec/relay |
| [bloodhound](bloodhound.md) | Angriffspfade | AD-Graph + SharpHound-Collector |
| [responder](responder.md) | LLMNR/Relay | NetNTLM-Hashes abfangen |
| [kerbrute](kerbrute.md) | Kerberos | User-Enum & Password Spraying |
| [mimikatz](mimikatz.md) | Credential/Ticket | LSASS-Dump, DCSync, Golden Ticket (Windows) |

*(AD nutzt außerdem [netexec](netexec.md) (PtH/Enum) und [hashcat](hashcat.md) (Modes 18200/13100/5600).)*

## Blue Team: Firewall & IDS/IPS

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [opnsense](opnsense.md) | Firewall | Perimeter: Regeln, NAT, Segmentierung, VPN, HA, Logging |
| [suricata](suricata.md) | IDS/IPS | Signaturbasierte Erkennung/Prevention (auf OPNsense) |
| [zeek](zeek.md) | NSM | Metadaten-/Verhaltens-Analyse, Beaconing, Threat Hunting |

*(Blue Team nutzt außerdem [tcpdump](tcpdump.md)/[wireshark](wireshark.md) und zum Testen die offensiven Tools wie [nmap](nmap.md).)*

## Blue Team: Logging/SIEM & Packet Analysis

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [wazuh](wazuh.md) | SIEM/HIDS/XDR | zentrales Logging, Detection-Regeln, Dashboards, FIM |
| [rsyslog](rsyslog.md) | Logging | zentrales Syslog sammeln/weiterleiten |
| [tshark](tshark.md) | Packet Analysis | CLI-PCAP-Analyse (skriptbar) |

*(Packet Analysis nutzt v. a. [wireshark](wireshark.md)/[tcpdump](tcpdump.md); Logging/SIEM bindet [opnsense](opnsense.md)/[suricata](suricata.md)/[zeek](zeek.md) als Quellen ein. ELK/OpenSearch als SIEM-Alternative siehe logging-siem Übung 09.)*

## Blue Team: Incident Response & Hardening

| Tool | Kategorie | Zweck |
|------|-----------|-------|
| [volatility](volatility.md) | Memory-Forensik | RAM-Images analysieren (Prozesse/C2/Injection) |
| [sleuthkit](sleuthkit.md) | Disk-Forensik | Dateisystem/Timeline/gelöschte Dateien (+Autopsy) |
| [lynis](lynis.md) | Hardening-Audit | Linux-Härtung auditieren (Hardening-Index) |

*(IR nutzt außerdem Imaging (`dd`/`dc3dd`), `avml`/LiME (RAM), `plaso` (Super-Timeline), Containment via [opnsense](opnsense.md) und Detection aus [wazuh](wazuh.md)/[suricata](suricata.md). Hardening nutzt SCAP/CIS, Vuln-Scanner [greenbone](greenbone.md)/[nmap](nmap.md) und Ansible.)*
