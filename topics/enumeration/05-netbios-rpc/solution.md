# Lösung – Übung 05: NetBIOS / RPC Enumeration

`<ZIEL>` = Metasploitable-IP.

## 1. NetBIOS-Namen

```bash
nbtscan <ZIEL>
nbtscan -v <ZIEL>          # ausführlicher (Dienste/Suffixe)
nmblookup -A <ZIEL>        # NetBIOS-Namenstabelle + MAC
```
Beispiel:
```
Doing NBT name scan ...
IP address     NetBIOS Name   Server    User       MAC address
<ZIEL>         METASPLOITABLE <server>  METASPLOITABLE 00:0c:29:...
```
→ NetBIOS-Name `METASPLOITABLE`, Workgroup `WORKGROUP`, MAC sichtbar. NSE: `nmap -sU -p137 --script nbstat <ZIEL>`.

## 2. RPC-Dienste

```bash
rpcinfo -p <ZIEL>
```
```
program vers proto   port  service
100000    2   tcp    111  portmapper
100005    1   udp  xxxxx  mountd
100003    2   tcp   2049  nfs
100024    1   udp  xxxxx  status
```
→ portmapper + NFS/mountd wiedererkannt (Bezug zu Übung 04).

## 3. rpcclient Null Session

```bash
rpcclient -U "" -N <ZIEL>
rpcclient $> srvinfo
rpcclient $> enumdomains
rpcclient $> querydominfo
```
`srvinfo` zeigt OS/Version/Server-Typ; `querydominfo` Domäne/Workgroup, Anzahl User. Dass die Null Session (`-U "" -N`) überhaupt klappt, ist bereits der Befund.

## 4. Erste User/Gruppen

```bash
rpcclient $> enumdomusers
rpcclient $> enumdomgroups
```
Liefert (bei offener Samba-Konfiguration) bereits eine User-/Gruppenliste – die systematische Vertiefung (RIDs, Passwort-Policy, Gruppenmitglieder) folgt in Übung 06.

Beenden: `exit`.

## 5. Einordnung & Härtung

- Diese Dienste liefern **Kontext + Einstiegspunkte**: NetBIOS verrät Rolle/Domäne, RPC die laufenden Netzwerkdienste, rpcclient den anonymen Zugang.
- Härtung: NetBIOS/SMBv1 abschalten, wo nicht nötig; `restrict anonymous`, Null Sessions verbieten; portmapper/RPC per Firewall auf berechtigte Hosts beschränken; unnötige RPC-Dienste deaktivieren.

## Häufige Fehler / Troubleshooting

- **`rpcclient`/`nmblookup` fehlt:** `sudo apt install samba-common-bin smbclient`.
- **`nbtscan` fehlt:** `sudo apt install nbtscan`.
- **rpcclient `NT_STATUS_ACCESS_DENIED`:** Null Session unterbunden (gehärtet) → mit gültigen Creds erneut (Übung 06).
- **`rpcinfo` leer:** portmapper gefiltert/aus → NFS-Enum (Übung 04) wäre dann ebenfalls blockiert.
