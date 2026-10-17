# Übung 02 – Stateful Firewall-Regeln

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Das stateful Firewall-Modell verstehen (Connection Tracking)
- Regel-Bestandteile beherrschen (Action, Interface, Direction, Source/Dest, Port, Protocol)
- Regel-Reihenfolge (first-match) und default-deny anwenden
- pass / block / reject unterscheiden

## Theorie

OPNsense (pf) ist eine **stateful** Firewall: erlaubt sie eine ausgehende Verbindung, wird deren **State** gespeichert → die Antwortpakete dürfen automatisch zurück (keine eigene „Rückregel" nötig). Das unterscheidet sie von einer stateless ACL.

Regel-Bestandteile: **Action** (pass/block/reject), **Interface** (wo die Regel greift), **Direction** (meist „in"), **Protocol** (TCP/UDP/ICMP…), **Source/Destination** (+ Ports).

Wichtig:
- **Reihenfolge = first match wins** (von oben nach unten je Interface). Die erste passende Regel entscheidet.
- **Regeln greifen auf dem Interface, auf dem der Traffic *eintritt*** (eingehende Richtung).
- **block** = still verwerfen (`filtered` für den Angreifer), **reject** = aktiv ablehnen (RST/ICMP → `closed`), **pass** = erlauben.
- Nach den eigenen Regeln greift der **implizite default-deny**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense Firewall → Rules | Regeln erstellen/ordnen |
| `nmap` (Kali) | Regelwirkung testen (`open`/`closed`/`filtered`) |
| Firewall → Log Files → Live View | sehen, welche Regel greift |

## Lab-Setup

- OPNsense + ein Test-Host hinter LAN/DMZ + Kali zum Testen. Konfig-Backup.

## Aufgabe (selbst lösen)

1. Erstelle eine Regel, die von einem Segment aus nur **HTTP/HTTPS** zu einem Zielhost erlaubt und alles andere blockt. Teste mit `nmap` (was ist open/filtered?).
2. Baue bewusst einen **Reihenfolge-Fehler** (eine breite allow-Regel über einer block-Regel) und beobachte, dass first-match gewinnt. Korrigiere die Reihenfolge.
3. Vergleiche **block vs. reject** an einem Port: Was meldet `nmap` jeweils (`filtered` vs. `closed`)?
4. Verifiziere das **stateful**-Verhalten: eine erlaubte ausgehende Verbindung bekommt die Antwort ohne Extra-Regel.
5. Erkläre, warum Regeln auf dem **eingehenden** Interface definiert werden.

**Ziel:** ein korrekt geordnetes, default-deny-basiertes Regelwerk für ein Segment, dessen Wirkung du mit nmap belegst.

## SY0-701 Prüfungsbezug

- **Stateful vs. stateless firewall**, **ACL / rule order**, **implicit deny**.
- **block (drop) vs. reject** und die Außenwirkung (`filtered`/`closed`).
- Begriffe: *stateful inspection*, *connection tracking*, *rule order / first match*, *implicit deny*, *drop vs reject*.
