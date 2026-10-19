# Lösung – Übung 01: Architektur-Modelle & Grundlagen

## 1. Prinzipien + Lab-Beispiel

- **Security by Design:** Lab von Anfang an segmentiert (VLANs), nicht nachträglich „abgesichert".
- **Least Privilege:** Firewall erlaubt nur nötige Ports; Accounts minimal berechtigt.
- **Fail-secure:** Default-Deny – fällt eine Regel aus, wird geblockt (nicht freigegeben).
- **Minimize Attack Surface:** nur benötigte Dienste/VMs laufen.
- **Defense in Depth:** Firewall + IDS + Hardening + SIEM gestapelt.

## 2. Deployment-Varianten

| Modell | Sicherheits-Implikation |
|--------|-------------------------|
| On-prem | volle Kontrolle, aber volle Verantwortung (Patch/Physik) |
| Cloud | Shared Responsibility, Fehlkonfig häufigste Lücke |
| Hybrid | Schnittstellen/Identity-Föderation absichern |
| Multi-Cloud | Komplexität, uneinheitliche Controls |

## 3. Besonderheiten

- **Serverless:** kein OS-Patching (Provider), aber Fokus auf Code/Permissions/Secrets; kurze Lebensdauer.
- **Container/Microservices:** Isolationsgrenzen (Kernel-sharing), Image-Supply-Chain, viele Ost-West-Verbindungen → Mikrosegmentierung.
- **IoT/ICS:** oft nicht patchbar, lange Lebensdauer, proprietär → Segmentierung/Monitoring statt Patch (compensating).

## 4. Eigenes Lab

- Modell: **On-prem virtualisiert** (Proxmox) + Segmentierung (OPNsense/VLAN).
- Trade-offs: (1) bewusst verwundbare Legacy-VMs (Lernwert vs. Risiko → Isolation); (2) Ein-Personen-Betrieb (keine echte Separation of Duties → akzeptiert); (3) keine HA (Kosten vs. Verfügbarkeit).

## Hinweise / Troubleshooting

- Architektur = Trade-offs sichtbar machen/begründen, nicht „alles maximal sicher".
- Cloud verschiebt Verantwortung, entfernt sie nicht (Shared Responsibility, Übung 06).
- IoT/ICS: Patchbarkeit prüfen, sonst isolieren/monitoren.
