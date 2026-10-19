# Übung 06 – DLP – Data Loss Prevention

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- DLP-Konzept, -Typen und -Platzierung verstehen
- DLP-Policies/Detection-Methoden entwerfen
- DLP in die Data-Protection-Architektur einbetten

## Theorie

**DLP (Data Loss/Leak Prevention)** erkennt und verhindert unautorisierten Abfluss sensibler Daten. Platzierung/Typen (SY0-701):

- **Network DLP** – überwacht Daten **in transit** (E-Mail, Web-Upload, Transfer) am Gateway/Proxy.
- **Endpoint DLP** – auf dem Gerät: Kopieren auf **USB**, Drucken, Clipboard, Upload.
- **Storage/Cloud DLP** – Daten **at rest** in File-Shares/Clouds; CASB-integriert.

**Detection-Methoden:** **pattern matching/Regex** (Kreditkarten, IBAN, SSN), **Keywords/Dictionaries**, **classification labels/tags** (Übung 02), **fingerprinting/exact data match**, **statistical/ML**. **Aktionen:** log/alert, block, quarantine, encrypt, notify. 

DLP braucht gute **Klassifizierung/Labeling** als Basis und sinnvolle **Policies**, sonst False Positives/Umgehung. Grenzen: verschlüsselter/privater Verkehr, persönliche Geräte, „analoge" Lücken (Foto vom Bildschirm). Bezug: `governance-compliance` (Policy), `security-architecture` (Platzierung/Proxy), CASB (Cloud).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Regex/Skript | pattern matching Demo |
| (Konzept) DLP/CASB | Policy/Platzierung |

## Lab-Setup

- Test-Datensatz mit „sensiblen" Mustern (Fake-Kartennummern/IBAN) + ein Skript als Mini-DLP-Scanner.

## Aufgabe (selbst lösen)

1. Unterscheide Network-, Endpoint- und Storage-DLP und ordne je einen Abfluss-Weg zu (USB/Mail/Cloud).
2. Schreibe einen **Mini-DLP-Scanner** (Regex), der in Testdaten Kreditkarten-/IBAN-Muster findet (als „Detection").
3. Entwirf **drei DLP-Policies** (Bedingung → Aktion), z. B. „confidential-Tag + Mail nach extern → block".
4. Nenne drei **Grenzen/Umgehungen** von DLP und je eine Ergänzung (Encryption/Labeling/Awareness).

**Ziel:** DLP-Typen/Policies verstehen und eine einfache pattern-basierte Detection praktisch umsetzen.

## SY0-701 Prüfungsbezug

- **3.0/4.0** DLP (network/endpoint/storage), detection (pattern/keyword/label/fingerprint), actions (block/alert/quarantine), CASB.
- Begriffe: *DLP (network/endpoint/storage)*, *pattern matching/regex*, *classification label*, *block/quarantine*, *CASB*, *exfiltration*.
