# Übung 02 – Cowrie: SSH/Telnet-Honeypot aufsetzen

**Schwierigkeit: 2/10 · Dauer: ca. 60 Min.**

## Lernziele

- Cowrie als medium-interaction SSH/Telnet-Honeypot installieren
- Den echten SSH-Dienst sauber vom Honeypot trennen (Ports)
- Eine erste Angreifer-Session simulieren und im Log wiederfinden

## Theorie

**Cowrie** emuliert einen SSH- (und optional Telnet-)Server mit einer **gefälschten Shell**. Ein Angreifer kann sich „einloggen" (Cowrie akzeptiert bestimmte/zufällige Passwörter), Befehle absetzen und sogar scheinbar Dateien herunterladen – alles wird **protokolliert**, ohne dass ein echtes System freigegeben wird. Cowrie läuft als **unprivilegierter** Dienst; damit es auf Port 22 lauschen kann, nutzt man typischerweise eine **Port-Weiterleitung** (`iptables`/`authbind`) von 22 → 2222, während der **echte** Admin-SSH auf einen anderen Port (z. B. 2022) umzieht.

Wichtig: Der Honeypot-Host braucht einen **eigenen, realen** Admin-Zugang auf getrenntem Port – sonst sperrst du dich aus oder vermischt Honeypot- und Admin-Logins.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `cowrie` | SSH/Telnet-Honeypot (emulierte Shell) |
| `iptables` | Port 22 → 2222 umleiten |
| `ssh` | Testangriff/Client |

## Lab-Setup

- Honeypot-VM (Debian/Ubuntu) in isoliertem VLAN. Echter SSH-Dienst auf z. B. Port **2022** gelegt (`/etc/ssh/sshd_config` → `Port 2022`). Kali als Testangreifer.

## Aufgabe (selbst lösen)

1. Installiere Cowrie (eigener User, venv) und starte es, sodass es auf **2222** lauscht.
2. Lege den **echten** SSH-Dienst des Hosts auf einen anderen Port (z. B. 2022) und leite extern **22 → 2222** auf Cowrie um.
3. Verbinde dich von Kali als „Angreifer" auf Port 22, „logge dich ein" und setze ein paar Befehle ab (`whoami`, `uname -a`, `wget http://.../x`).
4. Finde deine Session im Cowrie-Log wieder (`var/log/cowrie/cowrie.json`).

**Ziel:** laufender Cowrie-Honeypot auf 22 (extern), echter SSH getrennt, und deine simulierte Session im Log nachgewiesen.

## SY0-701 Prüfungsbezug

- **4.0/1.0** Honeypot als Detection/Deception-Mechanismus.
- Konzept „jeder Login ist verdächtig"; Trennung Köder vs. echter Dienst.
- Begriffe: *honeypot*, *medium interaction*, *session logging*, *deception*.
