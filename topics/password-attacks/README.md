# Thema: Password Attacks

Praxis-Übungen zum **Knacken und Angreifen von Passwörtern** – offline (Hashcat, John the Ripper) und online (Hydra), inklusive Hash-Identifikation, Wortlisten/Rules/Masks, Pass-the-Hash und den zugehörigen Abwehrmaßnahmen. Die Hashes stammen aus den vorherigen Themen (Meterpreter `hashdump`, SQLi-Dumps, `/etc/shadow`).

> ⚠️ **Nur im eigenen, isolierten Lab.** Cracke ausschließlich **eigene** Hashes / Hashes aus deinen Lab-Zielen (Metasploitable/DVWA/eigene VMs). Online-Angriffe (Hydra) nur gegen eigene Dienste.

## Lernziele

- Hash-Typen erkennen und den Unterschied Hashing/Salting/Encryption verstehen
- Offline-Cracking mit John the Ripper und Hashcat beherrschen (Wortlisten, Rules, Masks)
- Linux-`shadow`- und Windows-NTLM-Hashes knacken
- Online-Brute-Force (Hydra) und Pass-the-Hash einordnen
- Zu jedem Angriff die Abwehr kennen (starke Hashes, Salting, MFA, Lockout, Passwort-Policy)

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Password Attacks (brute force, dictionary, spraying, PtH), Credential Access
- **1.0 General Security Concepts** – Hashing, Salting, Key Stretching, Encryption vs. Hashing
- **4.0 Security Operations** – Passwort-Policy, MFA, Lockout, Monitoring

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Hash-Grundlagen & Identifikation | 1/10 |
| 02 | John the Ripper – Wortlisten-Angriff | 2/10 |
| 03 | Hashcat – Basics & Attack-Modes | 3/10 |
| 04 | Linux /etc/shadow cracken | 4/10 |
| 05 | Windows NTLM/LM cracken | 5/10 |
| 06 | Online-Brute-Force mit Hydra | 6/10 |
| 07 | Rule-based & Mask Attacks | 7/10 |
| 08 | Custom-Wortlisten (crunch, cewl) | 8/10 |
| 09 | Pass-the-Hash & Credential Reuse | 9/10 |
| 10 | Vollständige Credential-Attack-Kette + Report | 10/10 |

## Lab-Voraussetzungen

- **Kali Linux** – `hashcat`, `john` (+`unshadow`), `hydra`, `hashid`/`hash-identifier`, `crunch`, `cewl`, `crackmapexec`/`netexec`
- **Hashes aus den vorherigen Themen** – z. B. DVWA-`users` (MD5, aus web-exploitation 04/05), Meterpreter-`hashdump` (exploitation 07), `/etc/shadow` (via NFS/LFI/Shell)
- **Wortlisten** – `rockyou.txt` (`/usr/share/wordlists/rockyou.txt.gz` entpacken), `seclists`
- Für Übung 05/09: Windows-/SMB-Ziel oder NTLM-Beispiel-Hashes; **GPU** beschleunigt Hashcat stark (CPU reicht fürs Lab, ist aber langsamer)

Reihenfolge: starte bei `01-hash-basics-id/`. Pro Übung erst die `.md` lösen, dann `solution.md` öffnen.
