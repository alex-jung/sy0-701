# Übung 03 – Angriffe auf Cowrie beobachten & Logs auswerten

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Cowrie-Logs (JSON) strukturiert mit `jq` auswerten
- Angreifer-Muster erkennen: Brute-Force, ausgeführte Befehle, Downloads
- Erste Kennzahlen bilden (Top-Quell-IPs, Top-Credentials, Top-Befehle)

## Theorie

Cowrie schreibt strukturierte **JSON-Events** (`cowrie.json`): u. a. `cowrie.login.success/failed`, `cowrie.command.input`, `cowrie.session.file_download`, `cowrie.client.version`. Diese Felder (`src_ip`, `username`, `password`, `input`, `url`, `shasum`) lassen sich mit **`jq`** filtern und aggregieren.

Typische Beobachtungen bei echten (oder simulierten) Angriffen: massenhafte **Credential-Stuffing/Brute-Force**-Versuche aus Botnetzen, nach „erfolgreichem" Login oft **immer dieselben Befehle** (Recon `uname -a`/`cat /proc/cpuinfo`, Download eines Bots per `wget`/`curl`, Ausführen, Persistenz). Das sind klassische **TTPs**, die sich auf MITRE ATT&CK mappen lassen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `jq` | JSON-Logs filtern/aggregieren |
| `cowrie` | liefert Logs & Session-Playback |

## Lab-Setup

- Laufender Cowrie aus Übung 02. Erzeuge mit Kali mehrere Login-Versuche (richtig/falsch) und Befehlssequenzen, um Daten zu erzeugen.

## Aufgabe (selbst lösen)

1. Erzeuge Testdaten: mehrere fehlgeschlagene + einige „erfolgreiche" Logins, dann Befehlssequenzen inkl. eines `wget`.
2. Beantworte per `jq`: **Top-10 Quell-IPs**, **Top-10 probierte Username/Passwort-Paare**, **Top-Befehle** nach erfolgreichem Login.
3. Liste alle **Download-URLs** und die **SHA256** der „heruntergeladenen" Dateien.
4. Spiele eine Session per `cowrie-playlog` zurück und beschreibe die Angriffskette in 3–4 Sätzen.

**Ziel:** eine kurze Auswertung mit Top-IPs/Credentials/Befehlen + einer nacherzählten Session.

## SY0-701 Prüfungsbezug

- **4.0** Log-Analyse, Threat Hunting, IOC-Gewinnung aus Honeypot-Daten.
- **2.0** TTPs/Indicators; Mapping auf ATT&CK (Initial Access → Execution → Persistence).
- Begriffe: *brute force*, *credential stuffing*, *IOC*, *TTP*, *session replay*.
