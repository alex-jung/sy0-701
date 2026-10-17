# Übung 08 – Credential Dumping & Pass-the-Hash

**Schwierigkeit: 8/10 · Dauer: ca. 70 Min.**

## Lernziele

- Credentials aus einem kompromittierten Host dumpen (SAM, LSASS, LSA secrets)
- mimikatz/secretsdump verstehen und anwenden
- Mit erbeuteten Hashes per Pass-the-Hash lateral bewegen
- LSASS-Schutz/Credential Guard als Abwehr kennen

## Theorie

Hat man lokalen Admin auf einem Host, lassen sich **Credentials extrahieren**:
- **SAM:** lokale NT-Hashes.
- **LSASS-Speicher:** Klartext-/NTLM-Credentials **angemeldeter** Nutzer (inkl. Domänen-User, ggf. Admins) – das Kernziel.
- **LSA secrets / cached domain creds, DPAPI, Tickets**.

**mimikatz** (`sekurlsa::logonpasswords`) dumpt aus LSASS; **Impacket secretsdump.py** remote über SMB/DRSUAPI. Mit den NT-Hashes betreibt man **Pass-the-Hash** (Übung: netexec/psexec `-H`) → Lateral Movement, oft bis zu einem Domänen-Admin, der sich mal auf dem Host angemeldet hat.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `mimikatz` | LSASS/SAM/Tickets dumpen (auf Windows) |
| Impacket `secretsdump.py` | remote Hashes/Secrets dumpen |
| `netexec` `--sam`/`--lsa` | Dump über SMB |
| PtH: `netexec -H`/`psexec.py -hashes` | Lateral Movement |

## Lab-Setup

- Kompromittierter Host mit lokalem Admin (aus PrivEsc/Relay). Ein Domänen-Admin, der sich dort angemeldet hat (für den „Jackpot"). Snapshots.

## Aufgabe (selbst lösen)

1. Dumpe lokale Hashes (**SAM**) und – wichtiger – **LSASS**-Credentials (mimikatz `sekurlsa::logonpasswords` oder `secretsdump.py`/netexec).
2. Identifiziere, ob ein **privilegierter** (Domänen-)Account in LSASS lag.
3. Nutze einen erbeuteten **NT-Hash** per **Pass-the-Hash** für Zugriff auf einen weiteren Host.
4. Zeige, wie das zu Lateral Movement Richtung DA führt.
5. Erkläre LSASS-/Credential-Schutz und warum lokale Admin-Rechte so kritisch sind.

**Ziel:** Credentials (idealerweise eines privilegierten Accounts) gedumpt und per PtH einen weiteren Host übernommen.

## SY0-701 Prüfungsbezug

- **Credential dumping** (LSASS/SAM), **Pass-the-Hash**, Lateral Movement.
- **Mitigation:** **Credential Guard** (LSASS-Isolation), **LSA Protection (RunAsPPL)**, LAPS, Tiering, kein DA-Login auf Low-Tier-Hosts, EDR.
- Begriffe: *credential dumping*, *LSASS*, *pass-the-hash*, *Credential Guard*, *LAPS*, *tiering*.
