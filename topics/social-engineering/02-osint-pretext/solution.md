# Lösung – Übung 02: OSINT & Pretext-Building

## 1. OSINT (eigene Domain)

```bash
theHarvester -d <DEINE_DOMAIN> -b bing,duckduckgo,crtsh
```
Ergibt Mail-Schema (`vorname.nachname@`), öffentliche Rollen/Postfächer (`info@`, `hr@`), aus der Website: Tech-Stack/Dienstleister/Projekte.

## 2. Plausible Pretexte (rollenbasiert)

- „**IT-Support**: wegen Migration bitte einmalig neu anmelden."
- „**Externer Dienstleister** (aus Stellenanzeige/Partner bekannt): brauche Zugang/Bestätigung."
- „**HR/Buchhaltung**: aktualisieren Sie Ihre Bankdaten."
- „**Lieferant** (BEC): geänderte Kontoverbindung für offene Rechnung."

## 3. Beispiel-Pretext (strukturiert)

```
Identität:  "IT-Service-Desk, externe Migration (Firma X)"
Warum:      "Umstellung auf neues SSO heute Nacht"
Bitte:      "Bitte unter <test-link> erneut anmelden, sonst Zugriff weg"
Druck:      Urgency + Authority (IT ordnet an)
Kanal:      E-Mail mit gespooftem Absender it-service@<ähnliche-domain>
```
(Nur als Struktur/Übung – kein Versand an reale Personen.)

## 4. Ermöglichende Infos

Mail-Schema (Adressierung), bekannte Dienstleister/Projekte (Glaubwürdigkeit), Rollen (richtiger Ansprechpartner), Tech-Stack (passende „SSO/VPN"-Story).

## 5. Datensparsamkeit/Awareness

- Weniger personenbezogene Mailadressen öffentlich (Rollen-Postfächer, Obfuskation).
- Zurückhaltung bei Tech-Details in Stellenanzeigen/Posts.
- **Awareness:** „IT fragt nie per Mail nach Passwort", Verifikation über zweiten Kanal, Vier-Augen bei Zahlungs-/Bankdatenänderung (gegen BEC).
- **DMARC/SPF/DKIM** (Übung 03) gegen Spoofing ähnlicher Domains; Lookalike-Domain-Monitoring.

## Häufige Fehler / Troubleshooting

- **Reale Einzelpersonen anvisiert:** verboten – rollenbasiert/fiktiv bleiben.
- **OSINT = Angriff?** Lesen öffentlicher Infos ist passiv; der Missbrauch für Täuschung Dritter ist die Grenze.
- **Pretext ohne Prinzip:** guter Pretext kombiniert Glaubwürdigkeit (OSINT) + psychologischen Hebel (Übung 01).
