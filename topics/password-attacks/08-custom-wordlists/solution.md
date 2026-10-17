# Lösung – Übung 08: Custom-Wortlisten

`<URL>` = Lab-Website.

## 1. cewl – Website scrapen

```bash
cewl -d 2 -m 6 --with-numbers -w cewl.txt http://<URL>/
wc -l cewl.txt
# Mails zusätzlich sammeln:
cewl -e --email_file mails.txt http://<URL>/
```
`-d` Crawl-Tiefe, `-m` Mindestlänge, `--with-numbers` behält Wörter mit Ziffern. Ergebnis = Begriffe, die auf der Seite vorkommen (Firmen-/Produktnamen etc.).

## 2. cewl + Rules gegen Hash

```bash
hashcat -m 0 -a 0 ziel.hash cewl.txt -r /usr/share/hashcat/rules/best64.rule
```
Die kontextbezogene Liste + Rules trifft zielspezifische Passwörter wie `Firmenname2024!`, die in rockyou fehlen.

## 3. crunch – gemusterte Liste

```bash
# alle 4-stelligen aus Ziffern:
crunch 4 4 0123456789 -o pins.txt
# festes Muster: "Firma" + 4 Ziffern  (@=klein, %=Ziffer, ^=Sonderz., ,=groß)
crunch 9 9 -t Firma%%%% -o firma.txt
# Zeichenraum a-z + 0-9, Länge 6:
crunch 6 6 -f /usr/share/crunch/charset.lst lalpha-numeric -o six.txt
```
`-t` Muster-Platzhalter: `@` Kleinbuchstabe, `,` Großbuchstabe, `%` Ziffer, `^` Sonderzeichen. **Vorsicht Größe:** `crunch 8 8 ?a...` erzeugt Terabytes → immer Muster/Länge begrenzen (`crunch` zeigt die erwartete Dateigröße vorab an).

## 4. Persönliche OSINT-Liste

Aus recon-Begriffen (Namen, Orte, Jahre, Hobbys):
```bash
printf '%s\n' maxmustermann berlin fcbayern 1990 sommer > personal.txt
hashcat -m 0 -a 0 ziel.hash personal.txt -r /usr/share/hashcat/rules/rockyou-30000.rule
```
(Tools wie `cupp`/`mentalist` bauen solche Listen interaktiv aus Personendaten.)

## 5. Wann Custom > rockyou

- Wenn das Passwort **zielbezogen** ist (Firma/Produkt/Person) → steht nicht in generischen Listen, aber in cewl/OSINT-Listen.
- **Policy-Konsequenz:** verbiete kontext-/firmenbezogene Wörter, erzwinge **Länge/Passphrasen**, gleiche gegen **Leak-/Sperrlisten** ab, MFA. „Komplex, aber ratbar" (`Firma2024!`) ist schwach.

## Häufige Fehler / Troubleshooting

- **cewl liefert wenig:** Tiefe erhöhen (`-d 3`), mehrere Seiten; dynamische Seiten liefern weniger.
- **crunch-Datei zu groß:** Muster/Länge einschränken; `crunch` nennt die Größe vorab – abbrechen, wenn GB/TB.
- **Keine Treffer:** Liste + Rules kombinieren; cewl pur ist oft zu „roh".
- **charset.lst-Pfad:** `/usr/share/crunch/charset.lst`.
