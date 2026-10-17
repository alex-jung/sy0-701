# xsltproc

**Kategorie:** Reporting · **Teil von:** `libxslt`

Wendet ein XSLT-Stylesheet auf eine XML-Datei an. In den Übungen genutzt, um die **nmap-XML-Ausgabe (`-oX`) in einen lesbaren HTML-Report** zu wandeln.

```bash
xsltproc [Optionen] <stylesheet.xsl> <input.xml>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-o <datei>` | Ausgabe in Datei schreiben |
| `--stringparam k v` | Parameter ans Stylesheet übergeben |
| `-v` | verbose |

## nmap-Report erzeugen

```bash
# 1) nmap mit XML-Ausgabe
sudo nmap -sV -sC -oX scan.xml 192.168.56.100

# 2) XML -> HTML
xsltproc scan.xml -o scan.html
#   nmap referenziert sein Stylesheet (nmap.xsl) i.d.R. selbst in der XML.
#   Alternativ explizit:
xsltproc /usr/share/nmap/nmap.xsl scan.xml -o scan.html
```

Dann `scan.html` im Browser öffnen – übersichtliche Tabelle je Host/Port/Dienst.

## Hinweise

- Fehlt das Tool: `sudo apt install xsltproc`.
- Nutzt man `-oA <basis>`, entsteht die XML automatisch mit (`basis.xml`).

## Verwendet in

Übung 10 (HTML-Report der Enumeration).
