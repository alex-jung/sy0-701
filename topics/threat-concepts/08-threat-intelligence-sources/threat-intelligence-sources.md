# Übung 08 – Threat Intelligence & Sources

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- Threat-Intelligence-Typen und -Quellen unterscheiden
- OSINT/Feeds/ISAC und STIX/TAXII einordnen
- TI bewerten (Relevanz, Zuverlässigkeit) und operativ nutzen

## Theorie

**Cyber Threat Intelligence (CTI)** macht aus Rohdaten verwertbares Wissen über Bedrohungen. Ebenen:

- **Strategic** (langfristig, Management: Trends/Akteure/Geopolitik),
- **Operational** (Kampagnen/TTPs eines Akteurs),
- **Tactical** (konkrete IOCs/Signaturen für Detection).

**Quellen (SY0-701):** **OSINT** (offene Quellen), **proprietäre/kommerzielle Feeds**, **ISAC** (branchenspezifisch, information sharing), **Behörden/CERT/CISA**, **Dark Web**, **vendor advisories**, **vulnerability databases (CVE/NVD/KEV)**, **threat feeds**, interne Telemetrie (eigene Logs/Honeypots).

**Austauschformate:** **STIX** (strukturierte Threat-Beschreibung) + **TAXII** (Transportprotokoll); Plattformen wie **MISP**, **OpenCTI**. Bewertung von TI: **Relevanz** (passt es zu meinen Assets?), **Zuverlässigkeit/Confidence** der Quelle, **Timeliness** (frisch?), **Actionability**. Nutzen: Feeds in SIEM/IDS/Blocklist einspeisen, proaktiv jagen (Übung 09), priorisieren.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| MISP/OpenCTI (Konzept) | TI-Plattform/STIX |
| CVE/NVD/KEV, OSINT | Quellen |
| SIEM/IDS | TI operationalisieren |

## Lab-Setup

- Öffentliche TI-Quellen + deine eigenen Lab-IOCs (aus `honeypots`) als „interne" TI.

## Aufgabe (selbst lösen)

1. Unterscheide strategic/operational/tactical TI mit je einem Beispiel und Adressaten.
2. Liste 6 TI-Quellen, bewerte je **Relevanz** und **Zuverlässigkeit** für dein Lab.
3. Erkläre **STIX/TAXII** und wofür MISP/OpenCTI dienen.
4. Nimm deine eigenen Lab-IOCs (Honeypot) als TI und beschreibe, wie du sie bewertest und in Detection (SIEM/IDS/Blocklist) überführst.

**Ziel:** Threat Intelligence nach Ebene/Quelle einordnen, bewerten und operativ nutzbar machen.

## SY0-701 Prüfungsbezug

- **4.0/2.0** threat intelligence (strategic/operational/tactical), sources (OSINT/ISAC/feeds/dark web/CISA/CVE), STIX/TAXII, information sharing.
- Begriffe: *CTI (strategic/operational/tactical)*, *OSINT*, *ISAC*, *threat feed*, *STIX/TAXII*, *MISP*, *CVE/NVD/KEV*, *confidence/relevance*.
