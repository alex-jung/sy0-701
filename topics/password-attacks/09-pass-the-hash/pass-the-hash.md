# Übung 09 – Pass-the-Hash & Credential Reuse

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- Pass-the-Hash (PtH) verstehen: Authentifizierung **mit dem Hash**, ohne Klartext
- NTLM-Hashes für Zugriff auf SMB/weitere Hosts wiederverwenden
- Credential Reuse / Lateral Movement über mehrere Hosts nachvollziehen
- Gegenmaßnahmen kennen (eindeutige lokale Admin-PW, Credential Guard, Tiering)

## Theorie

Bei NTLM reicht zur Authentifizierung der **NT-Hash** – man muss ihn **nicht cracken**. **Pass-the-Hash (PtH)** nutzt genau das: Mit einem erbeuteten NT-Hash authentifiziert man sich direkt an SMB/WinRM/anderen Diensten, als wäre es das Passwort.

Das wird gefährlich durch **Credential Reuse**: Ist derselbe lokale Admin-Hash auf vielen Rechnern (z. B. identisches Image), erlaubt **ein** Hash **Lateral Movement** über die ganze Flotte. Verwandt: **Pass-the-Ticket** (Kerberos), **Overpass-the-Hash**.

Tools: `crackmapexec`/`netexec` (`-H <hash>`), `pth-winexe`, Impacket (`psexec.py -hashes`), Metasploit (`smb_login`/`psexec` mit `SMBPass` als Hash).

> ⚠️ Nur im eigenen Windows-/SMB-Lab. Für Linux/Metasploitable gibt es kein NTLM-PtH – dieser Teil braucht ein Windows-Lab oder wird konzeptionell durchgespielt.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `crackmapexec`/`netexec` | PtH gegen SMB, Credential-Sweep | `smb <ziel> -u <user> -H <NThash>`, `--local-auth` |
| Impacket `psexec.py` | Shell via PtH | `-hashes :<NThash> user@ziel` |
| Metasploit `smb_login`/`psexec` | PtH im Framework | `SMBPass=<LM:NT>` |

## Lab-Setup

- Windows-/SMB-Lab-Ziel(e) mit bekanntem NT-Hash (aus Übung 05 / hashdump). Alternativ konzeptionell mit Beispielwerten.

## Aufgabe (selbst lösen)

1. Nimm einen NT-Hash (aus Übung 05/hashdump) und authentifiziere dich damit per **PtH** an einem SMB-Ziel – **ohne** den Klartext zu kennen.
2. Prüfe mit crackmapexec/netexec, ob derselbe Hash auf **mehreren** Hosts gilt (Credential Reuse / `--local-auth`).
3. Erlange über PtH eine **Shell**/Befehlsausführung (psexec).
4. Erkläre, warum PtH funktioniert, obwohl das Passwort nicht bekannt ist.
5. Nenne die Gegenmaßnahmen und warum identische lokale Admin-Passwörter so gefährlich sind.

**Ziel:** PtH praktisch (oder konzeptionell) nachvollzogen – Zugriff mit dem Hash + Verständnis von Credential Reuse und Abwehr.

## SY0-701 Prüfungsbezug

- **Pass-the-Hash / Pass-the-Ticket**, **Credential Reuse**, **Lateral Movement** – zentrale AD-/Windows-Angriffe (2.0).
- **Mitigations:** **LAPS** (eindeutige lokale Admin-PW), **Credential Guard**, **Tiering/PAW**, LM/NTLM deaktivieren, MFA, Netzsegmentierung.
- **Kerberos vs. NTLM**; Detection ungewöhnlicher Logons.
- Begriffe: *pass-the-hash*, *credential reuse*, *lateral movement*, *LAPS*, *Credential Guard*, *tiering*.
