# SY0-701 Security+ Praxis-Lab

Strukturierte, praxisorientierte Übungen für die **CompTIA Security+ (SY0-701)** Prüfung und allgemeine **Cybersecurity-/Hacking-Praxis** – zum Durchführen im eigenen, isolierten Home-Lab.

Jedes Thema enthält **10 Übungen mit steigendem Schwierigkeitsgrad (1 → 10)**: Theorie, Tool-Erklärung, Lab-Setup, ein selbst zu lösender Aufgabenteil, Prüfungsbezug (SY0-701) – und die Lösung getrennt in einer `solution.md`. Jede Übung hat zusätzlich einen **Blue-Team-/Abwehrteil**.

> [!WARNING]
> **Nur für autorisiertes Testen im eigenen, isolierten Lab.** Alle offensiven Techniken richten sich ausschließlich gegen **eigene** Lab-Systeme (Metasploitable, DVWA, eigene VMs/Netze) bzw. ausdrücklich freigegebene Ziele. Angriffe auf fremde Systeme, Netze, WLANs oder Personen sind illegal. Die Inhalte dienen dem Lernen von Angriff **und** Verteidigung zu Bildungszwecken.

## Lab-Umgebung

- **Mini-PC mit Proxmox** als Virtualisierungs-Host
- **OPNsense** als Firewall/Router (Netz-Segmentierung)
- **Kali Linux** als Angreifer-/Pentest-VM
- **Metasploitable 2/3** und **DVWA** als verwundbare Ziele
- Themenspezifisch zusätzlich: WLAN-Adapter (Monitor Mode), Windows/AD-Lab, eigene Test-Dienste (BIND, OpenLDAP, WordPress …) — jeweils in der Themen-`README.md` beschrieben

## Aufbau

```
topics/
  ROADMAP.md              # alle Themen mit Status (⬜/🟡/✅), SY0-701-Domäne, Lab-Bedarf
  <thema>/
    README.md             # Themenübersicht, Lernziele, Lab-Voraussetzungen
    01-<übung>/
      <übung>.md          # Theorie · Tools · Lab-Setup · Aufgabe (selbst lösen) · Prüfungsbezug
      solution.md         # vollständige Lösung (getrennt gehalten)
      <zusatzdateien>     # optional: Skripte, Report-Vorlagen, Beispiel-Dateien
    02-<übung>/ … 10-<übung>/
tools/
  README.md               # Index aller Tools
  <tool>.md               # Zweck + wichtigste Optionen + "verwendet in"
CLAUDE.md                 # Projektregeln (Struktur, Sprache, Didaktik)
```

Didaktik: Schwierigkeit steigt pro Thema monoton (01 = geführt, 10 = offen/mehrstufig). Erst die Übung ohne `solution.md` lösen, dann abgleichen.

## Themen

Die vollständige, aktuelle Liste mit Status steht in **[`topics/ROADMAP.md`](topics/ROADMAP.md)**.

### Offensive Kill-Chain (fertig ✅)

| # | Thema | Inhalt |
|---|-------|--------|
| 1 | [reconnaissance](topics/reconnaissance/) | WHOIS/DNS, Subdomains, Google Dorking, theHarvester, Shodan |
| 2 | [network-scanning](topics/network-scanning/) | Host/Port/Service/OS-Scan, NSE, Firewall-/IDS-Evasion |
| 3 | [enumeration](topics/enumeration/) | SMB, SNMP, NFS, RPC, LDAP, DB, Web-Content |
| 4 | [vulnerability-scanning](topics/vulnerability-scanning/) | Greenbone/OpenVAS, Nessus, Nikto/Nuclei, CVE/CVSS, False Positives |
| 5 | [exploitation-metasploit](topics/exploitation-metasploit/) | Metasploit, Payloads, Meterpreter, msfvenom |
| 6 | [web-exploitation](topics/web-exploitation/) | OWASP Top 10 an DVWA: SQLi, XSS, CSRF, LFI/RFI, File Upload |
| 7 | [password-attacks](topics/password-attacks/) | Hashcat/John, Hydra, Rules/Masks, Pass-the-Hash |
| 8 | [privilege-escalation](topics/privilege-escalation/) | Linux/Windows PrivEsc, SUID, Cron, Capabilities, Kernel |
| 9 | [post-exploitation-pivoting](topics/post-exploitation-pivoting/) | Persistence, Pivoting (SSH/Chisel/Ligolo), Lateral Movement, C2 |
| 10 | [wireless-security](topics/wireless-security/) | WPA2-Handshake/PMKID, WPS, Evil Twin, WPA3/Enterprise |
| 11 | [social-engineering](topics/social-engineering/) | Phishing-Analyse, GoPhish, SET, Pretexting, Awareness |
| 12 | [active-directory-attacks](topics/active-directory-attacks/) | Kerberoasting, AS-REP, LLMNR-Relay, DCSync, BloodHound |

### Blue Team / Security Operations (fertig ✅)

| # | Thema | Inhalt |
|---|-------|--------|
| 13 | [firewall-opnsense](topics/firewall-opnsense/) | Stateful Rules, NAT, VLAN-Segmentierung, Logging, GeoIP/Blocklists, HA/CARP |
| 14 | [ids-ips](topics/ids-ips/) | Suricata (IDS/IPS), eigene Regeln, Tuning, Angriffserkennung, Zeek NSM, SOC |
| 15 | [logging-siem](topics/logging-siem/) | Zentrales Syslog, Wazuh/ELK, Parsing, Detection-Regeln, Korrelation, Threat Hunting |
| 16 | [packet-analysis](topics/packet-analysis/) | Wireshark/tshark, Display-Filter, TCP/UDP, Artefakte, Angriffs-/TLS-Analyse, PCAP-Forensik |
| 17 | [incident-response](topics/incident-response/) | IR-Lifecycle, Triage, Containment, Beweissicherung, Memory-/Disk-Forensik, Timeline, Postmortem |
| 18 | [hardening](topics/hardening/) | Baselines/CIS, Linux-/SSH-/Dienst-/Account-/Windows-Härtung, Patch-Mgmt, Netzgeräte |

**180 Übungen** · 360 Übungs-/Lösungsdateien · 100 Tool-Referenzen in [`tools/`](tools/).

Weitere geplante Blöcke (restliche Blue-Team-, Krypto/Identitäts- und GRC-Themen) sind in der [Roadmap](topics/ROADMAP.md) als ⬜ markiert.

## SY0-701-Domänen

Die Übungen mappen auf die fünf Prüfungsdomänen:
**1.0** General Security Concepts · **2.0** Threats, Vulnerabilities & Mitigations · **3.0** Security Architecture · **4.0** Security Operations · **5.0** Program Management & Oversight.

## Nutzung

1. In `topics/ROADMAP.md` ein Thema wählen.
2. Themen-`README.md` lesen (Lernziele + Lab-Voraussetzungen).
3. Pro Übung `01 → 10` vorgehen: `.md` lesen und den „Aufgabe (selbst lösen)"-Teil **ohne** `solution.md` bearbeiten.
4. Danach `solution.md` zum Abgleich öffnen.

## Lizenz / Haftungsausschluss

Bildungsmaterial. Die Nutzung erfolgt auf eigene Verantwortung und ausschließlich in autorisierten Umgebungen. Die Autoren übernehmen keine Haftung für Missbrauch.
