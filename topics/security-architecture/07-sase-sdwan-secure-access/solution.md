# Lösung – Übung 07: SASE, SD-WAN & Secure Access

## 1. SD-WAN vs SASE

- **SD-WAN:** löst **Konnektivität/Performance** – software-definierte, zentral verwaltete WAN-Transporte (Internet/MPLS/LTE), app-aware Routing. Security nur teilweise.
- **SASE:** löst **sicheren Zugriff für verteilte Nutzer** – vereint SD-WAN **+ Cloud-Security** (SWG/CASB/ZTNA/FWaaS) an der Edge. SASE ⊇ SD-WAN + SSE.

## 2. SASE-Komponenten

| Komponente | Schutzfunktion |
|-----------|----------------|
| SWG | Web-Zugriff filtern (URL/Malware/Policy) |
| CASB | Cloud-/SaaS-Nutzung kontrollieren (Shadow IT, DLP) |
| ZTNA | app-spezifischer, identitätsbasierter Zugriff (Zero Trust) |
| FWaaS | Firewall als Cloud-Service |
| DLP | Datenabfluss verhindern |

## 3. ZTNA vs VPN

| | Klassisches VPN | ZTNA |
|---|-----------------|------|
| Zugriff | oft ganzes Netz | nur die **freigegebene App** |
| Vertrauen | implizit nach Login | kontinuierlich verifiziert (Identität/Kontext) |
| Angriffsfläche | hoch (Netz-Exposure/Pivot) | gering (keine Netz-Freigabe) |
| Bezug Lab | WireGuard/OpenVPN gibt Netzzugang → Least-Privilege-Regeln nötig | ZTNA wäre die Zero-Trust-Weiterentwicklung |

## 4. SASE-Zugriffspfad (Skizze)

```
User/Device ─> SASE-Edge (nahe PoP): [Identität/ZTNA prüft] → [SWG/FWaaS/CASB/DLP] → interne App
```
Nutzer verbindet nicht ins ganze Netz, sondern erhält nach Identitäts-/Kontextprüfung **app-spezifischen** Zugriff; Policy konsistent an der Edge.

## Hinweise / Troubleshooting

- SD-WAN ≠ SASE: SD-WAN ist Konnektivität, SASE fügt Security hinzu.
- ZTNA ist die Zero-Trust-Antwort auf die VPN-„Über-Freigabe" (Übung 04).
- SASE ist ein **Architektur-/Delivery-Modell** (Cloud-Edge), kein Einzelprodukt.
