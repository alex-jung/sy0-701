# Übung 07 – Windows-Hardening

**Schwierigkeit: 7/10 · Dauer: ca. 70 Min.**

## Lernziele

- Windows-Grundhärtung über Gruppenrichtlinien (GPO) umsetzen
- Angriffsflächen schließen (SMBv1, LLMNR/NBT-NS, Makros)
- Credential-/LSASS-Schutz und least privilege (lokale Admins) verstehen
- Application Control (AppLocker/WDAC) einordnen

## Theorie

Windows-Härtung schließt die Vektoren aus `active-directory-attacks`/`social-engineering`:

- **SMBv1 deaktivieren**, **SMB-Signing** erzwingen (gegen EternalBlue/NTLM-Relay).
- **LLMNR/NBT-NS/mDNS deaktivieren** (gegen Responder/Poisoning, `ad-attacks` 07).
- **Credential Guard** + **LSA Protection (RunAsPPL)** (gegen mimikatz/Credential Dumping).
- **LAPS** (eindeutige, rotierende lokale Admin-Passwörter → kein Pass-the-Hash-Reuse).
- **Makros** aus dem Internet blockieren, **Attack Surface Reduction (ASR)**-Regeln (Defender).
- **Least privilege:** User nicht lokale Admins; **UAC** aktiv; Tiering.
- **Application Control:** **AppLocker/WDAC** (nur erlaubte Binaries).
- **Patch-Management** (Übung 08), BitLocker (Data at rest).

Umsetzung meist via **GPO** (Domäne) oder lokale Richtlinien; Baseline: **Microsoft Security Baselines**/CIS.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `gpedit.msc`/GPO | Richtlinien |
| `secpol.msc` | Sicherheitsrichtlinien |
| Microsoft Security Baseline / CIS | Referenz |
| LAPS / Credential Guard | Credential-Schutz |

## Lab-Setup

- Eine Windows-VM (Client oder Server; mit AD aus `active-directory-attacks` ideal). Snapshot. Ohne Windows: konzeptionell.

## Aufgabe (selbst lösen)

1. Deaktiviere **SMBv1** und erzwinge **SMB-Signing**; verifiziere.
2. Deaktiviere **LLMNR/NBT-NS** (per GPO/Registry) und teste gegen Responder (kein Hash mehr).
3. Aktiviere **Credential Guard**/**LSA Protection** und zeige, dass mimikatz-LSASS-Dump scheitert (Bezug `ad-attacks` 08).
4. Setze **least privilege**: Standard-User statt lokaler Admin; UAC an; (falls Domäne) LAPS-Konzept.
5. Wende eine **Microsoft/CIS Security Baseline** (Teil) an und blockiere Office-Makros aus dem Internet.

**Ziel:** eine Windows-VM mit geschlossenen Kern-Vektoren (SMBv1/LLMNR/LSASS/Admin-Rechte/Makros), nachweislich wirksam gegen die AD-/SE-Angriffe.

## SY0-701 Prüfungsbezug

- **Windows hardening**, **GPO/Security Baselines**, SMBv1/LLMNR, **Credential Guard/LAPS**, **AppLocker/WDAC**, UAC.
- Gegenmaßnahmen zu AD-Angriffen (Relay/PtH/Dumping) und Makro-Delivery.
- Begriffe: *Group Policy*, *security baseline*, *Credential Guard*, *LAPS*, *application allowlisting*, *ASR*.
