# iptables

**Kategorie:** Host-Firewall (Linux) · **Benötigt root:** ja

Der klassische Linux-Paketfilter (Netfilter). In den Übungen genutzt, um **auf einem Ziel gezielt einen Port zu blockieren** und so den Unterschied zwischen `closed` (RST) und `filtered` (stiller DROP) zu erzeugen.

> Auf neueren Systemen oft `nftables`/`ufw` im Einsatz; `iptables` bleibt als Kompatibilitäts-Frontend meist verfügbar.

```bash
sudo iptables [-t tabelle] <aktion> <chain> <match> -j <ziel>
```

## Wichtigste Bausteine

| Element | Werte / Bedeutung |
|---------|-------------------|
| Chains | `INPUT` (eingehend), `OUTPUT` (ausgehend), `FORWARD` (geroutet) |
| Aktion | `-A` anhängen · `-I` vorn einfügen · `-D` löschen · `-L` auflisten |
| Match | `-p tcp/udp`, `--dport <port>`, `--sport <port>`, `-s <ip>`, `-d <ip>` |
| Ziel `-j` | `DROP` (still verwerfen → `filtered`), `REJECT` (RST/ICMP), `ACCEPT` |

## Beispiele

```bash
# Port 8888 still droppen -> nmap meldet "filtered"
sudo iptables -A INPUT -p tcp --dport 8888 -j DROP

# Regeln ansehen (mit Nummern)
sudo iptables -L -n --line-numbers

# Regel wieder entfernen
sudo iptables -D INPUT -p tcp --dport 8888 -j DROP

# REJECT statt DROP -> aktiv ablehnen (ICMP admin-prohibited)
sudo iptables -A INPUT -p tcp --dport 8888 -j REJECT
```

## DROP vs. REJECT (prüfungsrelevant)

- **DROP:** keine Antwort → nmap `filtered`, Reason `no-response`. Leiser, verzögert den Scanner.
- **REJECT:** sendet RST/ICMP → Port wirkt `closed`/`filtered` mit Reason `admin-prohibited`. Schneller, aber verrät die Firewall.

## Verwendet in

Übung 03 (`filtered`-Port erzeugen); konzeptioneller Hintergrund zu Übung 08/09.
