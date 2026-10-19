# Übung 06 – Split- vs. Full-Tunnel, Routing & DNS

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- Split- vs. Full-Tunnel konfigurieren und die Trade-offs verstehen
- Routing über das VPN steuern (AllowedIPs/pushed routes)
- DNS korrekt durchs VPN leiten und DNS-Leaks vermeiden

## Theorie

- **Full Tunnel:** **aller** Client-Verkehr geht durchs VPN (Default-Route übers Tunnel). Vorteil: zentrale Filterung/Monitoring, kein Verkehr am VPN vorbei. Nachteil: Last/Latenz, auch privater Verkehr läuft durchs Firmennetz.
- **Split Tunnel:** **nur** bestimmte Ziele (z. B. interne Netze) gehen durchs VPN, Rest direkt ins Internet. Vorteil: effizient. Nachteil: Client ist „gleichzeitig" im internen und offenen Netz → potenzielles Pivot/Policy-Risiko.

Gesteuert wird das bei WireGuard über **`AllowedIPs`** am Client (`0.0.0.0/0` = Full, konkrete Subnetze = Split), bei OpenVPN über `redirect-gateway`/`push route`, bei IPsec über Traffic Selectors.

**DNS** ist ein häufiger Leak: Steht der DNS-Server nicht auf einen internen Resolver, fragt der Client weiter öffentliche DNS → **DNS-Leak** (interne Namen scheitern und/oder Anfragen sichtbar). Lösung: internen DNS pushen (`DNS =` / `push dhcp-option DNS`). Bezug: Zero-Trust/Egress-Kontrolle.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| WireGuard/OpenVPN-Config | AllowedIPs/routes/DNS |
| `ip route`/`resolvectl` | Routing/DNS prüfen |
| dnsleaktest/`dig` | DNS-Leak testen |

## Lab-Setup

- Funktionierender Tunnel (Übung 03/04), ein interner DNS/Resolver im Lab, ein interner Hostname.

## Aufgabe (selbst lösen)

1. Konfiguriere den Client einmal als **Full Tunnel** und einmal als **Split Tunnel**; prüfe jeweils mit `ip route`/Traceroute, welcher Verkehr durchs VPN geht.
2. Leite **DNS** auf den internen Resolver und löse einen **internen** Hostnamen auf.
3. Weise einen **DNS-Leak** nach (ohne gepushten DNS) und behebe ihn.
4. Beschreibe für dein Lab, wann Split und wann Full sinnvoll ist (Sicherheit vs. Effizienz) und welches Risiko Split birgt.

**Ziel:** Full- und Split-Tunnel bewusst konfiguriert, internes DNS funktioniert, DNS-Leak nachgewiesen + behoben.

## SY0-701 Prüfungsbezug

- **3.0** split vs. full tunnel, VPN routing, DNS leakage, egress control, zero-trust-Bezug.
- Begriffe: *split/full tunnel*, *default route*, *AllowedIPs/redirect-gateway*, *DNS leak*, *internal resolver*.
