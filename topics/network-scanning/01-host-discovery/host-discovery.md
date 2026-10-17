# Übung 01 – Host Discovery / Ping Sweep

**Schwierigkeit: 1/10 · Dauer: ca. 30 Min.**

## Lernziele

- Verstehen, wie man herausfindet, welche Hosts in einem Netz **aktiv** sind
- Unterschied zwischen Layer-2-Discovery (ARP) und Layer-3-Discovery (ICMP) kennen
- Einen Ping Sweep mit `nmap`, `netdiscover` und `arp-scan` durchführen

## Theorie

Bevor man Ports scannt, will man wissen, **welche IP-Adressen überhaupt belegt** sind – das ist *Host Discovery* (auch „Ping Sweep"). Zwei Ebenen:

- **Layer 2 (ARP):** Im **gleichen** Subnetz fragt der Angreifer per ARP „Wer hat IP X?". Jeder aktive Host muss mit seiner MAC antworten – das lässt sich **nicht per Firewall unterdrücken**, solange man im selben Broadcast-Segment ist. Deshalb ist ARP-Discovery im lokalen Netz am zuverlässigsten.
- **Layer 3 (ICMP / „Ping"):** `ping` schickt ein ICMP Echo Request. Viele Hosts/Firewalls **blocken ICMP**, dann wirkt ein Host fälschlich als „down". nmap nutzt darum zusätzlich TCP-/UDP-Probes.

`nmap -sn` = „Ping Scan / No Port Scan": nur Host Discovery, **keine** Ports. Im lokalen Subnetz nutzt nmap als root automatisch ARP.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Universeller Scanner | `-sn` (nur Discovery), `-n` (kein DNS), `-PR` (ARP-Ping), `-PE` (ICMP-Echo) |
| `netdiscover` | Aktives/passives ARP-Discovery | `-r <range>` (Range), `-p` (passiv, nur mithören) |
| `arp-scan` | Schnelles ARP-Scanning | `-l`/`--localnet` (lokales Netz), `-I <iface>` |

## Lab-Setup

- Kali und mindestens ein Ziel (Metasploitable) im **selben** Lab-Subnetz.
- Ermittle dein eigenes Netz: `ip a` bzw. `ip route`. Beispiel-Annahme unten: `192.168.56.0/24` – **ersetze das durch dein tatsächliches Lab-Netz.**

## Aufgabe (selbst lösen)

1. Finde heraus, in welchem Subnetz deine Kali-VM liegt (Interface + CIDR).
2. Führe einen Ping Sweep über das gesamte Subnetz durch und erstelle eine **Liste aller aktiven Hosts** (IP + MAC).
3. Beantworte: Welche IP ist deine Metasploitable-VM? Wie viele Hosts sind insgesamt aktiv?
4. Mache denselben Discovery **einmal mit `nmap -sn` und einmal mit `arp-scan`** – bekommst du dieselben Hosts? Überlege, *warum* ARP hier zuverlässiger ist als ICMP.

**Ziel:** eine saubere Host-Liste deines Lab-Netzes, erstellt mit mindestens zwei verschiedenen Tools.

> Hinweis: Discovery-Tools im lokalen Netz brauchen meist root (`sudo`), weil sie Raw-Frames senden.

## SY0-701 Prüfungsbezug

- **Domäne 4.0 (Security Operations):** Host/Asset Discovery ist Teil von *Vulnerability Management* und *Asset Inventory*.
- **Reconnaissance (2.0):** Host Discovery ist der erste aktive Schritt des Angreifers nach der passiven OSINT-Phase. Begriff **active vs. passive reconnaissance** – ARP/Ping-Sweeps sind *active*.
- Merke: **ICMP wird oft geblockt** → ein „nicht pingbarer" Host ist nicht zwingend offline (typische Prüfungsfalle).
- Begriffe für die Prüfung: *ARP*, *ICMP Echo Request/Reply*, *broadcast domain*, *ping sweep*, *active reconnaissance*.
