# Lösung – Übung 04: Zero Trust

## 1. Prinzip + Abgrenzung

- **Zero Trust:** kein Vertrauen aufgrund Netz-Standort; jede Anfrage wird je Ressource authentifiziert/autorisiert/verifiziert (Identität + Gerät + Kontext), least privilege, assume breach.
- **Klassisch (Perimeter / „Burg & Burggraben"):** harter Perimeter, innen implizit vertraut → wer drin ist, bewegt sich frei (Lateral Movement). ZT entfernt dieses implizite Vertrauen.

## 2. ZTA-Modell (Beispiel)

```
Subjekt(User+Device) ──Anfrage──> [PEP]  --prüft bei-->  [PDP: Policy Engine + Administrator]  (Control Plane)
                                   │                         ^   nutzt Signale: MFA, Device-Health, Kontext
                                   └── nach Freigabe ──> Ressource   (Data Plane)
```
- **PDP** entscheidet (Policy Engine wertet Signale, Administrator stellt Verbindung her/aus), **PEP** setzt durch, **Control Plane** = Entscheidung, **Data Plane** = Datenfluss nach Freigabe.

## 3. Lab-Controls → ZT-Prinzipien

| ZT-Prinzip | Lab-Control |
|------------|-------------|
| Starke Identität | MFA/FIDO2, Key/Cert-Auth (`authentication`) |
| Mikrosegmentierung | VLANs + strikte Ost-West-Regeln |
| Continuous verification | SIEM/Logins-Monitoring, Re-Auth |
| Assume breach | Honeypots/Detection, Egress-Deny |
| Least privilege | minimale Firewall-/Account-Rechte |

## 4. Schritte + Grenze

- Schritte: (1) MFA überall erzwingen, (2) Ost-West-Regeln verschärfen (Mikrosegmentierung statt flachem LAN), (3) Zugriff an Device-/Kontext-Signale koppeln (z. B. nur über Bastion mit MFA).
- Grenze: echte ZT braucht ein **Policy-/Identity-Fabric** (Komplexität/Tooling), Legacy-Systeme ohne moderne Auth lassen sich schwer einbinden → compensating (Proxy/Bastion davor).

## Hinweise / Troubleshooting

- Zero Trust ist **kein Produkt**, sondern ein Architektur-/Prinzip-Ansatz.
- ZT **ergänzt** Segmentierung/Defense in Depth (nicht ersetzen).
- Ohne starke Identität (MFA) kein Zero Trust – Identität ist der neue Perimeter.
