# Lösung – Übung 08: Physical Social Engineering

## 1. Technik → Kontrolle

| Technik | Gegenmaßnahme |
|---------|---------------|
| Tailgating | **Access Vestibule/Mantrap**, Drehkreuze, „nur eine Person pro Badge", Awareness |
| Baiting (USB) | **USB-Device-Control/Port-Blocking**, Disable Autorun, EDR, „gefundene Sticks abgeben" |
| Badge-Cloning | moderne, verschlüsselte Smartcards statt klonbarer Low-Freq-RFID; MFA am Zutritt |
| Dumpster Diving | **Shredding**, sichere Entsorgung, Clean-Desk |
| Shoulder Surfing | Sichtschutzfolien, Positionierung, PIN-Verdeckung |

## 2. USB-Drop-Mechanik

- **Autorun-Stick:** verlässt sich darauf, dass eine Datei ausgeführt wird (Autorun ist heute meist aus) → Opfer muss aktiv klicken.
- **HID („Rubber Ducky"):** meldet sich als **Tastatur** an → tippt bei Einstecken automatisch Befehle (öffnet PowerShell, lädt Payload). Umgeht Autorun-Schutz, weil es „Benutzer-Eingabe" simuliert.

## 3. Harmloses HID-Payload (Lab)

Konzept (eigene Test-VM): ein HID-Device, dessen „Tastenfolge" nur z. B. Notepad öffnet / eine Markerdatei schreibt – zeigt das Prinzip ohne Schaden. (Nicht gegen fremde Geräte.)

## 4. Autorisiertes physisches Assessment (Rahmen)

- **Scope:** welche Gebäude/Bereiche/Techniken erlaubt.
- **Regeln:** Zeiten, verbotene Zonen, Safety (keine Gefährdung), Kontaktperson.
- **Authorization-Letter / „Get out of jail":** schriftliche Freigabe für den Fall, dass man gestellt wird.
- **Reporting:** Fotos/Notizen, keine echten Daten entwenden.

## 5. Abwehr (physisch + organisatorisch)

Access Vestibule/Mantrap, Badge+PIN/MFA, Begleitpflicht für Besucher, Wachpersonal/Kameras, Clean-Desk, Shredding, USB-Device-Control, Awareness („nicht durchlassen", „keine fremden USBs").

## Häufige Fehler / Troubleshooting

- **Reales Gebäude/echte Personen ohne Freigabe:** verboten – nur mit schriftlicher Autorisierung.
- **HID gegen fremde Rechner:** tabu – eigene Test-VM, harmloser Payload.
- **RFID klonen:** nur eigene Karten/Konzept; verschlüsselte Smartcards sind nicht trivial klonbar.
