# Lösung – Übung 10: Awareness-Programm & Abwehr

`awareness-report-template.md` ist das Gerüst; hier der Denkweg.

## 1. Ist-Analyse

Aus Übung 01–09 zusammentragen: welche Kanäle anfällig (Mail/Vishing/Smishing/physisch/Anhang), Simulations-Klick-/Melderate (Übung 04), Prozesslücken (Übung 09: keine Dual Control), technische Lücken (Übung 03: DMARC nur `p=none`).

## 2. Technische Maßnahmen (je Kanal)

Siehe Template-Tabelle: **DMARC `p=reject`** + SPF/DKIM, Mail-Gateway (Sandboxing/Link-Rewriting), **FIDO2-MFA**, Makro-Block + Attachment-Filter + EDR, USB-Device-Control, physische Kontrollen.

## 3. Prozess-Maßnahmen

**Dual Control/Vier-Augen** bei Zahlungen/Bankdatenänderung (gegen BEC), **Verifikation über offiziellen Zweitkanal**, **Melde-Button** + klarer Meldeweg mit IR-Anbindung.

## 4. Awareness-Plan

Rollenbasierte Inhalte, **quartalsweise Simulationen** mit steigendem Schwierigkeitsgrad, **KPIs**: Klickrate ↓, Melderate ↑, Time-to-Report ↓; positive, nicht bloßstellende Kommunikation.

## 5. Report

`awareness-report-template.md` ausfüllen: Ist-Analyse, Maßnahmen je Kanal, Prozesse, Awareness-Plan mit KPIs, priorisierte Roadmap.

## Kernaussagen (Prüfung)

- **Mensch ist primäre Angriffsfläche** → Awareness ist Pflicht, aber nur mit **Prozess + Technik** wirksam (Defense in Depth).
- **MFA (phishing-resistent/FIDO2)** und **DMARC-Enforcement** sind die wirkungsvollsten technischen Einzelhebel.
- **Dual Control** stoppt BEC auch ohne perfekte Erkennung.
- Wirksamkeit wird **gemessen** (KPIs), nicht angenommen.

## Häufige Fehler / Troubleshooting

- **Nur Technik oder nur Awareness:** beides + Prozess nötig.
- **Einmal-Schulung:** Awareness ist ein kontinuierlicher Zyklus mit Metriken.
- **Keine Melde-Kultur:** hohe Klickrate ist weniger schlimm, wenn schnell gemeldet wird → Melderate fördern.
