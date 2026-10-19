# Übung 06 – RADIUS & 802.1X

**Schwierigkeit: 6/10 · Dauer: ca. 80 Min.**

## Lernziele

- RADIUS als zentrale AAA für Netzwerkzugang verstehen
- Einen FreeRADIUS-Server aufsetzen und Authentifizierung testen
- 802.1X / EAP-Konzept und Port-based Network Access Control einordnen

## Theorie

**RADIUS (Remote Authentication Dial-In User Service)** zentralisiert **AAA** für Netzwerk-/Geräte-Logins (WLAN, VPN, Switch-Ports, Router-Admin). Ein **Client/NAS** (Network Access Server, z. B. Access Point/Switch) fragt den **RADIUS-Server**, ob ein Nutzer rein darf (Access-Request → Accept/Reject/Challenge) und liefert **Accounting** (Start/Stop) für Nachvollziehbarkeit.

**802.1X** ist **Port-based Network Access Control**: der **Supplicant** (Client) authentisiert sich über den **Authenticator** (Switch/AP) beim **Authentication Server** (RADIUS), bevor der Port/WLAN freigegeben wird. Der eigentliche Austausch läuft über **EAP** (z. B. **EAP-TLS** mit Zertifikaten – stark; **PEAP/EAP-TTLS** mit Tunnel+Passwort). Das ist die Basis von **WPA2/3-Enterprise** (vgl. `wireless-security`). RADIUS selbst sollte über **RadSec/IPsec** gesichert sein (klassisch nur MD5-gehashter Shared Secret).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `freeradius` | RADIUS-Server (AAA) |
| `radtest`/`radclient` | Access-Request testen |
| `eapol_test`/Supplicant | 802.1X/EAP testen |

## Lab-Setup

- VM mit FreeRADIUS; OPNsense oder ein AP/Switch als NAS (optional). `freeradius-utils` für Tests.

## Aufgabe (selbst lösen)

1. Installiere FreeRADIUS, lege einen Testnutzer an und einen **Client** (NAS) mit Shared Secret.
2. Teste eine Authentifizierung mit `radtest` (Accept) und mit falschem Passwort (Reject); beobachte `freeradius -X` (Debug).
3. Skizziere die **802.1X**-Rollen (Supplicant/Authenticator/Auth-Server) und den Nachrichtenfluss für einen WLAN-/Switch-Port-Login.
4. Vergleiche **EAP-TLS** vs. **PEAP**: Sicherheit, Zertifikatsbedarf, Einsatz.

**Ziel:** ein funktionierender RADIUS-Login (Accept/Reject nachgewiesen) + Verständnis von 802.1X/EAP-Rollen und -Methoden.

## SY0-701 Prüfungsbezug

- **1.0/3.0** AAA, RADIUS/TACACS+, 802.1X, EAP (EAP-TLS/PEAP), port-based NAC, WPA-Enterprise.
- RADIUS vs. TACACS+ (UDP/alles-verschlüsselt, Device-Admin-Fokus).
- Begriffe: *RADIUS*, *NAS*, *802.1X*, *supplicant/authenticator*, *EAP-TLS/PEAP*, *NAC*, *TACACS+*.
