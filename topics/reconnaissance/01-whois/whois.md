# Übung 01 – WHOIS & Domain-Registrierungsdaten

**Schwierigkeit: 1/10 · Dauer: ca. 25 Min.**

## Lernziele

- WHOIS als passive Infoquelle verstehen und abfragen
- Registrar, Name-Server, Erstellungs-/Ablaufdatum, Kontakte auslesen
- Den Effekt von **WHOIS-Privacy / GDPR-Redaction** erkennen
- IP-WHOIS (RIR) von Domain-WHOIS unterscheiden

## Theorie

**WHOIS** ist ein öffentliches Protokoll, über das Registrierungsdaten von Domains und IP-Bereichen abgefragt werden. Es ist **rein passiv** – du liest nur öffentliche Register, das Ziel merkt davon nichts.

Zwei Arten:
- **Domain-WHOIS:** wer hat `example.com` registriert, bei welchem Registrar, welche Name-Server, wann erstellt/läuft ab. Verwaltet von Registraren/Registries.
- **IP-WHOIS (RIR):** welchem Unternehmen/ISP gehört eine IP bzw. ein Netzblock. Verwaltet von den **RIRs** (RIPE für Europa, ARIN Nordamerika, APNIC, LACNIC, AFRINIC).

Seit **GDPR/DSGVO** sind persönliche Kontaktdaten in europäischen Domain-WHOIS meist **geschwärzt** („REDACTED FOR PRIVACY") – ein wichtiger realer Effekt.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `whois` | WHOIS-Abfrage | `whois <domain>`, `whois <ip>`, `-h <server>` (bestimmter WHOIS-Server) |

## Lab-Setup

- Kali mit Internetzugang. Kein Ziel-Setup nötig (öffentliche Register).
- Ziele: **deine eigene Domain** (falls vorhanden) sowie harmlose Demo-Domains wie `example.com`, `iana.org`.

## Aufgabe (selbst lösen)

1. Frage die WHOIS-Daten einer Domain ab und bestimme: **Registrar**, **Creation Date**, **Expiry Date**, **Name-Server**.
2. Finde heraus, ob die Registrant-Kontaktdaten sichtbar oder **redacted** sind. Woran erkennst du Privacy-Protection?
3. Mache eine **IP-WHOIS**-Abfrage (nimm z. B. die aufgelöste IP der Domain) und bestimme die zuständige **Organisation/RIR** und den **Netzblock (CIDR)**.
4. Erkläre: Welche dieser Infos sind für einen Angreifer in der Recon-Phase wertvoll – und warum ist WHOIS trotzdem „passiv"?

**Ziel:** vollständiger WHOIS-Steckbrief einer Domain (Registrar, Daten, NS, Kontaktstatus) plus zugehöriger IP-Netzblock.

## SY0-701 Prüfungsbezug

- **Passive reconnaissance / OSINT:** WHOIS ist der Klassiker – öffentliche Daten ohne Kontakt zum Ziel.
- **Attack surface / footprinting:** Name-Server und Netzblöcke verraten Infrastruktur und weitere Ziele.
- **Datenschutz als Kontrolle:** WHOIS-Privacy/GDPR-Redaction als Beispiel für *data minimization* (reduziert Informationslecks).
- Begriffe: *OSINT*, *passive recon*, *registrar/registrant*, *RIR (RIPE/ARIN/…)*, *WHOIS privacy*, *footprinting*.
