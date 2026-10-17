# Übung 07 – theHarvester: E-Mails, Hosts & OSINT-Aggregation

**Schwierigkeit: 7/10 · Dauer: ca. 50 Min.**

## Lernziele

- OSINT-Aggregation mit `theHarvester` automatisieren
- E-Mail-Adressen, Hostnamen und Mitarbeiter-/Namensmuster sammeln
- Verschiedene OSINT-Quellen (Suchmaschinen, CT, Threat-Intel) kombinieren
- Den Bezug zu **Phishing/Spear-Phishing** und E-Mail-Namenskonventionen verstehen

## Theorie

`theHarvester` bündelt viele OSINT-Quellen in einem Tool: es sammelt für eine Domain **E-Mail-Adressen, Subdomains, Hostnamen, IPs** und teils Mitarbeiter-Namen aus Suchmaschinen, Certificate-Transparency, und (mit API-Keys) Diensten wie Shodan, Hunter, SecurityTrails, VirusTotal.

Der große Recon-Wert liegt in **E-Mail-Namensmustern**: Findet man `max.mustermann@firma.de`, kennt man wahrscheinlich das Schema `vorname.nachname@` – daraus lassen sich weitere Adressen ableiten. Das ist die Brücke zu **Spear-Phishing** und Password-Spraying (Username-Listen).

> ⚠️ Gesammelte Personen-/Mail-Daten sind **personenbezogen (DSGVO)**. Nur für autorisierte Tests/eigene Domain, nicht zum Belästigen oder realen Phishing Dritter. In der Übung geht es um die **Technik und die Abwehr**, nicht um reale Zielpersonen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `theHarvester` | OSINT-Aggregation | `-d <domain>`, `-b <quelle/all>`, `-l <limit>`, `-f <report>`, `-s` (Shodan) |

Quellen (`-b`): `bing`, `duckduckgo`, `crtsh`, `certspotter`, `hackertarget`, `anubis`, `all` …; einige brauchen **API-Keys** (`/etc/theHarvester/api-keys.yaml`).

## Lab-Setup

- Kali + Internet. Ziel: **deine eigene Domain** (autorisiert, zeigt deinen realen Fußabdruck). Optional API-Keys (Shodan/Hunter) hinterlegen.

## Aufgabe (selbst lösen)

1. Lass `theHarvester` deine Domain über mehrere **keyless** Quellen (z. B. `bing,duckduckgo,crtsh,certspotter`) durchsuchen.
2. Extrahiere die gefundenen **E-Mail-Adressen** und leite daraus das **Namensschema** ab (z. B. `vorname.nachname@`).
3. Sammle zusätzlich die **Hostnamen/Subdomains** und vergleiche mit deinem Ergebnis aus Übung 05 – deckt sich das?
4. Erzeuge einen **Report** (`-f`) in HTML/JSON.
5. **Blue-Team-Teil:** Welche Maßnahmen reduzieren, dass Firmen-E-Mails öffentlich auffindbar sind, und wie schützt man gegen das daraus folgende Phishing?

**Ziel:** ein aggregiertes OSINT-Profil (Mails, Namensschema, Hosts) deiner eigenen Domain plus Verständnis der Phishing-Kette und Gegenmaßnahmen.

## SY0-701 Prüfungsbezug

- **Social engineering / phishing / spear phishing** (2.0): E-Mail-Harvesting ist die Recon-Grundlage zielgerichteter Angriffe.
- **OSINT / reconnaissance** und **data exposure** personenbezogener Daten.
- **Mitigations:** Security-Awareness-Training, E-Mail-Filter, **DMARC/SPF/DKIM**, Reduktion öffentlicher Mail-Adressen, MFA gegen Credential-Missbrauch.
- Begriffe: *spear phishing*, *pretexting*, *OSINT*, *password spraying* (Username-Basis), *SPF/DKIM/DMARC*, *security awareness*.
