# Social Engineering – Awareness & Defense Program – <Org>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: wichtigste SE-Risiken der Org, aktueller Reifegrad, Top-Maßnahmen.>

---

## 2. Ist-Analyse (aus Übung 01–09)

- **Anfällige Kanäle:** Mail / Vishing / Smishing / physisch / Anhänge
- **Simulationsergebnis:** Klickrate __ %, Melderate __ %
- **Schwächen:** <z. B. kein DMARC-Enforcement, keine Dual-Control bei Zahlungen>

---

## 3. Technische Maßnahmen (je Kanal)

| Kanal | Maßnahme |
|-------|----------|
| E-Mail | SPF+DKIM+**DMARC p=reject**, Gateway-Sandboxing, Link-Rewriting, Ext-Banner |
| Login/Konten | **phishing-resistente MFA (FIDO2)**, Passwort-Manager |
| Vishing/Smishing | Rückruf-Policy, OTP nie weitergeben, Callback-Blocking |
| Anhänge | Makro-Block, gefährliche Typen filtern, EDR, Allowlisting |
| Physisch | Access Vestibule, Badge+MFA, USB-Device-Control, Shredding |

---

## 4. Prozess-Maßnahmen

- **Dual Control / Vier-Augen** bei Zahlungen & Bankdatenänderungen (gegen BEC)
- **Verifikation über zweiten/offiziellen Kanal**
- **Melde-Button** + definierter Meldeweg → IR-Einbindung

---

## 5. Awareness-Plan

| Element | Inhalt |
|---------|--------|
| Zielgruppen | alle + rollenspezifisch (Buchhaltung/Exec/IT) |
| Inhalte | Phishing/Vishing/Smishing/BEC/physisch erkennen & melden |
| Simulationen | quartalsweise, steigender Schwierigkeitsgrad |
| **KPIs** | Klickrate ↓, Melderate ↑, Time-to-Report ↓ |

---

## 6. Priorisierte Roadmap

| Prio | Maßnahme | Wirkung |
|------|----------|---------|
| P1 | MFA (FIDO2) + DMARC enforcement | entwertet Credential-Phishing/Spoofing |
| P1 | Dual Control Zahlungen | gegen BEC |
| P2 | Melde-Button + Awareness-Zyklus | schnellere Erkennung |
| P3 | USB-/physische Kontrollen | Baiting/Tailgating |

## 7. Anhang

- Simulationsmetriken, DMARC-Status, Schulungsmaterial-Verweise
