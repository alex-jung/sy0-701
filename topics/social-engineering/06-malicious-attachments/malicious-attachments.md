# Übung 06 – Malicious Attachments & Payload-Delivery

**Schwierigkeit: 6/10 · Dauer: ca. 60 Min.**

## Lernziele

- Gängige Anhang-/Delivery-Techniken verstehen (Makros, Container, LNK, HTML-Smuggling)
- Die Angriffskette E-Mail → Anhang → Ausführung → Payload nachvollziehen
- Warum moderne Delivery Office-Makros zunehmend ersetzt
- Technische & Awareness-Abwehr ableiten

## Theorie

Nach dem Köder (Mail) folgt die **Payload-Delivery** über einen Anhang/Link. Verbreitete Techniken (konzeptionell, mit Lab-Demo im eigenen Netz):

- **Office-Makros (VBA):** klassisch; `AutoOpen`/`Document_Open` führt Code aus. Microsoft blockt Makros aus dem Internet inzwischen standardmäßig → rückläufig.
- **Container (ZIP/ISO/IMG):** umgehen das „Mark of the Web" (MOTW), Dateien im Container erben die Herkunftsmarkierung schlechter.
- **LNK-Dateien / Script (HTA, JS, WSF):** starten per `cmd`/`powershell` einen Downloader.
- **HTML-Smuggling:** die Payload wird clientseitig im Browser aus einer harmlosen HTML-Mail/Seite „zusammengebaut" → umgeht Gateway-Scans.
- **PDF mit Link/Lure** → führt zu einem der obigen.

Die Payload ist dann z. B. ein msfvenom-/C2-Stager (siehe exploitation/post-exploitation). **AV/EDR** erkennt Verhalten, nicht nur Signaturen.

> ⚠️ Payloads nur im eigenen Lab bauen/ausführen; keine Verteilung an Dritte.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `msfvenom` | Payload erzeugen (macro/exe/hta) |
| LibreOffice/Office | Makro-Dokument (Lab) |
| `genisoimage`/zip | Container (MOTW-Demo) |
| AV/EDR + Sandbox | Detection |

## Lab-Setup

- Isolierte Test-VM (Windows/Linux) als „Opfer", `<KALI>`-Handler. **Snapshots.** Keine echten Empfänger.

## Aufgabe (selbst lösen)

1. Erzeuge einen harmlosen Test-Payload (z. B. der nur `calc`/eine Markerdatei startet) als **Makro** und als **EXE** (msfvenom).
2. Verpacke die EXE in ein **ZIP/ISO** und erkläre den **Mark-of-the-Web**-Effekt.
3. Führe die Kette im Lab aus: „Anhang" auf der Test-VM öffnen → Payload → Callback zum Handler.
4. Beschreibe **HTML-Smuggling** und warum es Gateways umgeht.
5. Leite technische + Awareness-Gegenmaßnahmen ab.

**Ziel:** die Delivery-Kette (Anhang → Ausführung → Callback) im Lab nachvollzogen und die Abwehr je Technik benannt.

## SY0-701 Prüfungsbezug

- **Malware delivery / malicious attachments** (Makros, Container, LNK, HTML-Smuggling).
- **Mark of the Web**, Makro-Blocking, **Attachment-Sandboxing**, **EDR**, Application Allowlisting.
- Begriffe: *malicious macro*, *payload delivery*, *Mark of the Web*, *HTML smuggling*, *EDR/sandboxing*, *application allowlisting*.
