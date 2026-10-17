# Übung 03 – SNMP Enumeration

**Schwierigkeit: 3/10 · Dauer: ca. 45 Min.**

## Lernziele

- SNMP, Community Strings und die MIB/OID-Struktur verstehen
- Default-Community-Strings (`public`) finden und ausnutzen
- Systeminfos, Prozesse, Benutzer, Netzwerk- und Software-Daten per SNMP abgreifen
- Den Sicherheitsunterschied SNMP v1/v2c vs. v3 kennen

## Theorie

**SNMP** (Simple Network Management Protocol, UDP 161) verwaltet Geräte und gibt dabei **enorm viele Infos** preis: Hostname, OS, laufende Prozesse, installierte Software, Benutzerkonten, Netzwerk-Interfaces, offene Ports, Routing. Der Zugriff wird in **v1/v2c** nur durch einen **Community String** „geschützt" – im Klartext, oft auf dem Default **`public`** (read) / `private` (read-write).

Daten sind als **MIB** (Management Information Base) in einem Baum aus **OIDs** organisiert (z. B. `1.3.6.1.2.1.1.5.0` = sysName). Mit `snmpwalk` läuft man den Baum ab.

**SNMPv3** bringt Authentifizierung + Verschlüsselung → kein Klartext-Community mehr. v1/v2c mit Default-Community ist ein Klassiker unter den Findings.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `onesixtyone` | Community-Strings schnell bruteforcen | `-c <liste> <ziel>` |
| `snmpwalk` | MIB-Baum abfragen | `-v2c -c public <ziel> [OID]`, `-On` |
| `snmp-check` | aufbereitete Komplettübersicht | `snmp-check <ziel> -c public` |
| `nmap` NSE | SNMP-Infos | `-sU -p161 --script snmp-* ` |

## Lab-Setup

- Ein Ziel mit aktivem `snmpd` und Community `public`. Auf Metasploitable ggf. nachrüsten:
  `sudo apt install snmp snmpd` → in `/etc/snmp/snmpd.conf` `rocommunity public` setzen, Dienst starten. (Details in `solution.md`.)
- Kali mit `snmp`-Tools und `onesixtyone`.

## Aufgabe (selbst lösen)

1. Finde mit `onesixtyone` gültige **Community Strings** des Ziels.
2. Laufe mit `snmpwalk` den kompletten MIB-Baum ab und ziehe daraus: **Hostname/OS**, **laufende Prozesse**, **installierte Software**.
3. Extrahiere gezielt **Benutzerkonten** und **Netzwerk-Interfaces/Ports** über die passenden OIDs.
4. Erzeuge mit `snmp-check` eine aufbereitete Gesamtübersicht.
5. Erkläre, warum `public` so gefährlich ist und was SNMPv3 besser macht.

**Ziel:** ein SNMP-Steckbrief des Ziels (OS, Prozesse, Software, User, Netzinfos), gewonnen über einen Default-Community-String.

## SY0-701 Prüfungsbezug

- **SNMP (161/162)** und **Community Strings** sind explizite Prüfungsinhalte; **Default Credentials** als Schwachstelle.
- **SNMPv1/v2c vs. v3:** Klartext/keine Auth vs. Authentifizierung + Encryption – typische Vergleichsfrage.
- **Information disclosure:** SNMP leakt massiv interne Details → Attack Surface.
- Begriffe: *SNMP*, *community string*, *MIB/OID*, *SNMPv3*, *default credentials*, *information disclosure*.
