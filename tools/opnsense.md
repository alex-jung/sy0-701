# OPNsense

**Kategorie:** Firewall / Router / Perimeter (Blue Team)

FreeBSD-basierte Open-Source-Firewall (pf-Backend) mit Web-UI. Zentrale Lab-Firewall: Regeln, NAT, Segmentierung (VLANs), VPN, Logging, HA (CARP) und Security-Plugins (Suricata-IDS/IPS, DNS-Filtering).

## Wichtige UI-Bereiche

| Bereich | Zweck |
|---------|-------|
| Interfaces → Assignments / VLAN | Interfaces/VLANs zuweisen |
| Firewall → Rules | Regelwerk je Interface (+ Floating) |
| Firewall → NAT | Port Forward / Outbound / 1:1 |
| Firewall → Aliases | Host/Port/URL-Table/GeoIP-Gruppen |
| Firewall → Log Files → Live View | Echtzeit-Logs |
| Firewall → Diagnostics → States/Aliases | aktive Verbindungen / Alias-Inhalte |
| Services → Unbound DNS | Resolver + DNS-Filtering/DNSBL |
| Services → Intrusion Detection | Suricata (IDS/IPS) |
| System → High Availability | CARP/pfsync/XMLRPC |
| System → Configuration → Backups | Backup/Restore/History |

## Grundprinzipien

- **default-deny** auf WAN; Regeln greifen auf dem **eingehenden** Interface; **first match** je Interface.
- **stateful**: Antwortverkehr erlaubter Verbindungen automatisch.
- **block** (still/`filtered`) vs. **reject** (`closed`).
- **Anti-Lockout-Rule** schützt Management-Zugang.

## Hinweis

Vor Änderungen **Backup**; bei Aussperrung über die Proxmox-Konsole. Nur eigenes Lab.

## Verwendet in

firewall-opnsense 01–10; ids-ips 02–08 (Suricata-Plugin); Bezug network-scanning 09, post-exploitation-pivoting.
