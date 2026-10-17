# Übung 08 – Firewall-/IDS-Evasion

**Schwierigkeit: 8/10 · Dauer: ca. 70 Min.**

## Lernziele

- Techniken verstehen, mit denen Scans an Firewalls/IDS vorbei oder unauffälliger laufen
- Timing-Templates, Fragmentation, Decoys, Source-Port-Spoofing und MAC-Spoofing anwenden
- **Beide Seiten** sehen: wie man evadiert UND wie der Verteidiger es trotzdem erkennt

## Theorie

Firewalls filtern nach Regeln; IDS/IPS (z. B. Suricata/Snort auf OPNsense) erkennen Scans an Mustern (viele Ports/Sekunde, SYN-Floods, bekannte Signaturen). Evasion-Techniken:

- **Timing (`-T0`…`-T5`):** langsamer = unauffälliger. `-T0`/`-T1` („paranoid"/„sneaky") unterlaufen schwellenbasierte Erkennung, dauern aber ewig. `--scan-delay` erzwingt Pausen.
- **Fragmentation (`-f`, `--mtu`):** zerlegt Probes in kleine IP-Fragmente, um signaturbasierte Inspektion zu erschweren (moderne IDS reassemblieren aber).
- **Decoys (`-D`):** mischt gefälschte Quell-IPs unter deine echte → der Verteidiger sieht viele „Scanner" und weiß nicht, welcher echt ist.
- **Source-Port-Spoofing (`--source-port`/`-g 53`):** nutzt einen vertrauenswürdigen Quellport (z. B. 53/DNS, 80), um schlecht konfigurierte Firewall-Regeln zu umgehen.
- **MAC-Spoofing (`--spoof-mac`):** verschleiert die Hardware-Identität.
- **Idle/Zombie Scan (`-sI`):** nutzt einen dritten „Zombie"-Host, sodass das Ziel **nie deine IP** sieht (fortgeschritten).

> Realitäts-Check: Gegen ein gut konfiguriertes, reassemblierendes IDS bringen `-f` & Co. wenig. Die Übung zeigt daher auch die **Erkennung** – das ist der prüfungsrelevante Teil.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Evasion | `-T0..-T5`, `--scan-delay`, `-f`/`--mtu`, `-D`, `-g/--source-port`, `--spoof-mac`, `--data-length`, `-sI` |
| OPNsense IDS (Suricata) | Erkennung | Services → Intrusion Detection; Logs/Alerts |
| `tcpdump`/Wireshark | Fragmente/Decoys sichtbar machen | — |

## Lab-Setup

- Kali + Ziel; **OPNsense mit aktiviertem Suricata (IDS-Modus)** zwischen Kali und Ziel oder auf dem Perimeter. Alternativ auf dem Ziel eine Firewall + Logging, um Alerts zu sehen.
- Aktiviere auf OPNsense die IDS-Regeln (z. B. ET-Open) auf dem passenden Interface.

## Aufgabe (selbst lösen)

1. Führe einen normalen `-T4`-SYN-Scan durch und prüfe, **ob/welche Alerts** das OPNsense-IDS erzeugt (Services → Intrusion Detection → Alerts).
2. Wiederhole den Scan **leise**: sehr langsames Timing + `--scan-delay`. Verändert sich die Alert-Lage?
3. Nutze **Fragmentation** (`-f`) und belege mit Wireshark, dass die Probes fragmentiert ankommen.
4. Starte einen Scan mit **Decoys** (`-D`) und zeige im Mitschnitt, dass neben deiner IP mehrere Fake-Quell-IPs auftauchen.
5. Teste **Source-Port 53** (`-g 53`) gegen einen Port, der normal `filtered` ist – ändert sich etwas, wenn eine Regel DNS-Quellports bevorzugt?
6. **Verteidiger-Teil:** Formuliere, welche dieser Techniken dein IDS trotzdem erkannt hat und warum.

**Ziel:** mehrere Evasion-Techniken praktisch angewandt und die Grenzen gegen ein modernes IDS selbst gemessen.

## SY0-701 Prüfungsbezug

- **IDS vs. IPS**, **signature-based vs. anomaly-based detection**, **false positive/negative** – zentrale 4.0-Themen. Evasion zielt genau auf diese Erkennungsarten.
- **Fragmentation / evasion** als Angriffstechnik; Gegenmaßnahme = IDS mit **Reassembly**, Rate-Limiting, Anomalie-Erkennung.
- **Decoys / IP-Spoofing**: Verschleierung der Attribution; Bezug zu *source IP spoofing* und *logging/forensics*.
- Begriffe: *evasion*, *IDS/IPS*, *signature vs. behavior/anomaly*, *fragmentation*, *spoofing*, *decoy*, *tuning/false positive*.
