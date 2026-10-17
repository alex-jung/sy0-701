# gobuster

**Kategorie:** Web-/DNS-Enumeration (Brute-Force)

Schneller Brute-Forcer in Go für **Verzeichnisse/Dateien** (`dir`), **DNS-Subdomains** (`dns`) und **virtual hosts** (`vhost`). Wertet HTTP-Statuscodes aus, um existierende Ressourcen zu finden.

```bash
gobuster <mode> -u <url> -w <wortliste> [Optionen]
```

## Modi & wichtige Optionen

| Element | Bedeutung |
|---------|-----------|
| `dir` | Verzeichnisse/Dateien brute-forcen |
| `dns` | Subdomains brute-forcen (`-d <domain>`) |
| `vhost` | Virtual Hosts (`--append-domain`) |
| `-u <url>` / `-d <domain>` | Ziel |
| `-w <datei>` | Wortliste |
| `-x php,txt,bak` | Datei-Extensions (dir) |
| `-t <n>` | Threads |
| `-s` / `-b` | Statuscodes whitelisten / blacklisten |
| `-k` | TLS nicht prüfen · `-o <datei>` Output · `-q` quiet |

## Beispiele

```bash
gobuster dir -u http://<ZIEL>/ -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -x php,txt,bak -t 50
gobuster vhost -u http://<ZIEL> -w subdomains.txt --append-domain
gobuster dns -d example.com -w subdomains.txt
```

## Hinweis

Erzeugt viele Requests (laut) → nur autorisierte Ziele. Installation: `sudo apt install gobuster`.

## Verwendet in

enumeration 09 (Web Content Enumeration), 10.
