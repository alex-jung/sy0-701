# Lösung – Übung 03: Control-Platzierung

## 1. Platzierung (Beispiel)

```
WAN ─ [Firewall/IPS inline] ─ DMZ ─ [reverse proxy/WAF] ─ Webserver
                 │
                 ├─ [IDS passiv via SPAN] (Sichtbarkeit)
                 ├─ LAN ─ [forward proxy] ─> Internet
                 └─ Hosts: [EDR/HIDS]
```
- Firewall/IPS am Perimeter (blockt Nord-Süd), WAF vor der Web-App, forward proxy für Client-Egress, EDR auf Hosts, IDS passiv zur Erkennung.

## 2. IDS vs IPS Platzierung

- **IPS inline:** kann blocken, aber Ausfall/Überlast beeinflusst Verkehr → bewusst **fail-open** (Verfügbarkeit) oder **fail-closed** (Sicherheit) wählen.
- **IDS passiv (SPAN/TAP):** erkennt/alarmiert, kein Einfluss auf Verkehr, kein Single Point → gut fürs Lab/Monitoring. Für aktives Blocken IPS inline am Perimeter.

## 3. Sichtbarkeit

- **TAP:** hardware, verlustfrei, dedizierte Kopie. **SPAN/Mirror-Port:** Switch spiegelt Verkehr (im Lab: Proxmox-Bridge/Promiscuous) – einfach, aber kann bei Last Pakete verlieren.
- Grenze: **verschlüsselter** Verkehr (TLS) ist im Inhalt nicht sichtbar → nur Metadaten (vgl. `vpn-tunneling` 07); ggf. TLS-Terminierung am Reverse Proxy.

## 4. Proxy/LB

| Komponente | Zweck |
|-----------|-------|
| Forward Proxy | Client-Egress kontrollieren/filtern/loggen |
| Reverse Proxy | Server schützen/terminieren TLS/WAF davor |
| Load Balancer | Verfügbarkeit/Verteilung (+ Health Checks) |

## Hinweise / Troubleshooting

- Inline = Kontrolle + Risiko (Single Point/Latenz); redundant auslegen (HA, Übung 05).
- Fail-open vs. fail-closed ist eine **bewusste** Design-Entscheidung (Verfügbarkeit vs. Sicherheit).
- Ohne Sichtbarkeit (TAP/SPAN) kein NSM/Hunt → Platzierung früh mitdenken.
