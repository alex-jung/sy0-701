# Übung 07 – MITRE ATT&CK & TTPs

**Schwierigkeit: 7/10 · Dauer: ca. 80 Min.**

## Lernziele

- MITRE ATT&CK (Taktiken/Techniken/Prozeduren) verstehen und anwenden
- Beobachtetes Verhalten auf ATT&CK mappen
- ATT&CK mit Kill Chain und Diamond Model in Beziehung setzen

## Theorie

**TTPs** = **Tactics, Techniques, Procedures** – das *Wie* eines Angreifers:
- **Tactic** = Ziel/Phase (Warum, z. B. *Initial Access*, *Persistence*, *Exfiltration*).
- **Technique** = Methode (Wie, T-ID, z. B. T1566 Phishing, T1059 Command/Scripting).
- **Procedure** = konkrete Umsetzung (genaue Schritte/Tools eines Akteurs).

**MITRE ATT&CK** ist eine kuratierte Wissensbasis dieser Taktiken/Techniken (Enterprise/Mobile/ICS) mit **ATT&CK Navigator** zur Visualisierung von Abdeckung/Erkennung. Ergänzende Modelle:
- **Cyber Kill Chain (Lockheed Martin):** 7 Phasen (Recon → Weaponization → Delivery → Exploitation → Installation → C2 → Actions). Linear, angriffsphasenorientiert.
- **Diamond Model:** Adversary – Capability – Infrastructure – Victim (Analyse-Pivoting).

Nutzen: Verhalten (aus Übungen/Logs) einheitlich **benennen**, Detection/Controls **mappen** (threat-informed defense, Bezug `security-controls` 07), Lücken sehen. TTPs sind der **oberste** Teil der Pyramid of Pain (Übung 09).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| MITRE ATT&CK / Navigator | Mapping/Visualisierung |
| Lab-Daten (Honeypot/SIEM) | beobachtetes Verhalten |

## Lab-Setup

- ATT&CK-Matrix + Verhaltensdaten aus den offensiven/Blue-Team-Themen (z. B. Honeypot-Session).

## Aufgabe (selbst lösen)

1. Definiere Tactic/Technique/Procedure an einem eigenen Beispiel (z. B. Phishing-Login-Kette).
2. Nimm eine beobachtete Kette (z. B. aus `honeypots` 03: Login → recon → `wget` → exec → persistence) und mappe jede Stufe auf **ATT&CK-Taktik + Technik-ID**.
3. Lege dieselbe Kette auf die **Cyber Kill Chain** und beschreibe die Unterschiede ATT&CK vs. Kill Chain.
4. Analysiere **ein** Szenario mit dem **Diamond Model** (Adversary/Capability/Infrastructure/Victim).

**Ziel:** beobachtetes Angriffsverhalten sauber auf ATT&CK mappen und zu Kill Chain/Diamond Model in Beziehung setzen.

## SY0-701 Prüfungsbezug

- **2.0/4.0** MITRE ATT&CK, TTPs, Cyber Kill Chain, Diamond Model, threat-informed defense.
- Begriffe: *tactic/technique/procedure*, *ATT&CK (T-IDs)/Navigator*, *Cyber Kill Chain*, *Diamond Model*.
