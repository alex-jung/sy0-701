# Lösung – Übung 04: NAT

Intern: Webserver `192.168.30.50:80`. „WAN"-Tester = Kali.

## 1. Port Forward

**Firewall → NAT → Port Forward → Add:**
```
Interface: WAN | Protocol: TCP
Destination: WAN address | Dest port: 8080
Redirect target IP: 192.168.30.50 | Redirect target port: 80
Filter rule association: "Add associated filter rule"  <- erzeugt die Firewall-Regel automatisch
```

## 2. Von außen testen

```bash
curl -s http://<WAN-IP>:8080/     # erreicht intern :80
nmap -Pn -p 22,80,443,8080 <WAN-IP>   # nur 8080 open, Rest filtered
```

## 3. Quelle einschränken

Im Port Forward (oder der assoziierten Regel) **Source** von `any` auf eine konkrete IP/Alias setzen:
```
Source: 203.0.113.10   (nur dieser Host darf)
```
Test von anderer Quelle → `filtered`; von erlaubter → `open`. (Least privilege für Exposure.)

## 4. Outbound NAT

**Firewall → NAT → Outbound:**
- **Automatic:** OPNsense NATtet alle internen Netze hinter der WAN-IP (Masquerading) – Standard.
- **Hybrid:** Automatic bleibt, du kannst **eigene** Outbound-Regeln ergänzen (z. B. bestimmtes Segment über eine andere Adresse / kein NAT für geroutetes Netz).
Umschalten → speichern → eigene Regel testen (z. B. Static-Port für VoIP).

## 5. DNAT/SNAT/1:1 & „NAT ≠ Security"

- **DNAT (Port Forward):** von außen rein zu internem Dienst.
- **SNAT/PAT (Outbound):** viele interne IPs hinter einer öffentlichen (Masquerading).
- **1:1:** feste öffentliche ↔ interne IP.
NAT **übersetzt** nur Adressen; ob eine übersetzte Verbindung **erlaubt** ist, entscheiden die **Firewall-Regeln**. Ein Host hinter NAT ist nicht automatisch „sicher" – die Regel + Segmentierung schützen, nicht das NAT.

## Häufige Fehler / Troubleshooting

- **Forward funktioniert nicht:** keine assoziierte Regel erzeugt / falsche „Destination" (WAN address vs. feste IP); States zurücksetzen.
- **Alles statt nur 8080 offen:** zu breite Firewall-Regel neben dem Forward.
- **NAT Reflection:** Zugriff über WAN-IP aus dem LAN braucht „NAT Reflection" aktiviert.
- **Outbound kaputt → kein Internet:** Manual-Modus ohne vollständige Regeln; zurück auf Automatic/Hybrid.
