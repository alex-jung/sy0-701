# Übung 09 – Platzierung, Deception-Strategie & Risiken

**Schwierigkeit: 9/10 · Dauer: ca. 90 Min.**

## Lernziele

- Honeypots strategisch platzieren (außen/DMZ/intern) und begründen
- Eine Deception-Strategie über das ganze Netz entwerfen
- Betriebs-, Rechts- und Sicherheitsrisiken bewerten und einhegen

## Theorie

**Wo** ein Honeypot steht, bestimmt, **was** er erkennt:

- **Extern/vor der Firewall:** sieht Internet-Grundrauschen/Massen-Scans → Research, wenig relevant für interne Bedrohung.
- **DMZ:** realistisch neben echten exponierten Diensten; erkennt Angreifer, die den Perimeter testen.
- **Intern:** der **wertvollste** Ort für Production-Deception – ein interner Honeypot/Honeytoken wird praktisch nur von jemandem berührt, der schon drin ist (**Lateral Movement/Insider**) → Breach-Signal.

**Deception-Strategie** = Mischung: wenige Honeypots an Schlüsselstellen + viele billige **Honeytokens** in echten Systemen, alle an ein zentrales **Alerting** (SIEM) gekoppelt, eingebettet in den **IR-Prozess**.

**Risiken & Einhegung:**
- **Pivot:** kompromittierter (v. a. high-interaction) Honeypot als Sprungbrett → **Egress-Filter**, Segmentierung, Monitoring, kein Trust zu echten Systemen.
- **Recht/Entrapment/Datenschutz:** eigene Köder ok; keine fremden Angriffe/„Hack back"; ggf. personenbezogene Daten.
- **Betrieb:** Wartung, Updates, Fehlalarme durch eigene Scanner/Monitoring; „vergessene" Honeypots werden selbst zum Risiko.
- **Fingerprinting:** Angreifer erkennen bekannte Honeypots (z. B. Default-Cowrie-Banner) und meiden sie → anpassen/tarnen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense | Segmentierung, Egress-Filter, VLANs |
| (Konzept) | Platzierungs-/Risiko-Analyse, Netzdiagramm |

## Lab-Setup

- Dein vorhandenes Lab-Netz (OPNsense-VLANs). Kein neues Tool nötig; Fokus auf Design + Firewall-Regeln.

## Aufgabe (selbst lösen)

1. Zeichne dein Lab-Netz und markiere **mind. drei** sinnvolle Deception-Standorte (extern/DMZ/intern) mit Begründung, **was** dort jeweils erkannt wird.
2. Entwirf eine **Deception-Strategie**: welche Honeypots + welche Honeytokens wo, und wie alle an SIEM/IR angebunden sind.
3. Definiere konkrete **OPNsense-Regeln**, die einen kompromittierten Honeypot einhegen (Egress-Deny, keine Erreichbarkeit interner Netze).
4. Erstelle eine **Risiko-Tabelle** (Pivot, Recht, Betrieb, Fingerprinting) mit je einer Gegenmaßnahme.

**Ziel:** ein begründetes Platzierungs-/Deception-Design + konkrete Einhegungs-Regeln + Risikobewertung.

## SY0-701 Prüfungsbezug

- **3.0** Netz-Segmentierung, DMZ, Zonen, Isolation; Platzierung von Sensoren.
- **1.0/4.0** Deception-Strategie; Monitoring; Risiken exponierter Systeme.
- **5.0** Rechts-/Governance-Aspekte (kein Hack-back, Datenschutz).
- Begriffe: *DMZ*, *segmentation*, *egress filtering*, *lateral movement*, *entrapment vs. enticement*.
