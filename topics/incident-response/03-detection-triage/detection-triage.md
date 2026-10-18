# Übung 03 – Detection & Triage

**Schwierigkeit: 3/10 · Dauer: ca. 55 Min.**

## Lernziele

- Von einem Alert zur Vorfalls-Entscheidung kommen (Triage)
- True/False Positive bewerten und Scope bestimmen
- IoCs sammeln und den Vorfall klassifizieren (Severity)
- Detection-Quellen für die Erstbewertung kombinieren

## Theorie

**Detection & Analysis** beginnt mit einem Signal (IDS-Alert, SIEM-Korrelation, User-Meldung). **Triage** beantwortet schnell:
1. **Echt?** True Positive vs. False Positive (Kontext, mehrere Quellen).
2. **Was/Wie?** welcher Angriff, welche Technik (ATT&CK).
3. **Umfang (Scope)?** welche Hosts/Konten/Daten betroffen, Ausbreitung?
4. **Severity?** (Übung 01) → Priorität/Eskalation.
5. **IoCs** sammeln (IP, Domain, Hash, Konto) für Suche über alle Systeme (`logging-siem` 08).

Gute Triage ist schnell **und** belastbar: lieber kurz verifizieren (SIEM + Capture + Host) als vorschnell ein ganzes Netz abschalten (oder einen echten Angriff als FP abtun).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| SIEM (Wazuh) / IDS (Suricata) | Alerts/Kontext |
| Host-Checks (`ps`,`ss`,`last`, journal) | Verifikation auf dem Host |
| Capture (Wireshark/tshark) | Ground Truth |

## Lab-Setup

- Detection-Stack (`ids-ips`/`logging-siem`). Erzeuge einen „Vorfall" mit Kali (z. B. Brute-Force + erfolgreicher Login, oder Exploit).

## Aufgabe (selbst lösen)

1. Löse einen Vorfall aus (z. B. SSH-Brute-Force gefolgt von erfolgreichem Login) und fange den/die **Alert(s)**.
2. **Triagiere:** TP oder FP? Verifiziere über **mehrere Quellen** (SIEM-Alert + Host `auth.log`/`last` + ggf. Capture).
3. Bestimme den **Scope**: welcher Host, welches Konto, von welcher Quelle, seit wann?
4. Sammle **IoCs** (Quell-IP, Konto) und suche sie über andere Systeme – weitere Betroffene?
5. **Klassifiziere** (Severity, Übung 01) und entscheide: Incident deklarieren + eskalieren?

**Ziel:** einen Alert belastbar triagiert (TP/FP, Scope, IoCs, Severity) und eine begründete Incident-Entscheidung getroffen.

## SY0-701 Prüfungsbezug

- **Detection & analysis / triage**, True/False Positive, **Scoping**, IoC-Sammlung.
- **Severity-Klassifizierung**, Eskalation; Multi-Source-Verifikation.
- Begriffe: *triage*, *true/false positive*, *scope*, *IoC*, *severity/escalation*.
