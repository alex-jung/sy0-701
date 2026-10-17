# Lösung – Übung 02: TCP Connect Scan

## 1. Scans

```bash
# Top-100 Ports, schnell
nmap -sT -F <ZIEL>

# Explizit Top-N
nmap -sT --top-ports 100 <ZIEL>

# Alle 65535 TCP-Ports
nmap -sT -p- <ZIEL>
```

`-sT` braucht **kein** root. (Als root ist der Default `-sS`, siehe Übung 03 – darum hier `-sT` explizit setzen.)

## 2. Beispiel-Ausgabe (Metasploitable 2)

```
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
23/tcp   open  telnet
25/tcp   open  smtp
53/tcp   open  domain
80/tcp   open  http
111/tcp  open  rpcbind
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
512/tcp  open  exec
513/tcp  open  login
514/tcp  open  shell
1099/tcp open  rmiregistry
1524/tcp open  ingreslock
2049/tcp open  nfs
2121/tcp open  ccproxy-ftp
3306/tcp open  mysql
5432/tcp open  postgresql
5900/tcp open  vnc
6000/tcp open  X11
6667/tcp open  irc
8009/tcp open  ajp13
8180/tcp open  unknown
```

## 3. Antworten

- **FTP (21): offen**, **SSH (22): offen**, **HTTP (80): offen** – bei Metasploitable 2 alle drei.
- Weitere klassische: Telnet 23, SMTP 25, DNS 53, SMB 139/445, MySQL 3306, PostgreSQL 5432, VNC 5900.

## 4. Ergebnis speichern

```bash
nmap -sT -p- -oN metasploitable_tcp.txt <ZIEL>
# -oN = normal (menschenlesbar). Alternativen: -oG (grepbar), -oX (XML), -oA <basis> (alle)
```

## 5. Handshake im Mitschnitt beobachten

Terminal 1:
```bash
sudo tcpdump -ni eth0 host <ZIEL> and tcp
```
Terminal 2:
```bash
nmap -sT -p 22,1  <ZIEL>     # 22 offen, 1 i.d.R. geschlossen
```

**Offener Port (22):**
```
Kali > ZIEL  Flags [S]        (SYN)
ZIEL > Kali  Flags [S.]       (SYN, ACK)
Kali > ZIEL  Flags [.]        (ACK)        → Handshake komplett
Kali > ZIEL  Flags [R.]       (RST)        → nmap schließt wieder
```

**Geschlossener Port (1):**
```
Kali > ZIEL  Flags [S]        (SYN)
ZIEL > Kali  Flags [R.]       (RST, ACK)   → Port zu
```

In Wireshark Filter: `tcp.flags.syn==1 && tcp.flags.ack==1` zeigt die SYN/ACK (offene Ports).

## Häufige Fehler / Troubleshooting

- **Scan dauert ewig bei `-p-`:** normal über langsame Links; später mit `-T4`/`--min-rate` beschleunigen (siehe Timing in Übung 08).
- **Alle Ports „filtered" statt open/closed:** dann steht eine Firewall dazwischen → gehört zu Übung 08/09, nicht zum lokalen Metasploitable-Scan.
- **Nur wenige Ports gezeigt:** Default ist Top-1000. Für vollständige Sicht `-p-`.
