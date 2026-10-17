# Lösung – Übung 04: TCP/UDP-Analyse

## 1. 3-Way-Handshake

Filter `tcp.flags.syn==1`. Die drei Pakete:
```
1) Client -> Server  [SYN]       Seq=0
2) Server -> Client  [SYN, ACK]  Seq=0 Ack=1
3) Client -> Server  [ACK]       Seq=1 Ack=1   -> Verbindung steht
```

## 2. Abbau

```
... [FIN, ACK] -> [ACK] -> [FIN, ACK] -> [ACK]   (sauberer Abbau)
# oder:
... [RST, ACK]                                   (abrupt)
```
Filter `tcp.flags.fin==1 || tcp.flags.reset==1`.

## 3. Expert Info: Retransmit/RST

**Analyze → Expert Information** oder Filter:
```
tcp.analysis.retransmission        # Paketverlust/Latenz
tcp.analysis.duplicate_ack
tcp.flags.reset==1                 # abrupter Abbruch
```
- **Retransmission/Dup-ACK:** Pakete gingen verloren → Netzproblem/Überlast.
- **RST:** Gegenstelle bricht ab (geschlossener Port / Anwendung reset).

## 4. UDP-DNS vs. TCP

```
dns
```
Eine DNS-Query und ihre Response – **zwei** UDP-Pakete, **kein** Handshake, kein Seq/Ack, kein Verbindungszustand. Gegensatz zu TCP (Handshake + Zustandsverwaltung). (DHCP/NTP analog.)

## 5. Portscan an Flags

Ein **SYN-Scan** erzeugt viele `[SYN]` von einer Quelle an viele Ports; offene Ports antworten `[SYN,ACK]`, geschlossene `[RST,ACK]` – aber **kein** vollständiger Handshake (der Scanner sendet kein finales ACK). Muster: viele SYN, kaum etablierte Verbindungen → Scan (Details Übung 07).

## Häufige Fehler / Troubleshooting

- **„Handshake unvollständig":** Capture startete mitten in der Verbindung → früher capturen.
- **Viele Retransmits im Lab:** oft VM/Bridge-Overhead, nicht zwingend Angriff.
- **Seq/Ack verwirrend:** Wireshark zeigt per Default **relative** Seq-Nummern (ab 0) – umschaltbar.
- **UDP „fehlt Antwort":** normal (verbindungslos) bzw. Firewall droppt.
