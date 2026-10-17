# Übung 02 – Wireshark-Navigation & Follow Stream

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- Die Wireshark-Oberfläche effizient nutzen (Panes, Spalten, Farben)
- Paket-Details über die OSI-Schichten lesen
- „Follow Stream" nutzen, um eine Verbindung zu rekonstruieren
- Statistics nutzen (Conversations/Endpoints/Protocol Hierarchy)

## Theorie

Wireshark zeigt drei Panes: **Packet List** (Übersicht), **Packet Details** (Schichten von Ethernet → IP → TCP → App), **Packet Bytes** (Hex/ASCII). Die Details spiegeln die **OSI-/TCP-IP-Schichten** – man navigiert vom Frame bis zum Anwendungsinhalt.

Mächtige Werkzeuge:
- **Follow → TCP/HTTP/TLS Stream:** rekonstruiert eine komplette Verbindung als lesbaren Dialog (z. B. HTTP-Request/Response, eine Login-Session).
- **Statistics → Protocol Hierarchy:** was ist im Capture (Anteile)?
- **Statistics → Conversations/Endpoints:** wer spricht mit wem, Volumen → schnelle Orientierung/Anomalien.
- **Coloring Rules:** z. B. rot für TCP-Resets/Fehler.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark | GUI-Analyse |
| Follow Stream / Statistics | Rekonstruktion/Überblick |

## Lab-Setup

- Das PCAP aus Übung 01 (oder ein HTTP-/Login-Mitschnitt). Wireshark.

## Aufgabe (selbst lösen)

1. Öffne ein PCAP und erkläre die drei Panes; klappe für ein Paket die **Schichten** (Ethernet/IP/TCP/HTTP) auf.
2. Nutze **Follow TCP/HTTP Stream** auf einer HTTP-Verbindung und lies Request + Response im Klartext.
3. Öffne **Statistics → Protocol Hierarchy**: welche Protokolle dominieren?
4. Öffne **Statistics → Conversations**: wer sind die Top-Gesprächspartner (nach Bytes/Paketen)?
5. Lege eine **Coloring Rule** an (z. B. TCP RST rot) und erkläre den Nutzen.

**Ziel:** sichere Navigation in Wireshark – Schichten lesen, einen Stream rekonstruieren und sich über Statistics schnell orientieren.

## SY0-701 Prüfungsbezug

- **Protokoll-/Schichtanalyse (OSI)**, Traffic-Überblick, Anomalie-Orientierung.
- **Stream-Rekonstruktion** (Klartext-Inhalte) → auch Beleg für Klartext-Risiken.
- Begriffe: *protocol analyzer*, *OSI layers*, *follow stream*, *conversations/endpoints*, *protocol hierarchy*.
