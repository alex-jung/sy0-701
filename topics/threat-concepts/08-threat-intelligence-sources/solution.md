# Lösung – Übung 08: Threat Intelligence

## 1. Ebenen

| Ebene | Beispiel | Adressat |
|-------|----------|----------|
| Strategic | „Ransomware-Gruppe X zielt auf Branche Y" | Management/Leitung |
| Operational | „Kampagne nutzt Phishing → RAT → Exfil, diese TTPs" | SOC/IR-Leitung |
| Tactical | „IOCs: diese IPs/Hashes/Domains, YARA/Snort-Regeln" | SOC-Analysten/Tools |

## 2. Quellen + Bewertung (Beispiel)

| Quelle | Relevanz | Zuverlässigkeit |
|--------|----------|-----------------|
| CISA/CERT Advisories | hoch | hoch |
| CVE/NVD/KEV | hoch | hoch |
| ISAC (branchenspezifisch) | hoch (wenn Branche passt) | hoch |
| Kommerzielle Feeds | mittel–hoch | hoch (aber Kosten) |
| OSINT/Blogs/Twitter | variabel | variabel (prüfen) |
| Dark Web | nischig | schwer verifizierbar |

## 3. STIX/TAXII + MISP

- **STIX:** standardisiertes **Format** zur Beschreibung von Threats (Indicators, TTPs, Akteure, Relationships).
- **TAXII:** **Transportprotokoll**, um STIX-Daten zwischen Parteien auszutauschen.
- **MISP/OpenCTI:** Plattformen zum Sammeln/Korrelieren/Teilen von TI (Feeds, Sharing-Communities), exportieren IOCs an SIEM/IDS.

## 4. Eigene Lab-IOCs als TI

- Bewertung: frisch (eigene Beobachtung) = hohe **Confidence/Timeliness**, aber **Relevanz** nur fürs eigene Umfeld; dedupliziert, mit Zeitstempel.
- Operationalisieren: IPs/Domains → OPNsense-Alias/Blocklist + Suricata-Drop; Hashes → YARA/Watchlist; TTPs → SIEM-Korrelationsregeln. (Bezug `honeypots` 08.)

## Hinweise / Troubleshooting

- TI ohne **Relevanz-Filter** = Alarmflut; auf eigene Assets/Branche zuschneiden.
- Confidence/Quelle immer mitführen; veraltete IOCs ablaufen lassen.
- Teilen (ISAC/MISP) erhöht den Wert – aber Datenschutz/Legalität beim Sharing beachten.
