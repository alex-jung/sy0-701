# Übung 01 – OPNsense-Grundlagen & sichere Erstkonfiguration

**Schwierigkeit: 1/10 · Dauer: ca. 45 Min.**

## Lernziele

- Aufbau und Rolle von OPNsense als Perimeter-Firewall verstehen
- Interfaces (WAN/LAN) und das Dashboard kennen
- Die Default-Regeln und die Anti-Lockout-Regel verstehen
- Management-Zugang absichern (erste Hardening-Schritte)

## Theorie

**OPNsense** ist eine FreeBSD-basierte Firewall/Router-Distribution (Fork von pfSense) mit dem Paketfilter **pf** im Kern. Grundkonzepte:

- **Interfaces:** **WAN** (unsicher/Internet), **LAN** (vertrauenswürdig), weitere optionale (DMZ/VLANs).
- **Default-Verhalten:** eingehend auf WAN ist **alles geblockt** (default-deny); auf LAN existiert per Default eine **„allow all"**-Regel (damit man überhaupt arbeiten kann) – die man später verschärft.
- **Anti-Lockout-Rule:** verhindert, dass man sich selbst vom Management (Web/SSH) aussperrt – wichtig zu kennen, bevor man LAN-Regeln ändert.
- **Management:** Weboberfläche (HTTPS), optional SSH. Gehört abgesichert (starkes Passwort, kein WAN-Zugriff, ggf. 2FA).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense Web-UI | Konfiguration/Dashboard |
| OPNsense-Konsole | Interface-Zuordnung, Notfall |
| `tcpdump` (auf OPNsense) | Paketmitschnitt (Interfaces → Diagnostics) |

## Lab-Setup

- OPNsense-VM mit WAN + LAN. Kali/Test-Host im LAN. Konsolen-Zugang (Proxmox) als Notfall.

## Aufgabe (selbst lösen)

1. Verschaffe dir einen Überblick: Welche **Interfaces** sind zugewiesen, welche IPs, was zeigt das **Dashboard** (Version, Uptime, Gateways)?
2. Finde die **Default-Regeln** auf WAN und LAN. Was ist eingehend auf WAN erlaubt, was auf LAN?
3. Lokalisiere die **Anti-Lockout-Regel** (Firewall → Settings) – was macht sie, und warum ist sie wichtig?
4. Härte den **Management-Zugang**: starkes Admin-Passwort, Web-UI nur auf LAN, HTTPS erzwungen (prüfen/setzen).
5. Erkläre WAN vs. LAN „Trust-Zonen" und warum default-deny auf WAN Standard ist.

**Ziel:** sicherer Überblick über die OPNsense-Grundkonfiguration + abgesicherter Management-Zugang als Basis für alle folgenden Übungen.

## SY0-701 Prüfungsbezug

- **Firewall** als Perimeter-Kontrolle; **default-deny / implicit deny**; Trust-Zonen (WAN/LAN).
- **Secure management** (Out-of-band/Management-Plane absichern), Anti-Lockout.
- Begriffe: *firewall*, *implicit deny*, *trust zone*, *management plane*, *secure configuration*.
