# Übung 08 – IOCs & Threat Intelligence ableiten

**Schwierigkeit: 8/10 · Dauer: ca. 90 Min.**

## Lernziele

- Aus Honeypot-Daten strukturierte **IOCs** extrahieren
- IOCs anreichern und in verwertbare Threat Intelligence überführen
- Die Erkenntnisse operativ nutzen: Blocklisten, IDS-Regeln, SIEM-Watchlists

## Theorie

Honeypots produzieren rohe Angreiferdaten; Wert entsteht erst durch **Analyse & Operationalisierung**. **IOCs (Indicators of Compromise)** aus Honeypots: Quell-IPs/ASNs, Credentials, User-Agents/SSH-Client-Versionen, Download-URLs/Domains, Datei-Hashes (SHA256), Befehlssequenzen.

**Pyramid of Pain** (David Bianco): Hashes zu blocken tut dem Angreifer kaum weh (leicht zu ändern), IPs/Domains etwas mehr, aber **TTPs** zu erkennen trifft ihn am härtesten. Deshalb neben atomaren IOCs auch **Verhaltensmuster** (z. B. „Login → `uname` → `wget` eines ELF → chmod+exec") festhalten.

Operationalisieren: IPs → OPNsense-Blocklist/Suricata-Drop, Hashes → YARA/AV/`malware-analysis`, Domains → DNS-Sink/IDS, TTPs → SIEM-Detection-Regeln. Format: strukturierte IOC-Liste, idealerweise **STIX/MISP**-kompatibel.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `jq` | IOCs aus JSON extrahieren |
| Suricata / OPNsense | IPs/Domains blocken (Anbindung `ids-ips`) |
| YARA | Hashes/Samples (Anbindung `malware-analysis`) |
| (MISP/STIX) | IOC-Austauschformat |

## Lab-Setup

- Daten aus Übungen 03/05/07. Suricata/OPNsense und YARA aus den Blue-Team-Themen zur Verwertung.

## Aufgabe (selbst lösen)

1. Extrahiere aus deinen Cowrie/Dionaea-Daten eine **deduplizierte IOC-Liste**: IPs, Domains/URLs, SHA256, SSH-Client-Versionen.
2. Kategorisiere jeden IOC nach **Pyramid of Pain** und begründe, was wie viel „Schmerz" bringt.
3. Leite aus einer beobachteten Befehlskette **ein TTP-Muster** ab und formuliere dafür eine **Suricata- oder SIEM-Detection** (als Regel-Entwurf).
4. Überführe mind. **drei** IPs in eine OPNsense/Suricata-Blockliste und mind. **einen** Hash in eine YARA-/Hash-Watchlist.

**Ziel:** eine strukturierte, kategorisierte IOC-Liste + ein TTP-basierter Detection-Entwurf + konkrete Verwertung (Block/Watchlist).

## SY0-701 Prüfungsbezug

- **2.0** Indicators of Compromise; Threat Intelligence; Threat Actors/TTPs.
- **4.0** Threat Hunting, IOC-Sharing, Detection Engineering.
- Begriffe: *IOC*, *TTP*, *Pyramid of Pain*, *threat intelligence*, *STIX/MISP*, *blocklist*.
