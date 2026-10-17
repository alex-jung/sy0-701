# Übung 04 – Service- & Version-Detection

**Schwierigkeit: 4/10 · Dauer: ca. 40 Min.**

## Lernziele

- Offene Ports nicht nur finden, sondern den **tatsächlichen Dienst + Version** bestimmen
- Verstehen, dass der Port ≠ Dienst ist (Dienste können auf „falschen" Ports laufen)
- Aus Versionsinfos erste Verwundbarkeiten ableiten (CVE-Bezug)

## Theorie

Ein Port-Scan sagt nur „Port 80 ist offen". **Welche Software** dort läuft und **in welcher Version**, verrät erst die *Service-/Version-Detection*: `nmap -sV` schickt Probes und vergleicht die Antworten (Banner, Protokoll-Verhalten) mit der `nmap-service-probes`-Datenbank.

Das ist der Brückenschlag zur **Schwachstellen-Analyse**: „vsftpd 2.3.4" oder „Apache 2.2.8" lassen sich direkt gegen bekannte **CVEs** prüfen. Version ohne Kontext ist nur Info – Version + bekannte CVE = Angriffsfläche.

`--version-intensity 0–9` steuert, wie aggressiv geprobt wird. `-A` kombiniert `-sV` + `-O` (OS) + Traceroute + Default-NSE-Scripts in einem Rutsch.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Version Detection | `-sV`, `--version-intensity <0-9>`, `--version-all` (=9), `-A` (aggressiv, alles) |
| `nc` (netcat) | Banner manuell greifen | `nc <ip> <port>` dann Protokoll-Zeile senden |

## Lab-Setup

- Kali + Metasploitable. Metasploitable 2 ist ideal, weil es absichtlich **veraltete, verwundbare Versionen** fährt.

## Aufgabe (selbst lösen)

1. Bestimme für alle offenen Ports aus Übung 02/03 den **Dienstnamen + Version**.
2. Greife den **FTP-Banner** von Port 21 zusätzlich **manuell mit netcat** und vergleiche mit nmaps `-sV`-Ergebnis.
3. Suche in deiner Liste die **auffällig veraltete** Software heraus (mindestens eine). Notiere Produkt + Version.
4. Recherchiere für eine dieser Versionen eine bekannte **CVE** (z. B. die berüchtigte vsftpd-Backdoor). Notiere CVE-Nummer und was sie erlaubt – **ohne sie auszunutzen** (Exploitation ist ein anderes Thema).

**Ziel:** eine angereicherte Liste „Port → Dienst → Version → (bekannte Schwachstelle?)". Das ist die Grundlage jeder Vulnerability-Bewertung.

## SY0-701 Prüfungsbezug

- **Banner Grabbing** ist Prüfungsbegriff (aktive Recon-Technik zur Dienst-/Versionsermittlung).
- **Vulnerability Management (4.0):** Der Workflow *Discovery → Version → CVE-Abgleich → Priorisierung (CVSS)* ist Kernstoff. Begriffe: **CVE**, **CVSS**, **CPE**, *vulnerability scan vs. port scan*.
- **False positives:** Versions-Scanner raten teils – ein Scan-Ergebnis ist zu verifizieren, bevor man es als Finding meldet (Prüfungsthema *false positive/negative*).
- Begriffe: *banner grabbing*, *service enumeration*, *CVE/CVSS*, *outdated/legacy software* als Vulnerability.
