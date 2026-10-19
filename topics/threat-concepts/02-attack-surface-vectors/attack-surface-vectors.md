# Übung 02 – Attack Surface & Threat Vectors

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Attack Surface vs. Threat/Attack Vector unterscheiden
- Die wichtigsten Vektoren systematisch erfassen
- Die eigene Angriffsfläche reduzieren (Minimierung)

## Theorie

- **Attack Surface:** die Gesamtheit aller Punkte, an denen ein Angreifer ein-/angreifen kann (offene Ports/Dienste, Web-Apps, APIs, Nutzer, Geräte, Cloud, physische Zugänge). Je größer, desto mehr Risiko.
- **Threat/Attack Vector:** der **Weg/Mechanismus**, über den ein Angriff erfolgt.

Wichtige Vektoren (SY0-701): **message-based** (E-Mail/Phishing, SMS/Smishing, Voice/Vishing), **image/file-based**, **voice call**, **removable media** (USB), **vulnerable software** (unpatched, EOL), **unsupported systems/legacy**, **unsecure networks** (offenes WLAN, fehlende Segmentierung), **open service ports**, **default credentials**, **supply chain** (Vendor/Software/Hardware), **social engineering/human vector** (Übung 03). 

Gegenmaßnahme: **Attack-Surface-Reduction** – unnötige Dienste/Ports/Konten/Software abschalten, patchen, segmentieren, Default-Credentials ändern (Bezug `hardening`/`network-scanning`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| nmap (optional) | eigene offene Dienste erfassen |
| (konzeptionell) | Vektor-/Surface-Analyse |

## Lab-Setup

- Dein Lab-Netz als Analyseobjekt (optional Scan der eigenen Hosts).

## Aufgabe (selbst lösen)

1. Definiere Attack Surface vs. Threat Vector in je einem Satz mit Beispiel.
2. Erfasse die **Attack Surface** deines Labs (Hosts, offene Dienste/Ports, Web-Apps, Nutzer, physische Zugänge) – optional per nmap verifiziert.
3. Liste 8 Threat Vectors und ordne jedem eine konkrete Lab-Gefahr + eine Gegenmaßnahme zu.
4. Nenne drei konkrete Maßnahmen zur **Attack-Surface-Reduction** in deinem Lab.

**Ziel:** die eigene Angriffsfläche systematisch erfassen, Vektoren zuordnen und Reduktionsmaßnahmen ableiten.

## SY0-701 Prüfungsbezug

- **2.0** attack surface, threat vectors (message/file/voice/removable media/vulnerable & unsupported software/unsecure networks/open ports/default creds/supply chain), surface reduction.
- Begriffe: *attack surface*, *threat/attack vector*, *removable media*, *default credentials*, *EOL/unsupported*, *surface reduction*.
