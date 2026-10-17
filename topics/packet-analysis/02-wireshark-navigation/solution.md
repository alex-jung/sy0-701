# Lösung – Übung 02: Wireshark-Navigation

## 1. Panes & Schichten

- **Packet List** (oben): eine Zeile pro Paket (No., Time, Src, Dst, Protocol, Info).
- **Packet Details** (Mitte): aufklappbare Schichten → **Frame → Ethernet II → IP → TCP → HTTP**. Jede Schicht zeigt ihre Header-Felder.
- **Packet Bytes** (unten): Hex/ASCII; Klick auf ein Feld markiert die Bytes.

## 2. Follow Stream

Rechtsklick auf ein HTTP-Paket → **Follow → HTTP Stream** (oder TCP Stream). Wireshark zeigt die ganze Verbindung als Dialog:
```
GET / HTTP/1.1
Host: ...
--- Response ---
HTTP/1.1 200 OK
...
```
Bei einem Klartext-Login sieht man hier Benutzer/Passwort → Beleg fürs Klartext-Risiko (Übung 06).

## 3. Protocol Hierarchy

**Statistics → Protocol Hierarchy:** prozentuale Anteile (z. B. 60 % TCP/HTTP, 20 % DNS …) → schneller Überblick, was im Capture steckt.

## 4. Conversations

**Statistics → Conversations → TCP/IPv4:** Top-Gesprächspartner nach **Bytes/Packets**. Ein Host mit auffällig vielen/kleinen Verbindungen zu einem Ziel = Orientierungspunkt (später Beaconing, Übung 07).

## 5. Coloring Rule

**View → Coloring Rules → +:** Name „RST", Filter `tcp.flags.reset==1`, Farbe rot. Nutzen: Fehler/Resets/Anomalien fallen sofort optisch auf, ohne zu filtern.

## Häufige Fehler / Troubleshooting

- **Follow Stream grau:** erst ein Paket der Verbindung markieren.
- **Zu viele Pakete:** Statistics zum Eingrenzen nutzen, dann Display-Filter (Übung 03).
- **Klartext erwartet, nichts lesbar:** verschlüsselt (TLS, Übung 08) → nur Metadaten.
- **Zeitspalte unklar:** View → Time Display Format (z. B. UTC/absolut) für Korrelation.
