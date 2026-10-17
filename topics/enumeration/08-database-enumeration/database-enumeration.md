# Übung 08 – Datenbank-Enumeration (MySQL / PostgreSQL)

**Schwierigkeit: 8/10 · Dauer: ca. 60 Min.**

## Lernziele

- Exponierte Datenbankdienste (MySQL 3306, PostgreSQL 5432) enumerieren
- Default-/schwache Credentials und anonyme Zugänge erkennen
- Version, Datenbanken, Tabellen, User und Privilegien auslesen
- Das Risiko einer direkt erreichbaren DB verstehen

## Theorie

Datenbanken sollten **nie** direkt aus dem Netz erreichbar sein – in verwundbaren Umgebungen sind sie es aber oft, teils mit leeren/Default-Credentials. Ist man drin, enumeriert man:

- **Version** → bekannte CVEs.
- **Datenbanken & Tabellen** → wo liegen die Daten (User-Tabellen, Passwort-Hashes).
- **DB-User & Privilegien** → wer darf was; `FILE`-Privileg erlaubt teils Lesen/Schreiben im Dateisystem.
- **Hashes** → Grundlage fürs spätere Cracken (anderes Thema).

MySQL auf Metasploitable läuft oft mit **root ohne Passwort**; PostgreSQL mit `postgres:postgres`.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `mysql` | MySQL-Client | `-h <ziel> -u root -p` (oder ohne PW) |
| `psql` | PostgreSQL-Client | `-h <ziel> -U postgres -d postgres` |
| `nmap` NSE | DB-Enum/Default-Creds | `--script mysql-info,mysql-empty-password,mysql-enum,mysql-databases` / `pgsql-*` |
| `hydra` (opt.) | Credential-Test | `-l <user> -P <liste> <ziel> mysql` |

## Lab-Setup

- Metasploitable (MySQL 3306, PostgreSQL 5432). Kali mit `default-mysql-client`/`postgresql-client`.

## Aufgabe (selbst lösen)

1. Prüfe mit NSE, ob **MySQL** ein **leeres root-Passwort** hat, und bestimme die Version.
2. Verbinde dich mit dem MySQL-Client und liste **alle Datenbanken**, dann die **Tabellen** einer interessanten DB.
3. Lies die **DB-User** und ihre **Privilegien** aus (`mysql.user`). Gibt es Konten mit allen Rechten/`FILE`-Privileg?
4. Wiederhole die Enumeration für **PostgreSQL** (Version, Datenbanken, Rollen).
5. Erkläre, welche Einzel-Findings zusammen zu einem ernsten Risiko werden und wie man eine DB absichert.

**Ziel:** Version, Datenbanken, Tabellen, User und Privilegien beider DBs ausgelesen – mit Fokus auf schwache Auth.

## SY0-701 Prüfungsbezug

- **Default / weak credentials** und **exposed services** als häufige Schwachstellen.
- **Database security / data exposure:** direkte Erreichbarkeit, fehlende Netzsegmentierung, Klartext-/schwache Hashes.
- **Privileg-Konzepte:** least privilege für DB-Accounts; gefährliche Privilegien (`FILE`, `SUPER`).
- Begriffe: *default credentials*, *exposed database*, *least privilege*, *data at rest*, *information disclosure*, *segmentation*.
