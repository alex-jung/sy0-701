# Übung 06 – Indicators of Compromise (IOCs)

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- IOCs erkennen, kategorisieren und von IOAs/TTPs abgrenzen
- Typische Indikatoren aus Lab-Daten extrahieren
- IOCs operationalisieren (Detection/Blocklist)

## Theorie

**Indicators of Compromise (IOCs)** sind forensische Artefakte, die auf eine Kompromittierung hindeuten – **atomar** (konkret) und oft **nach** dem Vorfall. Typen:

- **Netzwerk:** C2-IPs/Domains/URLs, ungewöhnliche DNS, Beaconing, Datenabfluss-Volumen, fremde User-Agents.
- **Host:** Datei-Hashes (MD5/SHA256), Dateinamen/-pfade, Registry-/Autostart-Einträge, neue Dienste/Tasks, verdächtige Prozesse.
- **Account/Verhalten:** Logins zu untypischen Zeiten/Orten, impossible travel, viele Fehlversuche, Privilege-Eskalation, Account-Lockouts.
- **Konkrete Anzeichen (SY0-701):** account lockout, concurrent session usage, blocked content, impossible travel, resource consumption/inaccessibility, out-of-cycle logging, missing logs, published/leaked data.

Abgrenzung: **IOC** = „es ist passiert" (reaktiv); **IOA (Indicator of Attack)** = Angriffsverhalten in Echtzeit (proaktiver); **TTP** = Vorgehensweise (Übung 07). IOCs speist man in **SIEM/IDS/Blocklist/YARA** (→ `logging-siem`, `ids-ips`, `honeypots` 08).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `jq`/SIEM | IOCs aus Logs extrahieren |
| yara/suricata (Bezug) | IOCs anwenden |

## Lab-Setup

- Lab-Daten aus `honeypots`/`logging-siem`/`packet-analysis` (Honeypot-JSON, SIEM-Alerts, PCAP).

## Aufgabe (selbst lösen)

1. Kategorisiere 10 Beispiel-IOCs (Netz/Host/Account) und markiere, welche „stark" (hoher Signalwert) sind.
2. Extrahiere aus vorhandenen Lab-Daten (Honeypot/SIEM/PCAP) mind. **5 echte IOCs** (IPs/Hashes/Domains/Verhalten).
3. Ordne 5 der SY0-701-„Indicators" (impossible travel, account lockout, out-of-cycle logging, …) je einem Szenario zu.
4. Operationalisiere **drei** IOCs (Blocklist/SIEM-Regel/YARA) und grenze IOC von IOA/TTP ab.

**Ziel:** IOCs sicher kategorisieren, aus Lab-Daten extrahieren und operationalisieren.

## SY0-701 Prüfungsbezug

- **2.0/4.0** indicators of compromise (account lockout, impossible travel, concurrent sessions, resource consumption, out-of-cycle logging, missing logs, published data), IOC vs. IOA/TTP.
- Begriffe: *IOC/IOA/TTP*, *C2/beaconing*, *impossible travel*, *out-of-cycle logging*, *hash/domain/IP indicator*.
