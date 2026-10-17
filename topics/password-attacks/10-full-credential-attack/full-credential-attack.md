# Übung 10 – Vollständige Credential-Attack-Kette + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle Passwort-Angriffstechniken zu einer Kette verbinden (Beschaffung → Cracking → Reuse)
- Den gesamten Credential-Access-Workflow methodisch durchführen
- Ergebnisse in eine Password-Audit-/Abwehr-Perspektive überführen
- Einen Report mit Findings, Passwort-Policy-Schwächen und Gegenmaßnahmen erstellen

## Theorie

Credential Access ist selten ein einzelner Schritt, sondern eine **Kette**:

1. **Beschaffung:** Hashes/Credentials aus vorherigen Phasen (SQLi-Dump, Meterpreter `hashdump`, `/etc/shadow`, NetNTLM via Responder).
2. **Identifikation:** Hash-Typen bestimmen (Übung 01).
3. **Cracking:** Wortliste → Rules → Masks → Custom-Listen (Übung 02–08), vom Günstigen zum Teuren.
4. **Reuse / Lateral Movement:** geknackte Klartexte + Hashes gegen weitere Dienste/Hosts (Spraying, PtH – Übung 06/09).
5. **Audit-Perspektive:** dieselben Techniken dienen defensiv als **Password Audit** (welche Firmenpasswörter sind schwach?).

Report: welche Credentials fielen, **warum** (Policy-Schwächen), und wie man es behebt.

## Verwendete Tools

Kombination aus Übung 01–09: `hashid`, `john`, `hashcat` (+Rules/Masks), `hydra`, `cewl`/`crunch`, `netexec`/`crackmapexec`, Impacket.

## Lab-Setup

- Hashes/Dumps aus den vorigen Themen (DVWA-`users`, `/etc/shadow`, NTLM). Wortlisten + Regeln. Optional Windows-Lab für PtH.

## Aufgabe (selbst lösen)

Du bekommst den „Auftrag" eines **Password Audits** gegen gesammelte Lab-Credentials.

1. **Sammeln & Identifizieren:** führe alle verfügbaren Hashes zusammen und bestimme je Quelle den Typ.
2. **Cracking-Strategie:** arbeite von günstig nach teuer – Wortliste → Rules → Masks → Custom (cewl/crunch). Dokumentiere, was wann fiel.
3. **Statistik:** wie viele % wurden geknackt? Häufigste Passwörter/Muster? Wiederverwendung über Accounts?
4. **Reuse/Lateral:** teste geknackte Credentials gegen andere Dienste (Spraying) bzw. Hashes per PtH (falls Windows-Lab).
5. **Report:** erstelle einen Password-Audit-Report: Crack-Quote, schwache/mehrfach genutzte Passwörter, Policy-Lücken, priorisierte Gegenmaßnahmen (Länge, Sperrlisten, MFA, langsame Hashes, LAPS).

**Ziel:** eine vollständige Credential-Attack-Kette durchgespielt und in einen verwertbaren Password-Audit-Report mit Gegenmaßnahmen überführt.

## SY0-701 Prüfungsbezug

- **Credential access end-to-end**; **password audit** als defensive Anwendung derselben Tools.
- **Password policy** (Länge > Komplexität, Sperrlisten/Leak-Abgleich), **MFA**, **langsame Hashes**, **LAPS**, **Lockout**.
- **Reporting/Risikobewertung**; Kill-Chain-Einbettung (Credential Access → Lateral Movement).
- Begriffe: *credential access*, *password audit*, *password policy*, *MFA*, *key stretching*, *LAPS*, *lateral movement*.
