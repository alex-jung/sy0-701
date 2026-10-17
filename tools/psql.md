# psql (Client)

**Kategorie:** Enumeration (Datenbank) · **Teil von:** `postgresql-client`

Kommandozeilen-Client für PostgreSQL. Verbindet sich mit (oft per Default `postgres:postgres` gesicherten) Servern und enumeriert Datenbanken, Rollen und Tabellen.

```bash
psql -h <ziel> -U <user> -d <datenbank>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-h <ziel>` | Remote-Host |
| `-U <user>` | Benutzer (z. B. `postgres`) |
| `-d <db>` | Datenbank (Default = Username) |
| `-p <port>` | Port (Default 5432) |
| `-c '<sql>'` | SQL nicht-interaktiv ausführen |
| `PGPASSWORD=...` | Passwort als Env-Var |

## Nützliche Meta-Kommandos / SQL

```sql
SELECT version();
\l            -- Datenbanken
\du           -- Rollen + Attribute (Superuser?)
\c <db>       -- DB wechseln
\dt           -- Tabellen
\dn           -- Schemas
```

## Beispiele

```bash
PGPASSWORD=postgres psql -h <ZIEL> -U postgres -d postgres
psql -h <ZIEL> -U postgres -c "\l"
```

## Hinweis

Installation: `sudo apt install postgresql-client`.

## Verwendet in

enumeration 08 (Datenbank-Enumeration), 10.
