# Übung 07 – Linux Capabilities & Docker/LXD-Gruppe

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- Linux Capabilities verstehen und missbrauchbare finden
- `cap_setuid`/`cap_dac_read_search` u. a. zu root nutzen
- Die Gruppen `docker`/`lxd` als „root-Äquivalent" erkennen und ausnutzen
- Container-/Capability-Härtung ableiten

## Theorie

**Capabilities** zerlegen root-Rechte in Einzelberechtigungen (statt alles-oder-nichts). Eine Binary kann z. B. nur `cap_net_raw` haben. Problematisch sind Binaries mit mächtigen Caps:

| Capability | Missbrauch |
|------------|-----------|
| `cap_setuid` | UID auf 0 setzen → root (z. B. python/perl mit dieser Cap) |
| `cap_dac_read_search` | beliebige Dateien lesen (`/etc/shadow`) |
| `cap_dac_override` | beliebige Dateien schreiben |

**Gruppen als root-Äquivalent:**
- **`docker`:** Mitglieder können Container starten → ein Container mit gemountetem Host-`/` = root auf dem Host.
- **`lxd`/`lxc`:** analog über ein privilegiertes Container-Image.
- (`disk`, `shadow`, `adm` geben ebenfalls viel Lesezugriff.)

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `getcap -r / ` | Capabilities finden |
| `docker`/`lxc` | Container-Ausbruch |
| GTFOBins (Capabilities) | Missbrauchs-Rezepte |

## Lab-Setup

- Linux-Ziel mit (a) einer Binary mit `cap_setuid` **oder** (b) dem aktuellen User in Gruppe `docker`/`lxd` (ggf. selbst setzen). Docker/LXD installiert. Snapshot.

## Aufgabe (selbst lösen)

1. Finde mit `getcap -r /` Binaries mit **Capabilities** und markiere die gefährlichen.
2. Nutze eine `cap_setuid`-Binary (z. B. `python`/`perl`), um root zu werden.
3. Bist du in der Gruppe **`docker`**? Starte einen Container, der das Host-`/` mountet, und lies/schreibe als root auf dem Host.
4. (Falls `lxd`) skizziere/führe den LXD-Ausbruch über ein privilegiertes Image durch.
5. Erkläre, warum `docker`-Gruppenmitgliedschaft praktisch root ist – und wie man es absichert.

**Ziel:** über eine Capability **oder** die docker/lxd-Gruppe root/Host-Zugriff erlangt.

## SY0-701 Prüfungsbezug

- **Linux Capabilities** als feingranulare Rechte – falsch gesetzt = PrivEsc.
- **Container-Sicherheit / escape**; `docker`-Gruppe = Host-root (Prinzip least privilege).
- **Hardening:** Caps minimieren, Container isolieren, niemand unnötig in docker/lxd.
- Begriffe: *Linux capabilities*, *container escape*, *privilege escalation*, *least privilege*, *docker/lxd group*.
