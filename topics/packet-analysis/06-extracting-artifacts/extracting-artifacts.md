# Übung 06 – Artefakte extrahieren (Dateien, Credentials)

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- Übertragene Dateien aus einem Capture rekonstruieren
- Klartext-Credentials im Traffic finden (HTTP/FTP/Telnet)
- Objekte exportieren (HTTP/SMB/FTP)
- Daraus das Risiko unverschlüsselter Protokolle ableiten

## Theorie

Captures enthalten nicht nur Metadaten, sondern oft **die Inhalte selbst** – solange der Traffic **unverschlüsselt** ist:
- **Dateien:** Wireshark kann übertragene Objekte rekonstruieren (**File → Export Objects → HTTP/SMB/FTP/IMF**).
- **Credentials im Klartext:** **FTP** (`USER`/`PASS`), **Telnet**, **HTTP Basic Auth** (Base64), unverschlüsselte Logins, SNMP-Community. Wireshark hat sogar **Tools → Credentials**.
- **Follow Stream** (Übung 02) zeigt ganze Sessions.

Lektion: unverschlüsselte Protokolle (Telnet/FTP/HTTP) geben alles preis, wer den Traffic sieht → **Verschlüsselung (SSH/SFTP/HTTPS)** ist Pflicht. Das ist die Blue-Team-Begründung gegen Legacy-Klartext-Dienste (vgl. Metasploitable).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark → Export Objects | Dateien rekonstruieren |
| Wireshark → Tools → Credentials | Klartext-Credentials |
| Follow Stream | Session/Inhalt |

## Lab-Setup

- Ein Capture mit unverschlüsseltem Traffic: HTTP-Download, FTP-/Telnet-Login (z. B. gegen Metasploitable). Wireshark.

## Aufgabe (selbst lösen)

1. Rekonstruiere eine **übertragene Datei** aus einem HTTP- (oder FTP-)Transfer (Export Objects) und öffne sie.
2. Finde **FTP-Credentials** (`USER`/`PASS`) im Klartext und notiere sie.
3. Finde HTTP-**Basic-Auth** und dekodiere den Base64-String.
4. Nutze **Tools → Credentials**, um gefundene Logins automatisch zu listen.
5. Erkläre, warum derselbe Angriff bei **HTTPS/SFTP** scheitern würde (Übung 08).

**Ziel:** eine Datei und Klartext-Credentials aus einem Capture extrahiert – mit klarer Ableitung fürs Härten (Verschlüsselung).

## SY0-701 Prüfungsbezug

- **Unverschlüsselte Protokolle** als Risiko (Telnet/FTP/HTTP), **Sniffing**, Credential-Abgriff.
- **Secure protocols** (SSH/SFTP/HTTPS/SNMPv3) als Gegenmaßnahme; Data in transit.
- Begriffe: *cleartext protocols*, *sniffing/eavesdropping*, *credential harvesting*, *encryption in transit*.
