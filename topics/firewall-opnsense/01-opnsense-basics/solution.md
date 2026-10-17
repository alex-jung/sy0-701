# Lösung – Übung 01: OPNsense-Grundlagen

## 1. Interfaces & Dashboard

- **Interfaces → Assignments:** zeigt WAN/LAN (+ optional) und Treiber. **Interfaces → [WAN]/[LAN]:** IP-Modus (WAN meist DHCP, LAN statisch, z. B. `192.168.1.1/24`).
- **Lobby → Dashboard:** Version, Uptime, Gateways-Status, Interface-Durchsatz, Services.

## 2. Default-Regeln

- **Firewall → Rules → WAN:** leer bzw. nur „Block private/bogon" → **eingehend alles geblockt** (default-deny).
- **Firewall → Rules → LAN:** „Default allow LAN to any" (IPv4+IPv6) → LAN darf raus/überallhin (zu Beginn bewusst offen, wird später verschärft).

## 3. Anti-Lockout-Rule

**Firewall → Settings → Advanced → „Disable anti-lockout".** Die Regel erlaubt dem LAN(-Management-)Netz immer Zugriff auf Web-UI/SSH der Firewall – damit du dich bei einem fehlerhaften Regelwerk **nicht aussperrst**. Erst deaktivieren, wenn ein bewusster, getesteter Management-Zugang existiert.

## 4. Management härten

- **System → Access → Users:** starkes Admin-Passwort (+ optional TOTP-2FA).
- **System → Settings → Administration:** HTTPS erzwingen, Web-UI-Interface auf **LAN** begrenzen, „Listen Interfaces" nicht WAN; SSH nur bei Bedarf + key-basiert.
- Auf WAN **keine** Regel, die Management-Ports (443/22) erlaubt.

## 5. WAN vs. LAN & default-deny

WAN ist die **nicht vertrauenswürdige** Außenseite → eingehend grundsätzlich alles sperren (**implicit/default deny**), nur gezielt öffnen (Übung 04). LAN ist die vertrauenswürdige Innenseite → Ausgang erlaubt, intern später segmentieren (Übung 05). Dieses Zonen-Modell ist die Basis sicheren Netzdesigns.

## Häufige Fehler / Troubleshooting

- **Ausgesperrt:** über die **Proxmox-Konsole** von OPNsense (Menüpunkt „Reset to factory"/Interface neu zuweisen) oder Anti-Lockout nutzen.
- **Web-UI auf WAN erreichbar:** Fehlkonfiguration → Listen-Interface/Regeln prüfen.
- **Kein Internet im LAN:** Gateway/Outbound-NAT/DNS prüfen (Default meist automatisch).
