# swaks

**Kategorie:** SMTP-Test / Mail-Analyse (Swiss Army Knife for SMTP)

Flexibles Kommandozeilen-Tool zum **Testen von SMTP** – Mails senden, Header/Envelope setzen, Auth/TLS prüfen. Nützlich, um SPF/DMARC-Verhalten der **eigenen** Umgebung zu testen und E-Mail-Flüsse zu verstehen.

```bash
swaks --to <empf> --from <abs> --server <smtp> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `--to` / `--from` | Empfänger / Envelope-From |
| `--server <host:port>` | SMTP-Server |
| `--header "From: ..."` | angezeigten From setzen (vs. Envelope) |
| `--body` / `--attach` | Inhalt / Anhang |
| `--auth` `--au`/`--ap` | SMTP-Auth |
| `-tls` / `-tlsc` | STARTTLS / TLS |

## Beispiele

```bash
swaks --to test@eigene-domain.de --from it@eigene-domain.de --server 127.0.0.1
# Envelope vs. angezeigter From (Spoofing-Mechanik verstehen, eigene Testdomain):
swaks --to test@lab.local --from bounce@lab.local --header "From: CEO <ceo@lab.local>" --server 127.0.0.1
```

## Hinweis

Nur **eigene** Test-Mailserver/-Empfänger. Gut, um zu zeigen, wie **Envelope-From ≠ angezeigter From** funktioniert (Grundlage der Header-Analyse, Übung 03) und wie **DMARC-Alignment** darauf reagiert. Installation: `sudo apt install swaks`.

## Verwendet in

social-engineering 03 (Header/SPF/DKIM/DMARC verstehen), 04 (SMTP-Test).
