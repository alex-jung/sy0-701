# Übung 09 – Web Content & Directory Enumeration

**Schwierigkeit: 9/10 · Dauer: ca. 70 Min.**

## Lernziele

- Versteckte Verzeichnisse, Dateien und Endpunkte einer Webanwendung finden
- Directory-/File-Brute-Force mit `gobuster`, `ffuf` und `feroxbuster` durchführen
- Virtual Hosts (vhosts) und Parameter fuzzen
- Wortlisten, Extensions, Statuscodes und Filterung sinnvoll einsetzen

## Theorie

Webanwendungen haben viele **nicht verlinkte** Ressourcen: Admin-Panels, Backups (`.bak`, `.zip`), Config-Dateien, API-Endpunkte, alte Seiten. Content-Enumeration findet sie per **Brute-Force gegen Wortlisten** und wertet die **HTTP-Statuscodes** aus (`200` ok, `301/302` Redirect, `403` verboten-aber-existiert, `401` auth nötig).

Varianten:
- **Directory/File:** Pfade durchprobieren, oft mit Extensions (`-x php,txt,bak`).
- **Recursion:** gefundene Verzeichnisse weiter durchsuchen.
- **VHost-Fuzzing:** verschiedene `Host:`-Header → unterschiedliche Sites auf derselben IP.
- **Parameter/Value-Fuzzing:** mit `ffuf` den `FUZZ`-Platzhalter beliebig setzen.

Die **Wortliste** entscheidet über Erfolg (SecLists: `directory-list-2.3-medium.txt`, `raft-*`).

> ⚠️ Brute-Force erzeugt viele Requests (laut). Nur gegen eigene/freigegebene Web-Ziele (DVWA/Lab/`scanme`).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `gobuster` | schneller Dir/DNS/VHost-Brute | `dir -u <url> -w <liste> -x <ext>`, `vhost`, `-s/-b` (Status) |
| `ffuf` | flexibler Fuzzer (`FUZZ`) | `-u <url>/FUZZ -w <liste>`, `-mc`, `-fc`, `-fs`, `-H` |
| `feroxbuster` | rekursiver Content-Scanner | `-u <url> -w <liste> -x php -d <tiefe>` |
| `nmap` NSE | Bonus | `--script http-enum` |

## Lab-Setup

- DVWA / Metasploitable-Webserver (`http://<ZIEL>/`), `scanme.nmap.org`. SecLists installiert.

## Aufgabe (selbst lösen)

1. Führe eine **Directory-Enumeration** gegen das Web-Ziel durch und finde versteckte Verzeichnisse (z. B. `/config`, `/phpmyadmin`, `/dvwa`).
2. Erweitere den Scan um **Datei-Extensions** (`php`, `txt`, `bak`, `zip`) und finde mindestens eine interessante Datei.
3. Nutze **Recursion**, um in einem gefundenen Verzeichnis weiterzusuchen.
4. Fuzze mit `ffuf` und **filtere** sinnvoll (z. B. nach Statuscode/Response-Size), um Rauschen zu entfernen.
5. **Bonus:** teste VHost-Fuzzing. Erkläre, wann verschiedene `Host:`-Header unterschiedliche Inhalte liefern.
6. Interpretiere die Statuscodes: Was bedeutet ein `403` vs. `200` vs. `301` für dich?

**Ziel:** eine Liste versteckter Pfade/Dateien des Web-Ziels, inkl. mindestens eines sicherheitsrelevanten Funds, mit sauber gefilterten Ergebnissen.

## SY0-701 Prüfungsbezug

- **Web application enumeration / forced browsing** als Technik; **security misconfiguration** (offene Backups/Panels) als Schwachstelle.
- **HTTP-Statuscodes** und ihre Bedeutung; **information disclosure**.
- **Mitigations:** keine sensiblen Dateien im Webroot, Auth/ACL, `403`/`404` einheitlich, WAF, Rate-Limiting.
- Begriffe: *forced browsing / directory brute-forcing*, *security misconfiguration*, *virtual host*, *information disclosure*, *fuzzing*.
