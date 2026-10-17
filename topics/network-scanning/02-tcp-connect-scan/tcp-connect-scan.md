# Übung 02 – TCP Connect Scan (Basics)

**Schwierigkeit: 2/10 · Dauer: ca. 30 Min.**

## Lernziele

- Den TCP-3-Way-Handshake verstehen und ihn im Scan wiedererkennen
- Einen TCP Connect Scan (`-sT`) durchführen und offene Ports auslesen
- Port-States `open` / `closed` interpretieren
- Gängige Ports den Diensten zuordnen

## Theorie

TCP baut Verbindungen mit dem **3-Way-Handshake** auf:

```
Client → SYN →      Server
Client ← SYN/ACK ←  Server
Client → ACK →      Server   (Verbindung steht)
```

Der **TCP Connect Scan** (`nmap -sT`) nutzt den OS-Syscall `connect()` und führt den **vollständigen** Handshake durch:
- Port **offen** → Server antwortet mit `SYN/ACK` → nmap vollendet mit `ACK` (und beendet dann).
- Port **geschlossen** → Server antwortet mit `RST` (Reset).

Weil der Handshake vollständig abgeschlossen wird, ist dieser Scan **gut sichtbar** (wird oft geloggt) – aber er braucht **keine root-Rechte**. Deshalb ist `-sT` der Default, wenn man nicht root ist.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Port-Scan | `-sT` (TCP Connect), `-p` (Ports), `-F` (Fast, Top-100), `--top-ports N`, `-oN` (Output) |

Port-Syntax: `-p 22,80,443` · `-p 1-1000` · `-p-` (alle 65535) · `-F` (Top 100).

## Lab-Setup

- Kali + Metasploitable im selben Subnetz (aus Übung 01 kennst du die Ziel-IP).
- Ersetze `<ZIEL>` unten durch die IP deiner Metasploitable-VM.

## Aufgabe (selbst lösen)

1. Scanne das Ziel mit einem **TCP Connect Scan** auf den Top-Ports und dann auf **allen** Ports.
2. Erstelle eine Liste: **welche Ports sind offen** und welcher **Dienst** läuft dort (anhand des Standard-Ports)?
3. Finde heraus: Läuft auf dem Ziel ein **FTP (21)**, **SSH (22)**, **HTTP (80)**? Welche weiteren „klassischen" Ports sind offen?
4. Speichere das Ergebnis in eine Datei (normales Textformat).
5. Starte parallel `tcpdump`/Wireshark und **beobachte den Handshake** eines offenen vs. geschlossenen Ports – welche Flags siehst du jeweils?

**Ziel:** vollständige Liste offener TCP-Ports + Dienst-Zuordnung, plus eigenes Verständnis, woran man `open` vs. `closed` im Paketmitschnitt erkennt.

## SY0-701 Prüfungsbezug

- **Ports/Protokolle (1.0/4.0):** Die Prüfung erwartet, dass du gängige Ports auswendig kennst: 20/21 FTP, 22 SSH/SCP/SFTP, 23 Telnet, 25 SMTP, 53 DNS, 80 HTTP, 110 POP3, 143 IMAP, 161/162 SNMP, 389 LDAP, 443 HTTPS, 445 SMB, 3389 RDP.
- **Connect Scan = „laut":** vollständiger Handshake → wird geloggt → leicht von IDS erkennbar. Kontrast zum Stealth/SYN-Scan (Übung 03) ist ein beliebtes Prüfungsthema.
- Begriffe: *3-way handshake*, *SYN/ACK/RST flags*, *well-known ports (0–1023)*.
