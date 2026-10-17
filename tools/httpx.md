# httpx

**Kategorie:** Web-Probing · **Projekt:** ProjectDiscovery

Schneller HTTP-Prober. Nimmt eine Liste von Hosts/Subdomains und prüft, welche **live** sind, mit Status-Code, Titel, Technologie, Weiterleitungen – ideal, um Enum-Ergebnisse (Übung 05) zu verifizieren.

```bash
httpx -l <datei> [Optionen]        # oder: cat subs.txt | httpx
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-l <datei>` | Eingabeliste |
| `-silent` | nur Ergebnisse |
| `-status-code` (`-sc`) | HTTP-Status zeigen |
| `-title` | Seitentitel |
| `-tech-detect` (`-td`) | Technologie erkennen (Wappalyzer) |
| `-location` | Redirect-Ziel |
| `-ip` / `-cname` | IP/CNAME mit ausgeben |
| `-mc <codes>` | nur bestimmte Status-Codes (match) |
| `-o <datei>` | Ausgabe speichern |

## Beispiele

```bash
httpx -l subs_resolving.txt -silent -sc -title -td
cat subs_all.txt | httpx -silent -mc 200,301,302
```

## Hinweis

Nicht verwechseln mit `httpx` (Python-HTTP-Client-Lib). In Kali oft als `httpx-toolkit`. Sendet Requests ans Ziel → nur autorisierte Ziele.

## Verwendet in

reconnaissance 05 (Treffer verifizieren), 10 (Workflow).
