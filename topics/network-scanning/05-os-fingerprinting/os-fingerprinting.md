# Übung 05 – OS Fingerprinting

**Schwierigkeit: 5/10 · Dauer: ca. 40 Min.**

## Lernziele

- Das Betriebssystem eines Ziels per aktivem Fingerprinting bestimmen
- Verstehen, worauf Fingerprinting beruht (TCP/IP-Stack-Eigenheiten, TTL)
- Grenzen und Unsicherheit von OS-Detection einschätzen
- Passives Fingerprinting als leisere Alternative kennen

## Theorie

Jeder TCP/IP-Stack verhält sich minimal anders: initiale **TTL**, TCP-Window-Size, Optionen-Reihenfolge, Reaktion auf ungewöhnliche Flag-Kombinationen. nmap sendet eine Serie speziell geformter Pakete und vergleicht die Antworten mit der `nmap-os-db` → Schätzung des OS (`-O`).

Faustregel **TTL** (initiale Werte):
- **64** → Linux/Unix/macOS
- **128** → Windows
- **255** → viele Netzwerkgeräte/Router (Cisco u. a.)

Ein einzelnes Ping mit TTL-Blick ist schon ein grober OS-Hinweis. Aktives Fingerprinting (`-O`) ist genauer, aber **laut** und kann bei wenig offenen Ports oder durch Firewalls hindurch ungenau werden (nmap meldet dann „aggressive guesses").

**Passives Fingerprinting** (z. B. `p0f`) liest nur mit, ohne eigene Pakete – leiser, aber auf vorhandenen Traffic angewiesen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Aktives OS-Fingerprinting | `-O`, `--osscan-guess`, `--osscan-limit`, `-A` |
| `ping` | TTL ablesen | `ping -c1 <ip>` → Feld `ttl=` |
| `p0f` | Passives Fingerprinting | `p0f -i eth0` |

## Lab-Setup

- Kali (root) + Metasploitable (Linux) und – wenn vorhanden – ein zweites Ziel mit anderem OS (z. B. OPNsense/BSD oder eine Windows-VM), um den Unterschied zu sehen.

## Aufgabe (selbst lösen)

1. Lies per `ping` die TTL deiner Ziele ab und leite daraus eine **erste OS-Vermutung** ab.
2. Bestätige (oder widerlege) die Vermutung mit `nmap -O`. Notiere, mit welcher **Confidence** nmap das OS meldet.
3. Scanne ein Ziel, bei dem `-O` **unsicher** ist (z. B. hinter Firewall / wenige offene Ports), und nutze `--osscan-guess`. Wie verändert sich die Ausgabe?
4. Starte `p0f` und erzeuge Traffic zu Kali – welches OS erkennt das **passive** Tool, ohne selbst zu senden?
5. Erkläre: Warum ist OS-Detection grundsätzlich **unzuverlässiger** als Port-Detection?

**Ziel:** OS-Bestimmung über drei Wege (TTL, aktiv, passiv) und ein realistisches Gefühl für die Unsicherheit.

## SY0-701 Prüfungsbezug

- **Active vs. passive reconnaissance:** `-O`/TTL = aktiv (sendet Pakete, erzeugt Spuren); `p0f` = passiv (nur mithören, kaum nachweisbar). Beliebte Prüfungsunterscheidung.
- **Fingerprinting** als Recon-Technik; **TTL-Werte** als praktisches Indiz.
- **Attack surface / asset inventory:** OS-Kenntnis priorisiert Angriffe/Patches (Windows- vs. Linux-CVEs).
- Begriffe: *OS fingerprinting*, *TTL*, *TCP/IP stack*, *passive vs. active recon*, *false positive*.
