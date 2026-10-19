# T-Pot

**Kategorie:** Honeypot-Plattform (All-in-one, Docker + ELK)

Bündelt Dutzende Honeypots (Cowrie, Dionaea, Honeytrap, Heralding, ElasticPot, Conpot, Mailoney …) in Docker-Containern und visualisiert alles in **ELK/Kibana** inkl. **Attack Map**. Von der Deutschen Telekom Security.

```bash
git clone https://github.com/telekom-security/tpotce && cd tpotce
./install.sh        # Edition + Web-User wählen, dann reboot
sudo dps.sh         # Container-Status
```

## Wichtige Ports

| Port | Zweck |
|------|-------|
| 64295 | **Admin-SSH** (echter Zugang) |
| 64297 | Web-UI / Kibana (https) |
| sonstige | werden auf Honeypot-Container umgeleitet |

## Hinweise

Ressourcenhungrig: **≥ 8 GB RAM, ~128 GB Disk**, dedizierte frische VM (übernimmt Netz/Docker). SSH-22 ist Cowrie – Admin über 64295. Im Lab trotzdem isoliertes VLAN + Egress-Filter. Primär Research/Trends.

## Verwendet in

honeypots 05 (Plattform), 07, 10.
