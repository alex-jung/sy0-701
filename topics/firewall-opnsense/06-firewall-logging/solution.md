# Lösung – Übung 06: Firewall-Logging

## 1. Logging aktivieren + Live View

- In einer Block- und einer Pass-Regel das Häkchen **„Log"** setzen.
- **Firewall → Log Files → Live View** zeigt Treffer in Echtzeit (Zeit, Interface, Quelle→Ziel:Port, Aktion, Regel).

## 2. Scan erzeugen & erkennen

```bash
# Kali:
sudo nmap -sS -p 1-1000 <OPNsense-oder-Segment-IP>
```
In der Live View: **viele geblockte Pakete von EINER Quelle auf VIELE Ports in kurzer Zeit** = typisches Scan-Muster (SYN ohne Folgeverbindung). Genau das Signal, das ein IDS (Thema `ids-ips`) als „Portscan" alertet.

## 3. Filtern

Live View bietet Filter nach **Interface, Action (pass/block), Source, Port**. Beispiel: `action=block, source=<KALI>` → nur die geblockten Scan-Pakete; die Spalte „Label/Rule" zeigt die greifende Regel (meist „Default deny").

## 4. Remote-Syslog

**System → Settings → Logging / Logging Targets → Add:** Ziel-IP des Syslog/SIEM, Transport (UDP/TCP/TLS 514), Anwendungen auswählen (Filter/`firewall`). Auf dem Empfänger (z. B. `rsyslog`/SIEM) Eingang prüfen:
```bash
# Test-Empfänger:
sudo tcpdump -ni eth0 port 514
```

## 5. Warum zentral

Lokale Logs sind begrenzt (Platz/Rotation), gehen bei Reboot/Kompromittierung verloren und lassen sich nicht über Systeme hinweg korrelieren. Zentrales **Syslog/SIEM** bietet Aufbewahrung, **Korrelation** (Firewall + IDS + Hosts), **Alerting** und Manipulationsschutz → Grundlage für Detection/IR (Thema `logging-siem`).

## Häufige Fehler / Troubleshooting

- **Nichts im Log:** „Log" pro Regel nicht aktiv; Default-Block loggt zwar, aber Pass-Treffer nur bei aktiviertem Logging.
- **Zu viel Rauschen:** nicht jede Regel loggen; gezielt kritische + Default-Deny.
- **Syslog kommt nicht an:** Port 514/Protokoll/Firewall-Regel zum Empfänger; TLS-Zertifikat bei verschlüsseltem Transport.
- **Zeitstempel falsch:** NTP auf OPNsense + Empfänger synchron (für Korrelation essenziell).
