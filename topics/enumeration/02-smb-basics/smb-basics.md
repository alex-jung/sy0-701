# Übung 02 – SMB Enumeration: Basics (Null Session & Shares)

**Schwierigkeit: 2/10 · Dauer: ca. 40 Min.**

## Lernziele

- SMB/NetBIOS-Dienste verstehen (Ports 139/445)
- Eine **Null Session** (anonymer Zugang) erkennen und nutzen
- Freigaben (Shares) auflisten und auf Lese-/Schreibrechte prüfen
- Dateien aus offenen Shares abrufen

## Theorie

**SMB** (Server Message Block, Ports 445 bzw. 139 über NetBIOS) teilt Dateien/Drucker im Netzwerk. Bei schwacher Konfiguration erlaubt es eine **Null Session**: eine Anmeldung **ohne Benutzername/Passwort**, die trotzdem Shares, teils User und Policies preisgibt. Das ist einer der ergiebigsten Enumeration-Funde in Windows-/Samba-Umgebungen.

Wichtige Share-Typen: benutzerdefinierte Freigaben (z. B. `tmp`, `share`), administrative (`ADMIN$`, `C$`) und `IPC$` (Inter-Process Communication – Basis der Null Session).

Samba auf Metasploitable 2 ist bewusst offen → ideales Lernziel.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `smbclient` | SMB-Client (Shares listen/zugreifen) | `-L //<ziel>` (Shares), `-N` (no password), `//ziel/share` |
| `smbmap` | Shares + Berechtigungen übersichtlich | `-H <ziel>`, `-u '' -p ''` (anonym), `-r` (rekursiv) |
| `nmap` NSE | SMB-Grundinfos | `--script smb-protocols,smb2-security-mode` |

## Lab-Setup

- Metasploitable (Samba auf 139/445). Ziel-IP bekannt.

## Aufgabe (selbst lösen)

1. Liste mit `smbclient` **anonym** alle Freigaben des Ziels auf (Null Session).
2. Prüfe mit `smbmap`, welche Shares **lesbar** und welche sogar **beschreibbar** sind.
3. Verbinde dich auf eine lesbare Freigabe und lade mindestens eine Datei herunter.
4. Finde heraus, welche SMB-Version/Dialekt der Server spricht (NSE).
5. Erkläre: Warum ist eine Null Session gefährlich, und wie unterbindet man sie?

**Ziel:** eine Übersicht aller SMB-Shares mit Berechtigungen + eine per Null Session abgegriffene Datei.

## SY0-701 Prüfungsbezug

- **SMB/NetBIOS (139/445)** als häufige Angriffsfläche; **Null Session** = Misconfiguration/Information Disclosure.
- **SMBv1** gilt als unsicher (EternalBlue-Kontext) → Abschalten/Upgrade = Hardening.
- **Access Control / least privilege:** anonyme & beschreibbare Shares verletzen beides.
- Begriffe: *SMB/CIFS*, *null session*, *IPC$*, *SMBv1*, *access control*, *information disclosure*.
