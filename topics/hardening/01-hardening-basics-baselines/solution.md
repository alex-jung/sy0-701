# Lösung – Übung 01: Hardening-Grundlagen

## 1. Attack-Surface-Reduktion (Beispiele)

- **Dienst:** nicht benötigtes Telnet/FTP/distcc abschalten → ein Exploit-Weg weniger (vgl. `exploitation-metasploit`).
- **Account:** ungenutzte/Default-Konten entfernen, kein direkter root-Login → weniger Brute-Force-/PrivEsc-Ziel.
- **Port:** offene Ports schließen/filtern → weniger im Scan sichtbar (`network-scanning`).

## 2. Prinzipien ↔ Schritte

- **Least Functionality:** nur nötige Pakete/Dienste (minimal install).
- **Least Privilege:** kein unnötiges sudo/SUID, Dienste als eigener unprivilegierter User.
- **Secure Defaults:** SSH key-only, Firewall default-deny, starke Crypto ab Werk.

## 3. Secure Baseline & Drift

Eine **Baseline** = dokumentierter, geprüfter Soll-Zustand (Pakete, Dienste, Configs, Rechte). **Drift** = Abweichung davon (jemand öffnet einen Port, installiert ein Tool). Erkennung per **Configuration Management** (Ansible/Puppet) + regelmäßigem **Audit** (Lynis/SCAP, Übung 02) → Soll/Ist-Vergleich.

## 4. Benchmarks

| Standard | Zweck |
|----------|-------|
| **CIS Benchmark** | konkrete, breit genutzte Härtungs-Checklisten je OS/Software |
| **DISA STIG** | strengere US-Regierungs-/Militär-Vorgaben |
| **NIST (800-53/-123)** | Control-Framework/Guidelines (höhere Ebene) |

## 5. Verknüpfung zu Angriffen

| Angriff (Thema) | Hardening-Prinzip |
|-----------------|-------------------|
| Enumeration/Scanning | Dienste/Ports reduzieren (Least Functionality) |
| PrivEsc (SUID/sudo) | Least Privilege, Rechte-Audit |
| Brute-Force | Secure Defaults (MFA/Lockout/Key-Auth) |
| Lateral Movement | Segmentierung (Defense in Depth) |

## Häufige Fehler / Troubleshooting

- **„Härten = alles abschalten":** Balance mit Funktionsfähigkeit; erst testen, dann durchsetzen.
- **Keine Baseline dokumentiert:** ohne Soll kein Drift-Nachweis.
- **Einmal gehärtet, nie geprüft:** Drift → regelmäßige Audits/CM.
