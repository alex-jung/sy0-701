# Lösung – Übung 03: Detection & Triage

## 1. Vorfall auslösen + Alert

```bash
# Kali:
hydra -l admin -P pass.txt <ziel> ssh      # Brute-Force
ssh admin@<ziel>                            # danach "erfolgreicher" Login (schwaches PW)
```
SIEM/IDS feuert: Brute-Force-Regel (z. B. rule 100110 aus `logging-siem` 06) + ggf. „Accepted password".

## 2. Triage (Multi-Source)

- **SIEM:** viele `Failed` (5710) von einer IP, dann ein `Accepted` (5715) desselben Kontos → **TP**-Verdacht.
- **Host:** `last`, `grep Accepted /var/log/auth.log`, `who` → bestätigt den Login + Quelle.
- **Capture (optional):** SSH-Verbindung von der Angreifer-IP.
Drei Quellen bestätigen → kein FP.

## 3. Scope

```bash
grep "<angreifer-ip>" /var/log/auth.log       # welches Konto, seit wann
last | grep <konto>
ss -tnp | grep <angreifer-ip>                 # aktive Session?
```
Scope: Host X, Konto `admin`, Quelle `<IP>`, Login um <Zeit>, ggf. noch aktiv.

## 4. IoCs + weitere Betroffene

IoCs: **Angreifer-IP**, **Konto `admin`**. Im SIEM über **alle** Hosts suchen (`data.srcip:<IP>` / `admin`-Logins) → gab es anderswo Erfolge? (Lateral Movement?).

## 5. Klassifizieren + Entscheidung

Erfolgreicher unautorisierter Login auf einem relevanten System = mindestens **SEV2**, bei sensiblen Daten/Ausbreitung **SEV1** → **Incident deklarieren**, Incident Commander/Eskalation, weiter mit Containment (Übung 04).

## Häufige Fehler / Troubleshooting

- **Vorschnell FP:** niedrige Alert-Konfidenz ≠ FP → mit zweiter Quelle verifizieren.
- **Vorschnell abschalten:** erst Scope/Beweise (Übung 05) – sonst Beweis-/Betriebsschaden.
- **IoC nicht netzweit gesucht:** einzelner Host kann Teil einer größeren Kompromittierung sein.
- **Zeit nicht beachtet:** „seit wann" ist zentral für Scope/Timeline (NTP!).
