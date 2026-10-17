# Übung 07 – Floating Rules, Schedules & Traffic Shaping

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- Floating Rules verstehen (interface-übergreifend, Richtung, Quick)
- Zeitbasierte Regeln (Schedules) einsetzen
- Grundlagen Traffic Shaping / QoS kennen
- Diese Mechanismen gezielt für Sicherheit/Policy nutzen

## Theorie

- **Floating Rules:** gelten **über mehrere Interfaces** und können die **Richtung** (in/out) frei wählen (normale Regeln nur „in" je Interface). Mit **Quick** greifen sie sofort (first match), ohne Quick wirken sie als „letzte Instanz". Ideal für globale Policies (z. B. **egress filtering** auf allen Interfaces, Anti-Spoofing, globales Blocken bestimmter Ports).
- **Schedules:** Regeln nur zu bestimmten **Zeiten** aktiv (z. B. Gastnetz nur werktags 8–18 Uhr, Admin-Zugang nur im Wartungsfenster).
- **Traffic Shaping / QoS:** priorisiert/begrenzt Bandbreite (Pipes/Queues/Rules) – sicherheitsrelevant z. B. zur **DoS-Dämpfung** oder um ein Segment zu drosseln.

**Egress filtering** (ausgehend begrenzen) ist ein unterschätzter Schutz: er bremst Reverse-Shells/C2/Exfiltration (Bezug zu `post-exploitation-pivoting`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Firewall → Rules → Floating | interface-übergreifende Regeln |
| Firewall → Settings → Schedules | Zeitpläne |
| Firewall → Shaper | Pipes/Queues/Rules |

## Lab-Setup

- OPNsense mit mehreren Segmenten. Test-Hosts. Backup.

## Aufgabe (selbst lösen)

1. Erstelle eine **Floating Rule** für **Egress-Filtering**: blocke ausgehend (Richtung out auf WAN) alles außer erlaubten Ports (z. B. 53/80/443) – und beobachte den Effekt auf eine Reverse-Shell/einen Testport.
2. Lege ein **Schedule** an (z. B. Gastnetz nur zu bestimmten Zeiten) und binde es an eine Regel.
3. Richte eine einfache **Traffic-Shaping**-Regel ein (Bandbreite eines Segments begrenzen) und miss den Effekt.
4. Erkläre den Unterschied Floating Rule (mit/ohne **Quick**) vs. normale Interface-Regel.
5. Begründe, warum **Egress-Filtering** die Angriffsabwehr verbessert.

**Ziel:** eine globale Egress-Policy per Floating Rule, eine zeitgesteuerte Regel und eine Shaping-Regel – jeweils in Wirkung getestet.

## SY0-701 Prüfungsbezug

- **Egress filtering**, globale Policies, **QoS/traffic shaping** (auch DoS-Dämpfung).
- **Zeitbasierte Zugriffskontrolle** (Schedules); least privilege in der Zeitdimension.
- Begriffe: *egress filtering*, *QoS/traffic shaping*, *time-based ACL*, *rule precedence (quick)*.
