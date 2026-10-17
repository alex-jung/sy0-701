# Lösung – Übung 08: Firewall-/IDS-Evasion

## 1. Normaler Scan + IDS-Alerts

```bash
sudo nmap -sS -T4 -p- <ZIEL>
```
Auf OPNsense: **Services → Intrusion Detection → Alerts**. Ein schneller Full-Port-Scan löst typischerweise ET-Regeln aus (z. B. „ET SCAN Nmap" / „ET SCAN Potential SYN Scan"). Notiere Zeit, Signatur-ID und Quell-IP (= deine Kali).

## 2. Leiser Scan

```bash
sudo nmap -sS -T1 --scan-delay 2s -p 21,22,80,445 <ZIEL>
# oder extrem:
sudo nmap -sS -T0 -p 22 <ZIEL>
```
- `-T0/-T1` + `--scan-delay` spreizen die Pakete zeitlich so weit, dass schwellenbasierte Scan-Detection („X Ports in Y Sekunden") seltener/nicht triggert.
- Preis: Dauer explodiert (T0 kann Stunden/Tage für viele Ports bedeuten) → nur wenige Ports.
- Ergebnis variiert je nach IDS-Tuning: oft weniger/keine „Scan"-Alerts, einzelne Signatur-Alerts bleiben aber möglich.

## 3. Fragmentation

```bash
sudo nmap -sS -f -p 80 <ZIEL>           # 8-Byte-Fragmente
sudo nmap -sS --mtu 16 -p 80 <ZIEL>     # Fragmentgröße Vielfaches von 8
```
Wireshark-Filter:
```
ip.flags.mf == 1 || ip.frag_offset > 0
```
→ Du siehst mehrere IP-Fragmente statt eines Pakets. Modernes Suricata **reassembliert** und erkennt den Scan trotzdem – genau das ist die Lektion.

## 4. Decoys

```bash
sudo nmap -sS -D 10.0.0.5,10.0.0.6,ME,10.0.0.7 -p 80 <ZIEL>
# oder zufällige Decoys:
sudo nmap -sS -D RND:5 -p 80 <ZIEL>
```
`ME` = Position deiner echten IP in der Liste. Im `tcpdump` am Ziel erscheinen SYNs von mehreren Quell-IPs „gleichzeitig" → der Verteidiger kann die echte nicht eindeutig isolieren. (Die Decoy-IPs sollten erreichbar/plausibel sein, sonst fallen sie auf.)

## 5. Source-Port 53

```bash
sudo nmap -sS -g 53 -p <PORT> <ZIEL>
```
Wenn eine schlecht gebaute Firewall „alles von Quellport 53 (DNS) ist ok" erlaubt, kann ein vorher `filtered` Port jetzt als `open`/`closed` antworten. Bei sauberem OPNsense-Regelwerk ändert sich nichts – auch das ist ein valides Ergebnis.

## 6. Verteidiger-Teil – was wird trotzdem erkannt?

- **Fragmentation:** von reassemblierenden IDS (Suricata default) **erkannt**. Bringt gegen moderne Sensoren wenig.
- **Decoys:** erzeugen *mehr* Alerts, nicht weniger – der Scan selbst wird klar gesehen, nur die Attribution leidet. Korrelation (z. B. welche IP vollendet Handshakes) entlarvt den echten Host oft.
- **Source-Port-Trick:** nur gegen **fehlkonfigurierte** Firewalls wirksam; stateful OPNsense ignoriert ihn.
- **Timing (`-T0/T1`):** wirksamste reale Evasion gegen schwellenbasierte Erkennung, aber gegen **anomaly-based** Systeme und bei langer Beobachtung immer noch auffällig.

**Fazit:** Gegen ein getuntes IPS ist „unerkannt scannen" weitgehend Mythos; man verschiebt nur Wahrscheinlichkeiten. Das ist exakt die Prüfungsaussage zu IDS/IPS-Wirksamkeit.

## Häufige Fehler / Troubleshooting

- **Keine Alerts im IDS:** Suricata läuft evtl. nur im IDS- (Detect-)Modus auf falschem Interface, oder Regeln (ET-Open) nicht geladen/aktiviert. Interface + Ruleset prüfen, Dienst neu starten.
- **`-f` zeigt keine Fragmente:** manche NICs/Offloading verschleiern das lokal; am Ziel oder auf OPNsense capturen.
- **Decoys bringen Scan zum Scheitern:** zu viele/ungültige Decoys → verwerfen; `RND:5` ist meist ok.
- **`-sI` (Idle Scan) scheitert:** braucht einen echten „idle" Host mit vorhersagbarer IP-ID – im kleinen Lab schwer; optional.
