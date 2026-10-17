# Password Audit Report – <Scope>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0
**Klassifizierung:** Vertraulich (enthält Credential-bezogene Findings)

---

## 1. Executive Summary

<3–5 Sätze: wie viele Hashes geprüft, Crack-Quote, wie schlecht steht es um die Passwörter, Top-Handlungsbedarf.>

**Crack-Quote:** __ von __ Hashes (__ %) in __ Zeit geknackt.
**Gesamtbewertung:** 🔴 / 🟡 / 🟢

---

## 2. Scope & Methodik

- **Quellen der Hashes:** <SQLi-Dump / hashdump / /etc/shadow / NTLM …>
- **Hash-Typen:** <MD5, sha512crypt, NTLM …>
- **Autorisierung:** <eigenes Lab / Audit-Auftrag>
- **Vorgehen:** Wortliste → Rules → Masks → Custom (cewl/crunch); Reuse/PtH-Test
- **Tools:** hashid, john, hashcat (+rules), hydra, netexec, cewl/crunch

---

## 3. Ergebnisse

| Quelle | Hash-Typ | Anzahl | geknackt | Quote |
|--------|----------|--------|----------|-------|
| DVWA users | MD5 | 5 | 5 | 100% |
| /etc/shadow | sha512crypt | 7 | 3 | 43% |
| NTLM | NTLM | 4 | 2 | 50% |

**Häufigste Passwörter:** `password`, `123456`, `<firma>2024`, …
**Muster:** Wort+Jahr+`!`, leetspeak, username=password.
**Wiederverwendung:** <welche Accounts teilen Passwörter/Hashes>

---

## 4. Findings (Policy-Schwächen)

| # | Finding | Beleg | Risiko |
|---|---------|-------|--------|
| 1 | Schwache/kurze Passwörter (in rockyou) | X% in <1 min geknackt | 🔴 |
| 2 | Passwort-Wiederverwendung über Accounts/Hosts | gleiche Hashes | 🔴 |
| 3 | Schnelle/ungesalzene Hashes (MD5/NTLM) | DVWA/NTLM | 🟠 |
| 4 | Firmen-/kontextbezogene Passwörter | cewl-Treffer | 🟠 |

---

## 5. Gegenmaßnahmen (priorisiert)

| Prio | Maßnahme | Begründung |
|------|----------|------------|
| P1 | MFA überall | entwertet geknackte/wiederverwendete Passwörter |
| P1 | Länge ≥ 14 / Passphrasen, Leak-Sperrliste | gegen Wortliste/Rules |
| P1 | Passwort-Wiederverwendung unterbinden (LAPS) | stoppt Reuse/PtH |
| P2 | langsame, gesalzene Hashes (bcrypt/Argon2) | macht Cracking unwirtschaftlich |
| P2 | Account Lockout / Rate-Limit / Monitoring | gegen Online-Angriffe |
| P3 | LM/NTLM deaktivieren, Kerberos/Credential Guard | gegen PtH |

---

## 6. Anhang

- **Verwendete Befehle / Wortlisten / Regeln** (reproduzierbar)
- **Gecrackte Credentials:** <sicher/separat aufbewahren, nicht im Klartext verteilen>
- **Tool-Versionen**
