# Übung 03 – Phishing-Mail erkennen & analysieren

**Schwierigkeit: 3/10 · Dauer: ca. 55 Min.**

## Lernziele

- E-Mail-Header lesen und die wahre Herkunft bestimmen
- SPF/DKIM/DMARC-Ergebnisse interpretieren (Spoofing erkennen)
- Phishing-Indikatoren identifizieren (Absender, Links, Sprache, Anhänge)
- Eine Mail als legitim/verdächtig klassifizieren (Blue-Team-Kernkompetenz)

## Theorie

Die **Analyse eingehender Mails** ist zentrale Abwehr. Schlüssel:

- **Header:** `Received`-Kette (tatsächlicher Weg), `Return-Path`/`Envelope-From` vs. angezeigter `From` (Mismatch = Spoofing-Indiz), `Reply-To` (umgeleitete Antwort).
- **SPF:** darf der sendende Server für die Domain senden? (`pass`/`fail`/`softfail`).
- **DKIM:** kryptografische Signatur der Domain intakt? (`pass`/`fail`).
- **DMARC:** Policy + Alignment (From-Domain zu SPF/DKIM passend?) → `pass`/`fail` + `p=none/quarantine/reject`.
- **Inhalt:** Display-Name vs. echte Adresse, **Link-Ziel** (Hover: Text ≠ URL), Lookalike-Domains, Dringlichkeit, generische Anrede, unerwartete Anhänge.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Mail-Client „Original anzeigen" / Texteditor | Rohheader lesen |
| Header-Analyzer (z. B. MXToolbox) | Received/SPF/DKIM/DMARC visualisieren |
| `dig` | SPF/DMARC-Records der Domain (aus `reconnaissance`) |
| `urlscan`/Sandbox | Link-/Anhang-Analyse (nicht live klicken!) |

## Lab-Setup

- Beispiel-Phishing-Mails (eigene Test-Mails mit gefälschtem From, oder anonymisierte Samples). Rohheader verfügbar.

## Aufgabe (selbst lösen)

1. Öffne die **Rohheader** einer Mail und bestimme aus der `Received`-Kette den tatsächlichen sendenden Server.
2. Finde `From` vs. `Return-Path`/`Reply-To`-Mismatches.
3. Lies die **SPF/DKIM/DMARC**-Ergebnisse (Authentication-Results-Header) und interpretiere sie.
4. Prüfe die **Link-Ziele** (ohne zu klicken) auf Lookalike-Domains/Redirects und bewerte Anhänge.
5. Klassifiziere die Mail (legitim/verdächtig/Phishing) und begründe mit konkreten Indikatoren.

**Ziel:** eine Mail technisch zerlegt, Spoofing anhand SPF/DKIM/DMARC erkannt und begründet klassifiziert.

## SY0-701 Prüfungsbezug

- **Phishing-Erkennung**, **E-Mail-Security: SPF, DKIM, DMARC** (Anti-Spoofing) – häufiges Prüfungsthema.
- **Header-Analyse**, Lookalike-Domains, URL-Prüfung.
- **Reporting:** verdächtige Mails melden (Prozess).
- Begriffe: *SPF/DKIM/DMARC*, *email spoofing*, *header analysis*, *lookalike/typosquatting domain*, *phishing indicators*.
