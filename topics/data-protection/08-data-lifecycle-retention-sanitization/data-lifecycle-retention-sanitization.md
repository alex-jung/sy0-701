# Übung 08 – Data Lifecycle, Retention & Sanitization

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Den Daten-Lebenszyklus und Retention-Anforderungen verstehen
- Sichere Löschung/Sanitization (NIST 800-88) anwenden
- Media-spezifische Löschverfahren und Nachweise (Zertifikat) einordnen

## Theorie

Daten durchlaufen einen **Lifecycle:** create → store → use → share → archive → **destroy**. Governance legt **Retention** (Aufbewahrungsfristen – gesetzlich/geschäftlich) und **Disposal** fest. Zu lange aufbewahren = unnötiges Risiko/Compliance-Verstoß; zu früh löschen = rechtliches Problem (`governance-compliance`).

**Sanitization (sichere Löschung, NIST SP 800-88):** 
- **Clear** – überschreiben (logisch, für Wiederverwendung im selben Kontext).
- **Purge** – gründlicher (Cryptographic Erase, mehrfaches Überschreiben, Secure Erase/ATA) – Daten auch mit Laboraufwand nicht wiederherstellbar.
- **Destroy** – physische Zerstörung (shred/degauss/incinerate) für höchste Sicherheit/End-of-Life.

Wichtig: „Datei löschen" (rm/Papierkorb) entfernt nur die Referenz → Daten bleiben wiederherstellbar. **Cryptographic Erase** (Key vernichten bei verschlüsselten Medien) ist schnell/effektiv. SSDs brauchen **Secure Erase** (Überschreiben unzuverlässig wegen wear-leveling). Für Entsorgung/Weitergabe: **Sanitization-Nachweis/Zertifikat**. Bezug: `data-classification` (höhere Klasse → gründlichere Methode).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `shred`/`wipe` | Überschreiben (HDD) |
| `cryptsetup`/`blkdiscard`/hdparm | Cryptographic/Secure Erase |
| (Konzept) degausser/shredder | physische Zerstörung |

## Lab-Setup

- Test-Datei/Loopback-Device (keine Produktivdaten). HDD vs. SSD-Unterschiede beachten.

## Aufgabe (selbst lösen)

1. Skizziere den Lifecycle einer sensiblen Lab-Datenart (z. B. Logs mit IPs) inkl. Retention + Disposal.
2. Zeige praktisch, dass **einfaches `rm`** Daten nicht wirklich entfernt (Recovery-Konzept) und wende **`shred`** auf eine Testdatei an.
3. Ordne Clear/Purge/Destroy je einem Szenario + Datenklasse zu (Wiederverwendung intern / Weitergabe / Top-Secret-EOL).
4. Erkläre **Cryptographic Erase** und warum SSDs besondere Verfahren brauchen; nenne den Zweck eines **Sanitization-Zertifikats**.

**Ziel:** Lifecycle/Retention gestalten und klassen-/mediengerechte sichere Löschung (NIST 800-88) anwenden.

## SY0-701 Prüfungsbezug

- **3.0/5.0** data lifecycle, retention, sanitization/destruction (clear/purge/destroy), NIST 800-88, cryptographic erase, degaussing/shredding, disposal, certification.
- Begriffe: *data lifecycle*, *retention*, *sanitization (clear/purge/destroy)*, *cryptographic erase*, *degaussing/shredding*, *SSD secure erase*, *certificate of destruction*.
