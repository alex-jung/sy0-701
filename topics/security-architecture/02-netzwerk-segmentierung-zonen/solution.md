# Lösung – Übung 02: Segmentierung & Zonen

## 1. Zonen-Modell (Beispiel)

```
Internet(WAN) ── OPNsense ── DMZ (öffentliche Dienste)
                     │
                     ├── LAN (interne Clients/Server)
                     ├── MGMT (OPNsense-Mgmt, SIEM-Admin)  [nur von Bastion]
                     ├── LAB-ISOLATED (Metasploitable/Honeypot, Egress-Deny)
                     └── RESTRICTED (sensible Daten/Keys)
```
Übergänge nur über die Firewall, Default-Deny.

## 2. System-Platzierung

| System | Zone |
|--------|------|
| Öffentlicher Webserver | DMZ |
| Interne DB | LAN/Restricted |
| OPNsense-Mgmt-IF | MGMT |
| Honeypot | LAB-ISOLATED |
| Kali (Angreifer) | LAB (eigenes Segment) |
| Metasploitable | LAB-ISOLATED (kein Internet) |

## 3. Firewall-Regeln (Beispiel)

- WAN→DMZ: nur 443/80 zum Webserver. WAN→LAN/MGMT/Restricted: block.
- DMZ→LAN: nur definierter App→DB-Port; sonst block (kompromittierte DMZ darf nicht ins LAN).
- LAN→DMZ/Internet: nur nötiges.
- MGMT: erreichbar nur von **Bastion**; alles andere block.
- LAB-ISOLATED→*: Egress-Deny (nur Log zum SIEM).

## 4. Nord-Süd/Ost-West + Bastion

- **Nord-Süd:** Verkehr durch den Perimeter (Internet↔intern) – klassisch von der Firewall kontrolliert.
- **Ost-West:** Verkehr **zwischen** internen Systemen – oft ungefiltert → Lateral Movement; Mikrosegmentierung nötig (Übung 04).
- **Jump Host/Bastion:** einziger, überwachter Eintrittspunkt ins MGMT-Netz → reduziert Angriffsfläche, zentrales Logging/MFA.

## Hinweise / Troubleshooting

- DMZ→intern muss streng sein: eine kompromittierte DMZ ist einkalkuliert.
- Management-Netz **nie** direkt aus LAN/Internet erreichbar (Bastion + MFA).
- VLAN allein ≠ Sicherheit: erst die **Firewall-Regeln** zwischen VLANs schaffen Zonen.
