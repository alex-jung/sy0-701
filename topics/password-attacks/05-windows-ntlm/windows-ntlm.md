# Übung 05 – Windows NTLM/LM cracken

**Schwierigkeit: 5/10 · Dauer: ca. 55 Min.**

## Lernziele

- Windows-Hash-Formate verstehen: LM, NTLM, NetNTLMv1/v2
- NTLM-Hashes (aus SAM/hashdump) knacken
- Die Schwäche von LM-Hashes kennen
- NetNTLMv2 (aus Responder/SMB) von NTLM unterscheiden

## Theorie

Windows speichert lokale Passwort-Hashes in der **SAM**-Datenbank. Formate:

- **LM-Hash:** uralt, extrem schwach (Passwort in 2×7-Zeichen-Blöcke zerlegt, Großbuchstaben) → in Sekunden knackbar; auf modernen Systemen deaktiviert.
- **NTLM (NT-Hash):** MD4 des Passworts, **ungesalzen** → gleiche Passwörter = gleicher Hash, schnell crackbar und **Pass-the-Hash-fähig** (Übung 09). Hashcat-Mode **1000**.
- **NetNTLMv1/v2:** Challenge-Response über das Netz (z. B. per `Responder` abgefangen), **nicht** direkt PtH-fähig, aber crackbar (Mode **5500**/**5600**).

Format aus `hashdump`/secretsdump: `user:RID:LMhash:NThash:::` – relevant ist der **NT-Hash** (3. Feld).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `hashcat` | NTLM/NetNTLM cracken | `-m 1000` NTLM, `-m 5600` NetNTLMv2 |
| `john` | NT-Hashes | `--format=NT` |
| (Quelle) `hashdump`/secretsdump/Responder | Hashes beschaffen | (vorige Themen) |

## Lab-Setup

- NTLM-Hashes aus einem Windows-/SMB-Lab-Ziel (Meterpreter `hashdump`, `secretsdump.py`) **oder** Beispiel-NT-Hashes selbst erzeugen. `rockyou.txt`.

## Aufgabe (selbst lösen)

1. Erzeuge/beschaffe einen **NT-Hash** eines Testpassworts und identifiziere das Format.
2. Cracke den NT-Hash mit **Hashcat `-m 1000`** (und/oder John `--format=NT`).
3. Erkläre, warum NTLM ohne Salt problematisch ist (gleiche Passwörter → gleiche Hashes; PtH).
4. Beschreibe den Unterschied zwischen **NTLM** und **NetNTLMv2** – welcher ist direkt PtH-fähig, welcher nur crackbar?
5. Nenne die Gegenmaßnahmen gegen NTLM-Angriffe.

**Ziel:** einen NTLM-Hash geknackt und die Windows-Hash-Formate (LM/NTLM/NetNTLMv2) sicher eingeordnet.

## SY0-701 Prüfungsbezug

- **Windows-Credential-Formate** (LM/NTLM/NetNTLM); **ungesalzene** Hashes als Schwäche.
- **Pass-the-Hash** (Vorschau Übung 09); **Kerberos vs. NTLM**.
- **Mitigation:** LM/NTLM deaktivieren, Kerberos, lange Passwörter, Credential Guard, MFA.
- Begriffe: *NTLM/LM/NetNTLMv2*, *SAM*, *pass-the-hash*, *Kerberos*, *Credential Guard*.
