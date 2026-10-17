# mysql (Client)

**Kategorie:** Enumeration (Datenbank) · **Teil von:** `default-mysql-client`/`mariadb-client`

Kommandozeilen-Client für MySQL/MariaDB. Zum Verbinden mit (oft schwach gesicherten) DB-Servern und zum Enumerieren von Datenbanken, Tabellen, Usern und Privilegien.

```bash
mysql -h <ziel> -u <user> [-p]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-h <ziel>` | Remote-Host |
| `-u <user>` | Benutzer (z. B. `root`) |
| `-p` | Passwort abfragen (weglassen = leeres PW) |
| `-P <port>` | Port (Default 3306) |
| `-e '<sql>'` | SQL nicht-interaktiv ausführen |

## Nützliche SQL-Abfragen

```sql
SHOW DATABASES;
USE <db>; SHOW TABLES;
SELECT user,host,password FROM mysql.user;     -- Accounts + Hashes
SHOW GRANTS FOR 'root'@'%';                      -- Privilegien
SELECT user,File_priv,Super_priv FROM mysql.user;
SELECT @@version, @@datadir;
```

## Beispiele

```bash
mysql -h <ZIEL> -u root                         # leeres Passwort
mysql -h <ZIEL> -u root -e "SHOW DATABASES;"
```

## Hinweis

Installation: `sudo apt install default-mysql-client`.

## Verwendet in

enumeration 08 (Datenbank-Enumeration), 10.
