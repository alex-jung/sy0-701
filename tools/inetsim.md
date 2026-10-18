# INetSim

**Kategorie:** Internet-Simulation (dynamische Malware-Analyse)

Simuliert gängige Internet-Dienste (DNS, HTTP/HTTPS, SMTP, FTP, …) in einer **isolierten** Umgebung. Malware „telefoniert nach Hause" und bekommt **Fake-Antworten** → man beobachtet C2-/Netzverhalten, **ohne** echten Internetkontakt. Pendant: **FakeNet-NG**.

```bash
sudo inetsim                       # startet die simulierten Dienste
# Konfig: /etc/inetsim/inetsim.conf
```

## Wichtige Konfig

| Option | Bedeutung |
|--------|-----------|
| `service_bind_address 0.0.0.0` | auf allen Interfaces lauschen |
| `dns_default_ip <REMnux-IP>` | alle DNS-Namen → diese IP (Fake) |
| `start_service ...` | welche Dienste (dns/http/https/smtp/…) |
| Logs: `/var/log/inetsim/` | Anfragen der Malware |

## Setup (Sandbox)

1. REMnux: INetSim starten.
2. Analyse-VM: **Gateway + DNS = REMnux-IP**, isoliertes Netz (kein echtes Internet).
3. Capture (Wireshark/tcpdump) + INetSim-Logs → C2-Domains/URLs/User-Agent.

## Hinweise

Nur im **isolierten** Lab (Übung 01); echtes Internet muss aus sein (sonst echter C2/Schaden). INetSim antwortet generisch – echte C2-IPs stehen oft im Binary (floss). Alternative: FakeNet-NG (Windows-nah).

## Verwendet in

malware-analysis 01 (Lab), 06 (Netzwerk & C2), 10.
