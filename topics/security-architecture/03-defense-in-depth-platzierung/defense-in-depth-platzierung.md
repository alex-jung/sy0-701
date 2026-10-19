# Übung 03 – Defense in Depth & Control-Platzierung

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Security-Appliances/Controls richtig im Netz platzieren
- Inline vs. passive, fail-open vs. fail-closed verstehen
- Sensor-/Tap-/SPAN-Platzierung für Sichtbarkeit wählen

## Theorie

Architektur entscheidet, **wo** eine Control sitzt – das bestimmt ihre Wirkung. Platzierungs-Konzepte (SY0-701):

- **Inline (in-band):** Gerät liegt **im** Datenpfad und kann **blockieren** (Firewall, IPS, WAF, Proxy). Risiko: wird es langsam/fällt aus → Einfluss auf Verkehr → **fail-open** (durchlassen, Verfügbarkeit) vs. **fail-closed/fail-secure** (blockieren, Sicherheit).
- **Passive (out-of-band):** Gerät **beobachtet** nur (IDS/NSM via **TAP** oder **SPAN/Mirror-Port**) → keine Blockade, aber keine Latenz/kein Ausfallrisiko für den Verkehr.
- **Platzierung:** Perimeter (Firewall/IPS), intern (Segment-Firewalls, NDR), Host (EDR/HIDS), Applikation (WAF), Endpunkt.
- **Weitere:** **forward proxy** (Clients→Internet), **reverse proxy** (Internet→Server), **load balancer** (Verfügbarkeit/Verteilung), **jump host**.

Design-Trade-off: inline = Kontrolle, aber Single Point/Latenz; passiv = sicher fürs Netz, aber nur Erkennung. Platzierung muss **Sichtbarkeit** (sieht die Control den relevanten Verkehr?) und **Wirkung** (blocken vs. nur alarmieren) balancieren.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense/Suricata | inline/passiv im Lab |
| Diagramm | Platzierung |

## Lab-Setup

- OPNsense + Suricata (IDS/IPS), SPAN/Mirror-Möglichkeit (Proxmox-Bridge).

## Aufgabe (selbst lösen)

1. Zeichne dein Lab-Netz und platziere: Firewall, IDS/IPS, WAF, Proxy, EDR – je mit Begründung (wo und warum).
2. Entscheide für IDS/IPS: **inline** oder **passiv**? Begründe mit fail-open/fail-closed und Verfügbarkeit.
3. Erkläre, wie du **Sichtbarkeit** für ein NSM/IDS herstellst (TAP vs. SPAN/Mirror) und welche Grenzen das hat (verschlüsselter Verkehr).
4. Ordne forward/reverse proxy und load balancer je einem Einsatzzweck in deinem Design zu.

**Ziel:** Controls bewusst platzieren (inline/passiv, Sichtbarkeit) und die Trade-offs begründen.

## SY0-701 Prüfungsbezug

- **3.0** device placement, inline vs. tap/monitor (passive), fail-open/fail-closed, proxy (forward/reverse), load balancer, sensor placement.
- Begriffe: *inline/in-band vs. passive/out-of-band*, *TAP/SPAN*, *fail-open/fail-closed*, *forward/reverse proxy*, *load balancer*, *NSM*.
