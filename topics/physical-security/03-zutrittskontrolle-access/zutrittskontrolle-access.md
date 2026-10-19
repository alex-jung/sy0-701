# Übung 03 – Zutrittskontrolle (Access Control)

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Physische Zutrittskontrollmechanismen verstehen und auswählen
- Locks, Badges, Biometrie, Mantrap/Vestibule einordnen
- Tailgating/Piggybacking und Gegenmaßnahmen kennen

## Theorie

**Physical Access Control** regelt, **wer** physisch wohin darf. Mechanismen (SY0-701):

- **Locks:** mechanisch (Schlüssel), **cipher/combination**, **electronic**, **smart/biometric locks**.
- **Access badges:** Prox-/Smartcards (RFID/NFC), **PIN**-Pads; oft kombiniert (badge + PIN = „MFA" physisch).
- **Biometrics:** Fingerprint, Iris, Gesicht (**FAR/FRR/CER** beachten).
- **Access control vestibule / mantrap:** Schleuse mit zwei Türen → verhindert **tailgating** (nur eine Person pro Durchgang).
- **Guards**, **reception/visitor management**, **escort**, **key management** (Schlüsselverwaltung), **logging/audit** der Zutritte.

Prinzipien: **Least Privilege** (nur nötige Zonen), **Separation** (sensible Zonen stärker), **Logging** (wer wann wo – Accounting). Bezug: `authentication` (Faktoren/MFA – gleiche Logik physisch), `social-engineering` (tailgating/impersonation).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Zutritts-Design |

## Lab-Setup

- Dein Lab-Raum/Schrank als Beispiel (Schloss/Zugang).

## Aufgabe (selbst lösen)

1. Vergleiche Lock-Typen (mechanisch/cipher/electronic/biometrisch) nach Sicherheit/Komfort/Kosten.
2. Erkläre, wie **badge + PIN** physische „MFA" bildet, und ordne Biometrie den Faktor-Arten zu.
3. Beschreibe **tailgating/piggybacking** und wie ein **Mantrap/Vestibule** + Awareness es verhindert.
4. Entwirf eine **gestufte Zutrittskontrolle** für dein Lab (öffentlich → Raum → Rack) inkl. Logging.

**Ziel:** passende Zutrittskontrollen auswählen, physische MFA/Tailgating-Abwehr verstehen und gestuft entwerfen.

## SY0-701 Prüfungsbezug

- **1.0/2.0** access control vestibule/mantrap, badges, locks (biometric/cipher/electronic), guards, tailgating/piggybacking, visitor management.
- Begriffe: *access badge/smartcard*, *mantrap/vestibule*, *tailgating/piggybacking*, *biometrics (FAR/FRR)*, *key management*, *least privilege (physisch)*.
