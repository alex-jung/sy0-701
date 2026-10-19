# Übung 01 – AAA & Authentifizierungs-Faktoren

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- AAA (Authentication, Authorization, Accounting) unterscheiden
- Die drei Faktor-Arten und echte MFA erkennen
- Identification vs. Authentication vs. Authorization sauber trennen

## Theorie

**AAA** ist das Grundgerüst des Zugriffs:
- **Authentication** – „Bist du, wer du vorgibst zu sein?" (Identitätsnachweis)
- **Authorization** – „Was darfst du?" (Rechte nach erfolgreicher Auth)
- **Accounting** – „Was hast du getan?" (Logging/Audit, z. B. via RADIUS/SIEM)

Vorgelagert: **Identification** (Behauptung einer Identität, z. B. Username) ≠ **Authentication** (Beweis).

**Faktoren** (Authentication Factors):
- **Something you know** – Passwort, PIN.
- **Something you have** – Token, Smartcard, Smartphone (TOTP/FIDO2).
- **Something you are** – Biometrie (Fingerprint, Gesicht).
- Ergänzend: **somewhere you are** (Geo/IP), **something you do** (Verhalten/Tipprhythmus).

**MFA (Multi-Factor)** heißt **unterschiedliche** Faktor-**Arten** kombinieren. Passwort + Sicherheitsfrage = **kein** MFA (beide „know"). Passwort + TOTP-App = MFA (know + have).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Einordnung/Analyse |

## Lab-Setup

- Keines. Optional: ein eigener Dienst mit Login zur Analyse.

## Aufgabe (selbst lösen)

1. Ordne je drei konkrete Beispiele den Faktor-Arten (know/have/are) zu.
2. Entscheide für fünf Kombinationen, ob es **echtes MFA** ist – und begründe (z. B. Passwort+PIN, Passwort+TOTP, Fingerprint+Gesicht, Smartcard+PIN, Passwort+Security-Question).
3. Beschreibe für einen Login-Vorgang (z. B. SSH-Login mit Rechten) konkret die Schritte Identification → Authentication → Authorization → Accounting.
4. Nenne je einen Vor- und Nachteil von Biometrie als Faktor.

**Ziel:** AAA und die Faktor-Logik sicher anwenden und echtes MFA erkennen.

## SY0-701 Prüfungsbezug

- **1.0** AAA; authentication factors; MFA; identification vs. authentication vs. authorization.
- Fallen: „zwei Faktoren derselben Art ≠ MFA"; Biometrie-FAR/FRR (Übung-übergreifend).
- Begriffe: *AAA*, *MFA*, *factor types*, *identification/authentication/authorization/accounting*, *FAR/FRR*.
