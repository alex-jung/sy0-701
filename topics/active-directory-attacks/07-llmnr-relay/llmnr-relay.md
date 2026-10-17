# Übung 07 – LLMNR/NBT-NS Poisoning & NTLM Relay

**Schwierigkeit: 7/10 · Dauer: ca. 65 Min.**

## Lernziele

- LLMNR/NBT-NS-Poisoning verstehen (NetNTLM-Hashes abfangen)
- Mit Responder Hashes capturen und offline cracken
- NTLM-Relay (ntlmrelayx) ohne Cracking verstehen
- SMB-Signing und LLMNR-Deaktivierung als Abwehr kennen

## Theorie

Wenn die DNS-Auflösung fehlschlägt, fragen Windows-Clients per **LLMNR/NBT-NS** (Broadcast) „wer ist `\\fileserv`?". Ein Angreifer im selben Segment **antwortet gefälscht** („ich!") → der Client authentifiziert sich bei ihm und schickt seinen **NetNTLMv2-Hash** → **offline crackbar** (Mode 5600).

**NTLM-Relay:** statt zu cracken, **leitet** man die Authentifizierung in Echtzeit an einen anderen Dienst weiter (`ntlmrelayx`). Klappt der Zieldienst **ohne SMB-Signing**, authentifiziert man sich dort **als das Opfer** → Command Execution/Dump, **ohne** das Passwort zu kennen. Besonders stark, wenn das Opfer lokaler Admin auf dem Zielhost ist.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `responder` | LLMNR/NBT-NS/mDNS poisoning → NetNTLM capturen |
| Impacket `ntlmrelayx.py` | NTLM-Relay zu SMB/LDAP |
| `hashcat -m 5600` | NetNTLMv2 cracken |

## Lab-Setup

- Test-AD mit Client(s), die Namensauflösung triggern (z. B. Zugriff auf nicht existenten Share). Kali im selben Segment. Ein Zielhost **ohne** SMB-Signing fürs Relay.

## Aufgabe (selbst lösen)

1. Starte **Responder** und provoziere/erwarte eine Namensauflösung eines Clients → fange den **NetNTLMv2-Hash** ab.
2. Cracke den Hash offline mit **hashcat -m 5600**.
3. Richte **ntlmrelayx** ein und **relaye** eine Authentifizierung zu einem SMB-Ziel **ohne Signing** → führe einen Befehl aus / dumpe SAM.
4. Prüfe mit netexec, welche Hosts **SMB-Signing** erzwingen (relay-fähig oder nicht).
5. Erkläre den Unterschied Cracking vs. Relay und die Gegenmaßnahmen.

**Ziel:** einen NetNTLMv2-Hash per Responder abgefangen (+ gecrackt) und eine Authentifizierung per ntlmrelayx weitergeleitet.

## SY0-701 Prüfungsbezug

- **LLMNR/NBT-NS poisoning**, **NTLM relay**, NetNTLMv2.
- **Mitigation:** **LLMNR/NBT-NS deaktivieren**, **SMB-Signing erzwingen**, NTLM einschränken, PMF/Netzsegmentierung.
- Begriffe: *LLMNR/NBT-NS poisoning*, *NTLM relay*, *NetNTLMv2*, *SMB signing*, *responder*.
