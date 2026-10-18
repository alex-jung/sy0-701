# oletools

**Kategorie:** Dokument-Malware-Analyse

Python-Toolsammlung zur Analyse von **Microsoft-Office-/OLE-Dokumenten** – v. a. **VBA-Makros** extrahieren und deobfuskieren (Phishing-Anhänge, Downloader). Rein **statisch/analytisch**, ohne das Dokument zu öffnen/auszuführen.

## Wichtige Tools

| Tool | Zweck |
|------|-------|
| `olevba` | VBA-Makros extrahieren, deobfuskieren, „suspicious"-Keywords/IOCs |
| `oledump.py` | OLE-Streams auflisten/dumpen |
| `oleid` | schnelle Risiko-Einschätzung eines Dokuments |
| `rtfobj` | eingebettete Objekte aus RTF |
| `mraptor` | Makro-Malware-Heuristik (Auto-Exec + Payload + Trigger) |

## Beispiele

```bash
olevba doc.docm                 # Makros + Analyse (AutoOpen/Shell/powershell/URLs)
olevba --deobf doc.docm         # zusätzlich deobfuskieren
oledump.py doc.doc              # Streams (A1:, A2: ...)
oleid doc.doc                   # Risiko-Indikatoren
rtfobj datei.rtf                # RTF-Objekte
```

## Hinweise

Zeigt Auto-Exec (`AutoOpen`/`Document_Open`), `Shell`/`CreateObject`, Base64/`powershell`, URLs → Delivery-Kette (Übung 09). **Nicht** das Dokument in Office öffnen. Installation: `pip install oletools` (auf REMnux vorhanden).

## Verwendet in

malware-analysis 09 (Script-/Dokument-Malware), 10.
