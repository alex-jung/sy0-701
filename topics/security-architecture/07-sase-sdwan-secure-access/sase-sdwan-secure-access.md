# Übung 07 – SASE, SD-WAN & Secure Access

**Schwierigkeit: 7/10 · Dauer: ca. 75 Min.**

## Lernziele

- SD-WAN und SASE verstehen und abgrenzen
- Die SASE-Komponenten (SWG, CASB, ZTNA, FWaaS) einordnen
- Secure-Access-Konzepte (ZTNA vs. klassisches VPN) vergleichen

## Theorie

Mit Cloud/Remote-Arbeit verlagert sich Sicherheit vom RZ-Perimeter in die **Cloud-Edge**:

- **SD-WAN (Software-Defined WAN):** verwaltet/optimiert WAN-Verbindungen zentral/software-definiert (mehrere Transporte: Internet/MPLS/LTE), application-aware Routing, zentrale Policy. Fokus: **Konnektivität/Performance** (Security nur teilweise).
- **SASE (Secure Access Service Edge):** **konvergiert Netzwerk (SD-WAN) + Security als Cloud-Service** an der Edge, nah am Nutzer/Gerät. Komponenten: **SWG** (Secure Web Gateway), **CASB**, **ZTNA** (Zero Trust Network Access), **FWaaS** (Firewall as a Service), DLP. 
- **SSE (Security Service Edge):** der Security-Teil von SASE (SWG/CASB/ZTNA) ohne SD-WAN.
- **ZTNA vs. VPN:** klassisches VPN gibt oft **Netz-Zugang** (zu viel, implizites Vertrauen); **ZTNA** gewährt **app-spezifischen**, identitäts-/kontextbasierten Zugriff (Zero Trust, least privilege) – meist ohne das ganze Netz zu öffnen.

Nutzen: konsistente Policy für verteilte Nutzer, weniger „Backhaul" ins RZ, Zero-Trust-Zugriff. Querbezug: `vpn-tunneling`, `zero-trust` (Übung 04).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | SASE/SD-WAN-Architektur |
| Diagramm | Edge-/Zugriffs-Design |

## Lab-Setup

- Konzeptionell; Bezug zu deinem VPN (`vpn-tunneling`) als „Vorstufe" zu ZTNA.

## Aufgabe (selbst lösen)

1. Grenze SD-WAN und SASE ab: was löst jeweils welches Problem?
2. Ordne die SASE-Komponenten (SWG, CASB, ZTNA, FWaaS, DLP) je einer Schutzfunktion zu.
3. Vergleiche **ZTNA vs. klassisches Remote-Access-VPN** (Zugriffsgranularität, Vertrauen, Angriffsfläche) – mit Bezug zu deinem Lab-VPN.
4. Skizziere, wie ein verteilter Nutzer über SASE sicher auf eine interne App zugreift (Komponenten im Pfad).

**Ziel:** SD-WAN/SASE/SSE verstehen, Komponenten zuordnen und ZTNA vom klassischen VPN abgrenzen.

## SY0-701 Prüfungsbezug

- **3.0** SASE, SD-WAN, SSE, SWG, CASB, ZTNA, FWaaS; secure access service edge; ZTNA vs. VPN.
- Begriffe: *SD-WAN*, *SASE/SSE*, *SWG/CASB/ZTNA/FWaaS*, *ZTNA vs. VPN*, *cloud edge*, *least-privilege access*.
