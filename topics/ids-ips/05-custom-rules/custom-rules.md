# Übung 05 – Eigene Suricata-Regeln schreiben

**Schwierigkeit: 5/10 · Dauer: ca. 65 Min.**

## Lernziele

- Die Suricata-Regelsyntax aktiv beherrschen
- Eigene Regeln für konkrete Erkennungsziele schreiben
- Match-Keywords nutzen (content, pcre, flow, http.*, flags, threshold)
- Regeln testen und iterativ verfeinern

## Theorie

Regel-Grundstruktur:
```
<action> <proto> <src> <sport> -> <dst> <dport> (<options>)
```
Wichtige Optionen:
- **msg** – Beschreibung · **sid** (eigene ≥ 1000000) · **rev** – Version.
- **content** – Byte-/String-Match (`content:"admin"; nocase;`), **pcre** – Regex.
- **flow** – `to_server,established` etc. · **flags** – TCP-Flags (`flags:S;` für SYN).
- **http.uri / http.header / http.user_agent** – Protokollfelder.
- **threshold/detection_filter** – nur bei X Treffern/Zeit alarmieren (z. B. Brute-Force/Scan).
- **classtype**, **priority**.

Eigene Regeln braucht man für **umgebungsspezifische** Erkennung, die ET-Open nicht abdeckt (z. B. „Zugriff auf unsere interne Admin-URL von außen", eigene Honeytokens, spezifische Malware-IoCs).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| IDS → Administration → Custom-Rules / User-Defined | eigene Regeln einfügen |
| Kali | Traffic zum Auslösen erzeugen |
| `eve.json`/Alerts | Verifikation |

## Lab-Setup

- Laufende Suricata. Ein Test-Dienst (Webserver/DVWA) + Kali.

## Aufgabe (selbst lösen)

1. Schreibe eine Regel, die eine **ICMP-Ping** vom `$EXTERNAL_NET` ins `$HOME_NET` alarmiert. Teste mit `ping`.
2. Schreibe eine **HTTP-Regel**, die den Zugriff auf eine bestimmte URL (z. B. `/admin`) oder einen **verdächtigen User-Agent** (z. B. `sqlmap`, `nikto`) erkennt. Teste.
3. Baue eine Regel mit **threshold**, die erst bei vielen Verbindungen in kurzer Zeit alarmiert (Scan/Brute-Force).
4. Lege eine **Honeytoken-Regel** an (Alarm bei Zugriff auf eine Fake-Datei/Pfad, den niemand legitim aufruft).
5. Verifiziere jede Regel (Alert erscheint) und vergib saubere **SIDs/msg**.

**Ziel:** mindestens drei funktionierende, getestete eigene Regeln (ICMP, HTTP/User-Agent, threshold/honeytoken) mit sauberen SIDs.

## SY0-701 Prüfungsbezug

- **Custom detection / detection engineering**; signaturbasierte Erkennung selbst gestalten.
- **Honeytokens/Canaries** als Erkennungsmechanismus.
- **Threshold/rate-based** Erkennung (Scan/Brute-Force).
- Begriffe: *signature writing*, *detection engineering*, *honeytoken/canary*, *rate-based detection*.
