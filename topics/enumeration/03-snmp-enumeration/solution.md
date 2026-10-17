# Lösung – Übung 03: SNMP Enumeration

`<ZIEL>` = Ziel-IP.

## 0. (Falls nötig) SNMP auf dem Ziel aktivieren

Auf dem Ziel (z. B. Metasploitable):
```bash
sudo apt install snmpd
# in /etc/snmp/snmpd.conf:
#   agentAddress udp:161
#   rocommunity public
sudo systemctl restart snmpd
```

## 1. Community-Strings bruteforcen

```bash
onesixtyone -c /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings.txt <ZIEL>
# oder schnell nur public/private:
echo -e "public\nprivate" > comm.txt; onesixtyone -c comm.txt <ZIEL>
```
Treffer:
```
<ZIEL> [public] Linux metasploitable 2.6.24-16-server ...
```

## 2. MIB-Baum ablaufen

```bash
snmpwalk -v2c -c public <ZIEL>               # ALLES (viel Output)
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.1 # System-Gruppe
```
Gezielt:
```bash
# Hostname / OS
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.1.5   # sysName
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.1.1   # sysDescr (OS/Kernel)
# Laufende Prozesse
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.25.4.2.1.2
# Installierte Software
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.25.6.3.1.2
```

## 3. User & Netzwerk

```bash
# lokale Benutzer (hrSWRunName / host resources, bzw. über extend)
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.4.1.77.1.2.25     # Windows user accounts (klassisch)
# TCP-Ports / Verbindungen
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.6.13.1.3      # lokale TCP-Ports
# Interfaces
snmpwalk -v2c -c public <ZIEL> 1.3.6.1.2.1.2.2.1.2
```
(Verfügbare OIDs hängen vom Ziel-Agent ab; unter Linux liefern die Host-Resources-OIDs `25.*` Prozesse/Software.)

## 4. snmp-check (aufbereitet)

```bash
snmp-check <ZIEL> -c public
```
Gibt übersichtlich: System-Info, Uptime, Netzwerk-Interfaces, Routing, lauschende Ports, Prozesse, teils User – ideal fürs Reporting.

## 5. Warum gefährlich / SNMPv3

- **`public`** = unauthentifizierter Lesezugriff auf sehr viele interne Details (Prozesse, Software → CVE-Ansatz, User → Login-Ziele). `private` erlaubt oft sogar Schreibzugriff (Config ändern!).
- **SNMPv3** bietet **Authentifizierung (authNoPriv)** und **Verschlüsselung (authPriv)** → keine Klartext-Community, keine Belauschbarkeit.
- Hardening: v1/v2c abschalten, falls nötig nur v3 mit starken Credentials, Zugriff per ACL/Firewall auf Management-Hosts beschränken, Community niemals `public`/`private`.

## Häufige Fehler / Troubleshooting

- **Kein Output:** SNMP-Agent läuft nicht / falsche Community / UDP 161 gefiltert. Mit `nmap -sU -p161 <ZIEL>` prüfen.
- **`snmpwalk` sehr langsam:** `-On` (numerische OIDs), gezielt Teilbäume abfragen statt alles.
- **MIBs-Warnungen:** `sudo apt install snmp-mibs-downloader` und in `/etc/snmp/snmp.conf` `mibs :` auskommentieren, oder mit `-On` ignorieren.
- **Tools fehlen:** `sudo apt install snmp onesixtyone snmp-check`.
