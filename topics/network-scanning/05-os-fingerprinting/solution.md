# Lösung – Übung 05: OS Fingerprinting

## 1. TTL ablesen

```bash
ping -c1 <ZIEL>
```
```
64 bytes from <ZIEL>: icmp_seq=1 ttl=64 time=0.5 ms
```
- `ttl=64` → **Linux/Unix** (Metasploitable passt).
- `ttl=128` → **Windows**.
- `ttl=255` → Netzwerkgerät/BSD-nah (OPNsense basiert auf FreeBSD, oft 64 – also nicht blind auf 255 verlassen).

> Achtung: Die abgelesene TTL ist bereits um die Zahl der Hops reduziert. 61 statt 64 heißt „64 minus 3 Router".

## 2. Aktives Fingerprinting

```bash
sudo nmap -O <ZIEL>
```
```
Running: Linux 2.6.X
OS CPE: cpe:/o:linux:linux_kernel:2.6
OS details: Linux 2.6.9 - 2.6.33
```
nmap nennt bei guter Datenlage ein konkretes OS; bei Metasploitable 2 den alten 2.6-Kernel. Confidence/„OS matches"-Prozent beachten.

## 3. Unsicheres Ziel + Guess

```bash
sudo nmap -O --osscan-guess <ZIEL_HINTER_FW>
```
Ohne gute Datenbasis:
```
Warning: OSScan results may be unreliable because we could not find
at least 1 open and 1 closed port
Aggressive OS guesses: OPNsense (FreeBSD-based) (92%), FreeBSD 11.X (88%), ...
```
`--osscan-guess` zwingt nmap, auch bei schwacher Datenlage **Vermutungen mit Prozent** auszugeben, statt gar nichts. `--osscan-limit` macht das Gegenteil (nur raten, wenn Bedingungen gut sind → weniger Rauschen).

## 4. Passiv mit p0f

```bash
sudo p0f -i eth0
```
Dann vom Ziel aus eine Verbindung zu Kali aufbauen (z. B. `curl http://<KALI>` oder einfach ein `ping`/Scan). p0f gibt u. a. aus:
```
.-[ <ZIEL>/.. -> <KALI>/.. (syn) ]-
| os  = Linux 2.6.x
| dist = 0
`----
```
p0f sendet **nichts** – es schließt nur aus mitgehörten Paketen auf das OS. Ideal, wenn man unentdeckt bleiben will.

## 5. Warum OS-Detection unzuverlässiger ist

- Sie beruht auf **subtilen Stack-Eigenheiten**, die durch Firewalls, NAT, Load Balancer, VPNs oder bewusstes „TCP/IP-Hardening" verändert werden.
- Wenige offene/geschlossene Ports → zu wenig Datenpunkte → nur Vermutung.
- Port-Detection prüft dagegen eine **direkte, eindeutige** Reaktion (SYN/ACK = offen). OS-Detection ist immer eine **Wahrscheinlichkeitsaussage**.

## Häufige Fehler / Troubleshooting

- **`-O` braucht root** und mindestens je einen offenen + geschlossenen Port für gute Ergebnisse.
- **TTL durch Hops verfälscht:** nur grober Indikator.
- **p0f zeigt nichts:** es braucht realen Traffic auf dem Interface – erst eine Verbindung erzeugen.
- **OPNsense als „Windows" erkannt o. ä.:** typischer false positive durch Firewall-Filterung – mit `--osscan-guess` die Alternativen ansehen.
