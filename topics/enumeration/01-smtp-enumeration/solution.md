# Lösung – Übung 01: SMTP User Enumeration

`<ZIEL>` = Metasploitable-IP.

## 1. Manueller Dialog + Banner

```bash
nc <ZIEL> 25
```
```
220 metasploitable.localdomain ESMTP Postfix (Ubuntu)
```
→ Postfix auf Ubuntu. Mit `HELO x` den Dialog eröffnen.

## 2. VRFY

```
VRFY root
250 2.1.5 root
VRFY msfadmin
250 2.1.5 msfadmin
VRFY user
250 2.1.5 user
VRFY gibtsnicht
550 5.1.1 <gibtsnicht>: Recipient address rejected: User unknown...
```
→ **`250`** = Benutzer existiert, **`550`** = unbekannt. So lassen sich Konten unterscheiden.

## 3. EXPN

```
EXPN root
```
Antwortet mit Expansion oder `502/550`, je nach Konfiguration. Auf vielen Metasploitable-Setups ist `VRFY` ergiebiger.

Dialog beenden: `QUIT`.

## 4. Automatisiert mit smtp-user-enum

```bash
smtp-user-enum -M VRFY -U /usr/share/seclists/Usernames/top-usernames-shortlist.txt -t <ZIEL>
# RCPT-Methode (wenn VRFY aus ist):
smtp-user-enum -M RCPT -U users.txt -t <ZIEL>
```
Ausgabe listet je getesteten Namen „exists" / „does not exist"; am Ende eine Trefferzahl. Gültige in eine Datei filtern:
```bash
smtp-user-enum -M VRFY -U users.txt -t <ZIEL> | grep 'exists' | awk '{print $2}' > valid_users.txt
```

NSE-Alternative:
```bash
nmap -p25 --script smtp-enum-users,smtp-commands <ZIEL>
```

## 5. Verteidigung

- **`VRFY`/`EXPN` deaktivieren** (Postfix: `disable_vrfy_command = yes`).
- **Aber:** `RCPT TO` kann weiterhin Existenz verraten → zusätzlich **gleiches Verhalten für existierende/nicht existierende Empfänger** (z. B. alle annehmen und später verwerfen) oder Rate-Limiting/Greylisting.
- Übergreifend: **MFA** und Lockout gegen die Folgeangriffe, Monitoring auffälliger SMTP-Muster.

## Häufige Fehler / Troubleshooting

- **`smtp-user-enum` nicht gefunden:** `sudo apt install smtp-user-enum`.
- **Verbindung hängt:** erst `HELO x` senden; manche Server brauchen das vor Kommandos.
- **Alles `250` oder alles `550`:** Server behandelt Empfänger einheitlich (gut gehärtet) → `RCPT`-Methode testen oder Ziel prüfen.
- **Timeout:** Port 25 evtl. durch Firewall/Provider geblockt – im Lab direkt gegen Metasploitable.
