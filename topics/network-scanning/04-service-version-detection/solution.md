# Lösung – Übung 04: Service- & Version-Detection

## 1. Version-Scan

```bash
sudo nmap -sV <ZIEL>
# gründlicher:
sudo nmap -sV --version-all <ZIEL>
```

Beispiel-Ausgabe (Metasploitable 2, Auszug):
```
PORT    STATE SERVICE     VERSION
21/tcp  open  ftp         vsftpd 2.3.4
22/tcp  open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
23/tcp  open  telnet      Linux telnetd
25/tcp  open  smtp        Postfix smtpd
80/tcp  open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X
445/tcp open  netbios-ssn Samba smbd 3.0.20-Debian
3306/tcp open mysql       MySQL 5.0.51a-3ubuntu5
5432/tcp open postgresql  PostgreSQL DB 8.3.0 - 8.3.7
```

## 2. FTP-Banner manuell mit netcat

```bash
nc <ZIEL> 21
```
Antwort:
```
220 (vsFTPd 2.3.4)
```
→ deckt sich mit nmaps `-sV` (`vsftpd 2.3.4`). Manuelles Banner-Grabbing bestätigt das Ergebnis. (HTTP-Banner: `printf 'HEAD / HTTP/1.0\r\n\r\n' | nc <ZIEL> 80` → `Server: Apache/2.2.8`.)

## 3. Auffällig veraltete Software

- **vsftpd 2.3.4** (2011) – berüchtigt.
- **Apache 2.2.8**, **OpenSSH 4.7p1**, **Samba 3.0.20**, **MySQL 5.0.51a** – alle uralt und voller bekannter CVEs.

## 4. CVE-Recherche (Beispiel vsftpd 2.3.4)

- **vsftpd 2.3.4 Backdoor** – das offizielle Release-Tarball wurde 2011 kompromittiert: Gibt man einen Usernamen mit `:)` ein, öffnet der Dienst eine **Root-Shell auf TCP 6200** (Command Execution / Backdoor).
- Referenz: OSVDB-73573 / häufig als „vsftpd 2.3.4 backdoor" geführt; Metasploit-Modul `exploit/unix/ftp/vsftpd_234_backdoor`.
- Weitere Beispiele im selben Ziel: **Samba „usermap_script"** (CVE-2007-2447, Command Injection), **UnrealIRCd 3.2.8.1 Backdoor** (CVE-2010-2075) auf Port 6667.

> Hinweis: Hier nur **identifiziert**, nicht ausgenutzt. Das aktive Ausnutzen gehört ins Thema *Exploitation*.

## Häufige Fehler / Troubleshooting

- **Version „unknown"/unvollständig:** `--version-intensity 9` bzw. `--version-all` erzwingt mehr Probes.
- **`-sV` sehr langsam:** auf relevante Ports eingrenzen (`-p 21,22,80,...`).
- **`-A` genutzt und wundert sich über OS-Infos/Scripts:** `-A` = `-sV -O -sC --traceroute` zusammen – praktisch, aber lauter und langsamer.
- **Banner täuscht:** Admins können Banner fälschen/verbergen → Version-Detection kann daneben liegen (false positive). Kritische Findings gegenprüfen.
