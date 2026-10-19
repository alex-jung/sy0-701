# Lösung – Übung 02: Attack Surface & Vectors

## 1. Definition

- **Attack Surface:** alle angreifbaren Punkte (z. B. offener SSH-Port, Web-App, Nutzer).
- **Threat Vector:** der **Weg** eines Angriffs (z. B. Phishing-Mail, USB-Stick, ungepatchter Dienst).

## 2. Attack Surface des Labs (Beispiel)

- Hosts: OPNsense (WAN/LAN), Kali, Ziel-VMs.
- Dienste/Ports (nmap): z. B. SSH 22, Web 80/443, SMB 445 (Metasploitable), VPN-UDP.
- Web-Apps: DVWA, Keycloak.
- Nutzer/Zugänge: SSH-/IdP-Logins.
- Physisch: Mini-PC/Schrank.
```bash
nmap -sV <lab-subnet>/24     # offene Dienste verifizieren
```

## 3. Vektoren → Gefahr → Gegenmaßnahme

| Vektor | Lab-Gefahr | Gegenmaßnahme |
|--------|-----------|---------------|
| Phishing (message) | Credential-Diebstahl | Awareness, MFA |
| Removable media (USB) | Malware-Einschleppung | USB-Policy, Scanning |
| Vulnerable software | Exploit (Metasploitable) | Patch/Segmentierung |
| Unsupported/EOL | keine Patches | Isolation/Ersatz |
| Open ports | Scan/Exploit | unnötige Dienste aus |
| Default credentials | triviale Übernahme | Passwörter ändern |
| Unsecure network | Sniffing/MITM | Segmentierung/VPN/TLS |
| Supply chain | kompromittiertes Image | Hash/Signatur, Pinning |

## 4. Surface Reduction (Beispiele)

1. Nicht benötigte Dienste/Ports abschalten (Hardening).
2. Default-Credentials ändern + ungenutzte Konten entfernen.
3. Segmentierung + Deny-by-default (Angriffsfläche „einzäunen").

## Hinweise / Troubleshooting

- „Weniger ist sicherer": jeder Dienst/Account/Software = zusätzliche Fläche.
- Verwundbare Lab-VMs (Metasploitable) bewusst **isolieren** (compensating control).
- Supply Chain wird oft vergessen – gehört zur Surface (`risk-management` 07).
