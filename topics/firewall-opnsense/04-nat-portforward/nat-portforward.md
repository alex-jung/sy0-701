# Übung 04 – NAT: Port Forwarding & Outbound NAT

**Schwierigkeit: 4/10 · Dauer: ca. 55 Min.**

## Lernziele

- NAT-Arten unterscheiden: Port Forward (DNAT), Outbound (SNAT/PAT), 1:1
- Einen Dienst sicher per Port Forward aus dem WAN erreichbar machen
- Outbound NAT verstehen (Masquerading) und anpassen
- Die Beziehung NAT ↔ Firewall-Regeln begreifen

## Theorie

**NAT** (Network Address Translation) übersetzt Adressen/Ports zwischen Netzen:

- **Port Forward (DNAT):** ein Port der WAN-IP wird auf einen internen Host:Port weitergeleitet (z. B. `WAN:443 → 192.168.30.50:443`). So werden interne Dienste von außen erreichbar. In OPNsense erzeugt ein Port Forward optional **automatisch die zugehörige Firewall-Regel**.
- **Outbound NAT (SNAT/PAT):** interne private IPs werden hinter der öffentlichen WAN-IP „versteckt" (Masquerading) – Standard für Internet-Zugang. Modi: **Automatic**, **Hybrid**, **Manual**.
- **1:1 NAT:** eine öffentliche IP ↔ eine interne IP vollständig.

Wichtig fürs Verständnis: **NAT ≠ Firewall**. Erst NAT übersetzt, dann entscheiden die **Regeln** über Erlauben/Blocken. Port Forwards sind eine **Angriffsfläche** → nur das Nötigste, Quelle einschränken, dahinter Segmentierung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Firewall → NAT → Port Forward | DNAT-Regeln |
| Firewall → NAT → Outbound | SNAT-Modus |
| `nmap`/`curl` (Kali als „WAN") | Erreichbarkeit testen |

## Lab-Setup

- OPNsense WAN + internes Segment mit einem Dienst (z. B. Webserver `192.168.30.50:80`). Kali in der „WAN"-Rolle (anderes Segment). Backup.

## Aufgabe (selbst lösen)

1. Richte einen **Port Forward** ein, der `WAN:8080` auf einen internen Webserver `:80` mappt. Lass OPNsense die passende Firewall-Regel erzeugen.
2. Teste von „außen" (Kali) mit `curl`/`nmap`, dass der Dienst erreichbar ist – und **nur** dieser Port.
3. Schränke den Port Forward auf eine **bestimmte Quell-IP** ein (nicht any) und verifiziere.
4. Sieh dir **Outbound NAT** an (Automatic): wie werden interne IPs nach außen übersetzt? Schalte auf **Hybrid** und ergänze eine eigene Regel.
5. Erkläre den Unterschied DNAT/SNAT/1:1 und warum NAT allein keine Sicherheit ist.

**Ziel:** ein funktionierender, auf eine Quelle eingeschränkter Port Forward + Verständnis von Outbound NAT und der NAT-/Regel-Trennung.

## SY0-701 Prüfungsbezug

- **NAT/PAT**, **Port Forwarding (DNAT)** als Exposure; **secure network design**.
- **Attack surface:** jeder Forward = offener Weg nach innen → minimieren, Quelle beschränken, DMZ.
- Begriffe: *NAT/PAT*, *port forwarding (DNAT)*, *SNAT/masquerading*, *attack surface*, *DMZ*.
