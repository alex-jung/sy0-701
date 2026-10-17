# Übung 03 – Aliases & strukturiertes Regelwerk

**Schwierigkeit: 3/10 · Dauer: ca. 50 Min.**

## Lernziele

- Aliases (Hosts/Netze/Ports/URL-Tables) verstehen und einsetzen
- Ein wartbares, lesbares Regelwerk aufbauen
- Dynamische Blocklisten per URL-Table-Alias nutzen
- Regel-Dokumentation/Beschreibungen als Betriebspraxis

## Theorie

**Aliases** sind benannte Platzhalter für Gruppen von **Hosts, Netzen, Ports** oder **URL-Tables** (extern gepflegte Listen). Statt zehn Einzelregeln mit festen IPs schreibt man eine Regel mit dem Alias `Webserver` oder `Mgmt_Ports` – das macht Regelwerke **wartbar, lesbar und weniger fehleranfällig**. Ändert sich eine IP, passt man nur den Alias an.

Typen:
- **Host(s)/Network(s):** IPs/Subnetze zusammenfassen.
- **Port(s):** Dienstgruppen (`Web = 80,443`).
- **URL Table (IPs):** externe Liste per URL (z. B. Threat-Intel-/Blocklisten) – wird periodisch aktualisiert (Basis für Übung 08).
- **GeoIP:** Länder (Übung 08).

Gute Praxis: **jede Regel beschreiben** (Zweck), Aliases sprechend benennen, keine „magischen" nackten IPs.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Firewall → Aliases | Aliases anlegen/pflegen |
| Firewall → Rules | Regeln mit Aliases |
| Firewall → Diagnostics → Aliases | aufgelöste Alias-Inhalte prüfen |

## Lab-Setup

- OPNsense mit mehreren Test-Hosts/Diensten. Konfig-Backup.

## Aufgabe (selbst lösen)

1. Lege Aliases an: ein **Host-Alias** (z. B. `Servers`), ein **Port-Alias** (z. B. `Web_Ports = 80,443`).
2. Ersetze bestehende Einzelregeln durch **eine** Regel, die die Aliases nutzt. Teste, dass die Wirkung gleich bleibt.
3. Lege einen **URL-Table-Alias** mit einer (Test-)Blockliste an und binde ihn in eine Block-Regel ein.
4. Prüfe unter Diagnostics, **welche IPs** der URL-Table-Alias tatsächlich enthält und wann er aktualisiert wurde.
5. Dokumentiere jede Regel (Beschreibung) und erkläre, warum Aliases das Regelwerk sicherer machen.

**Ziel:** ein deutlich kompakteres, dokumentiertes Regelwerk auf Alias-Basis, inkl. einer dynamischen URL-Table-Blockliste.

## SY0-701 Prüfungsbezug

- **ACL-Management / Objekt-Gruppen**; Wartbarkeit = weniger Fehlkonfiguration.
- **Threat-Intel-Blocklisten** (URL-Tables) als automatisierte Kontrolle.
- **Change-/Dokumentations-Disziplin** im Firewall-Betrieb.
- Begriffe: *object groups/aliases*, *ACL management*, *threat intelligence feeds*, *blocklist*, *least privilege*.
