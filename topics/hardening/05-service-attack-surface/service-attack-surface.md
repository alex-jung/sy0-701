# Übung 05 – Dienste & Attack-Surface reduzieren

**Schwierigkeit: 5/10 · Dauer: ca. 55 Min.**

## Lernziele

- Laufende Dienste/offene Ports inventarisieren und bewerten
- Unnötige Dienste abschalten/entfernen (Least Functionality)
- Benötigte Dienste absichern (binden, Version verstecken, least privilege)
- Die Reduktion per Scan belegen (Angreifer-Sicht vorher/nachher)

## Theorie

Jeder laufende Dienst/offene Port ist **Angriffsfläche** (vgl. `network-scanning`/`enumeration`). **Least Functionality** heißt: nur das Nötige läuft. Vorgehen:

1. **Inventur:** welche Dienste lauschen auf welchen Ports (`ss`), welche Pakete sind installiert?
2. **Bewerten:** brauche ich das wirklich? (Telnet/FTP/rpcbind/avahi oft unnötig).
3. **Abschalten/Entfernen:** Dienst stoppen+deaktivieren, Paket deinstallieren.
4. **Verbleibende härten:** nur auf benötigtes Interface/localhost **binden**, Banner/Versionen reduzieren, als eigener unprivilegierter User, patchen.
5. **Belegen:** Nmap-Scan vorher/nachher zeigt die reduzierte Angriffsfläche.

Das ist die direkte Gegenmaßnahme zu Enumeration/Exploitation: ein nicht laufender Dienst kann nicht ausgenutzt werden.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `ss -tulpn` / `systemctl` | Dienste/Ports inventarisieren |
| `apt`/`systemctl disable` | entfernen/deaktivieren |
| `nmap` (Kali) | Angreifer-Sicht vorher/nachher |

## Lab-Setup

- Eine VM mit mehreren Diensten (z. B. Metasploitable-ähnlich). Kali zum Scannen. **Snapshot.**

## Aufgabe (selbst lösen)

1. Inventarisiere alle **lauschenden Dienste/Ports** und ordne jeden „nötig/unnötig" zu.
2. Scanne die VM **von Kali** (Baseline der offenen Ports).
3. **Deaktiviere/entferne** mindestens drei unnötige Dienste (z. B. Telnet/FTP/rpcbind).
4. Binde einen verbleibenden Dienst auf **localhost**/nur internes Interface statt `0.0.0.0`.
5. Scanne **erneut** und belege die reduzierte Angriffsfläche (Diff).

**Ziel:** eine messbar reduzierte Angriffsfläche (weniger offene Ports im Nmap-Vergleich) + abgesicherte Rest-Dienste.

## SY0-701 Prüfungsbezug

- **Least functionality / attack surface reduction**, Disable unnötiger Services/Ports.
- **Binding**/Netzwerk-Exposure, Service-Hardening, Banner-Reduktion.
- Begriffe: *attack surface reduction*, *least functionality*, *disable services*, *bind address*, *hardening*.
