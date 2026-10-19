# Lösung – Übung 03: Defense in Depth

## 1. Schichten + Lab-Controls (Beispiel)

| Schicht | Lab-Control |
|---------|-------------|
| Perimeter | OPNsense-Firewall, Suricata IPS |
| Netz | VLAN-Segmentierung, Deny-by-default |
| Host | Hardening/CIS, Lynis, Patch-Mgmt, (EDR/AV) |
| Applikation | Input-Validierung, WAF, DVWA-Lehren |
| Daten | Verschlüsselung at-rest/in-transit, Zugriffsrechte |
| Identität | MFA, Least Privilege, Key/Cert-Auth |
| Mensch/Prozess | Awareness, IR-Playbooks, Logging/SIEM |

## 2. Angriffspfad „extern → Web → DB"

| Schicht | Stoppt/erkennt |
|---------|----------------|
| Perimeter | Firewall lässt nur 443; IPS blockt Exploit-Signaturen |
| Applikation | Input-Validierung/WAF gegen SQLi |
| Host | gehärteter Webserver, kein überflüssiger Dienst |
| Netz | Web-VLAN darf nur definierten DB-Port (Segmentierung) |
| Daten | DB-Rechte minimal, Secrets verschlüsselt |
| Detektion | SIEM-Alarm auf anomale DB-Queries |

Fällt eine Schicht (z. B. WAF-Lücke), fangen Segmentierung + Least Privilege + Detection den Rest ab.

## 3. Single Point

Beispiel: Perimeter nur durch **eine** Firewall-Regel geschützt, keine Detektion → zweite, unabhängige Control ergänzen: **IDS/IPS** (detective/preventive) + SIEM-Alarm. Ziel: kein einzelnes Versagen = Totalausfall.

## 4. DiD vs Zero Trust

Defense in Depth stapelt **mehrere Schichten**, vertraut aber internen Zonen oft implizit („innen = sicher"). **Zero Trust** entfernt dieses implizite Vertrauen: jede Anfrage wird **authentifiziert/autorisiert/verifiziert** (Identität, Gerätezustand), unabhängig vom Standort („never trust, always verify", Mikrosegmentierung). Beides ergänzt sich – ZT ist eine moderne Ausprägung/Erweiterung von DiD, kein Ersatz.

## Hinweise / Troubleshooting

- Mehr Schichten ≠ automatisch besser: Komplexität/Kosten gegen Risiko abwägen.
- Diversität beachten: 3× dasselbe Produkt = eine gemeinsame Lücke (monokultur).
