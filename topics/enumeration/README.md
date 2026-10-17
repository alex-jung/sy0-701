# Thema: Enumeration

Praxis-Übungen zur **Enumeration** – dem gezielten „Ausquetschen" bereits entdeckter Dienste (aus `reconnaissance` + `network-scanning`), um Benutzer, Shares, Versionen, Konfigurationen und weitere Angriffspunkte zu gewinnen. Enumeration ist die Brücke zwischen *Scannen* („welche Ports/Dienste gibt es?") und *Exploitation* („wie komme ich rein?").

> ⚠️ **Nur im eigenen, isolierten Lab.** Enumeration ist **aktiv** – du interagierst direkt mit den Zieldiensten. Ausschließlich gegen eigene Lab-Ziele (Metasploitable, DVWA, eigene VMs).

## Lernziele

- Dienste gezielt enumerieren: SMTP, SMB, SNMP, NFS, RPC/NetBIOS, LDAP, Datenbanken, Web
- Benutzernamen, Shares, Exports, Policies und Default-Credentials finden
- Anonyme/Null-Session-Zugänge und schwache Konfigurationen erkennen
- Enumeration-Ergebnisse als strukturierte Angriffsfläche dokumentieren

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Enumeration als Angriffsphase, Misconfigurations, Default-Credentials, Information Disclosure
- **4.0 Security Operations** – Hardening, sichere Dienstkonfiguration, Monitoring
- **1.0 General Security Concepts** – Ports/Protokolle, Authentifizierungs-Grundlagen

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Dienst/Port | Schwierigkeit |
|----|-------|-------------|---------------|
| 01 | SMTP User Enumeration | 25/tcp | 1/10 |
| 02 | SMB Enumeration – Basics (Null Session, Shares) | 139/445 | 2/10 |
| 03 | SNMP Enumeration | 161/udp | 3/10 |
| 04 | NFS Enumeration | 2049/111 | 4/10 |
| 05 | NetBIOS / RPC Enumeration | 137/135/111 | 5/10 |
| 06 | SMB Deep Enumeration (User, Gruppen, Policies) | 139/445 | 6/10 |
| 07 | LDAP Enumeration | 389/636 | 7/10 |
| 08 | Datenbank-Enumeration (MySQL/PostgreSQL) | 3306/5432 | 8/10 |
| 09 | Web Content & Directory Enumeration | 80/443 | 9/10 |
| 10 | Vollständige Enumeration + Report | alle | 10/10 |

## Lab-Voraussetzungen

- **Kali Linux** – Tools: `smtp-user-enum`, `smbclient`, `smbmap`, `enum4linux(-ng)`, `rpcclient`, `nbtscan`, `snmpwalk`, `onesixtyone`, `snmp-check`, `showmount`, `rpcinfo`, `ldapsearch`, `mysql`, `psql`, `gobuster`/`ffuf`/`feroxbuster`, `nmap` (NSE)
- **Metasploitable 2/3** – bietet fast alle Dienste (SMTP, Samba/SMB, SNMP*, NFS, RPC, MySQL, PostgreSQL)
- **DVWA** – für Web-Enumeration (Übung 09)
- **Wortlisten** – `seclists` (`sudo apt install seclists`), `rockyou` u. a.
- Optional: **OpenLDAP-VM** (nur Übung 07 – Setup dort beschrieben), SNMP ggf. auf einem Ziel aktivieren

Reihenfolge: starte bei `01-smtp-enumeration/`. Pro Übung erst die `.md` lösen, dann `solution.md` öffnen.
