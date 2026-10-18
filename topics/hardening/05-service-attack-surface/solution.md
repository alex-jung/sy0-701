# Lösung – Übung 05: Dienste & Attack-Surface

> Snapshot vorher.

## 1. Inventur

```bash
ss -tulpn                     # lauschende TCP/UDP-Dienste + Prozess
systemctl list-units --type=service --state=running
dpkg -l | grep -Ei 'telnet|ftp|rpcbind|avahi|samba'
```
Jeden Eintrag „nötig/unnötig" markieren (z. B. Telnet/FTP/rpcbind/avahi = meist unnötig).

## 2. Baseline-Scan (Kali)

```bash
nmap -sS -sV -p- <VM> -oN before.txt
```

## 3. Unnötige Dienste entfernen

```bash
sudo systemctl disable --now telnet.socket inetd 2>/dev/null
sudo systemctl disable --now vsftpd rpcbind avahi-daemon
sudo apt purge -y telnetd vsftpd rpcbind avahi-daemon   # ganz entfernen
```

## 4. Dienst auf localhost binden

Beispiel DB/Dienst: in der Config `bind-address = 127.0.0.1` (statt `0.0.0.0`) bzw. `ListenAddress`. Dienst neu starten → von außen nicht mehr erreichbar, lokal ja.

## 5. Re-Scan + Diff

```bash
nmap -sS -sV -p- <VM> -oN after.txt
diff <(grep open before.txt) <(grep open after.txt)
```
Weniger offene Ports = reduzierte Angriffsfläche (belegt). Die entfernten Dienste (Telnet/FTP/rpcbind) sind als Exploit-/Enumeration-Ziele weg.

## Härtung/Betrieb

Minimal-Install als Baseline (Übung 01), per CM durchsetzen, regelmäßig `ss`/Scan gegen Drift; verbleibende Dienste patchen + least privilege.

## Häufige Fehler / Troubleshooting

- **Wichtigen Dienst abgeschaltet:** erst „nötig/unnötig" sauber bewerten; Snapshot zurück.
- **Dienst „weg", Port noch offen:** zweiter Dienst/Socket-Activation (`*.socket`) → auch deaktivieren.
- **bind localhost bricht legitimen Remote-Zugriff:** nur wo wirklich nur lokal nötig; sonst internes Interface + Firewall.
- **purge entfernt Abhängigkeiten:** vor `purge` prüfen.
