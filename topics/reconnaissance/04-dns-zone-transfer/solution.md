# Lösung – Übung 04: DNS-Zonentransfer

Annahme: DNS-Server-VM = `192.168.56.60`, Kali im selben Netz.

## 1. BIND aufsetzen (verwundbar)

`/etc/bind/named.conf.local`:
```
zone "lab.local" {
    type master;
    file "/etc/bind/db.lab.local";
    allow-transfer { any; };      // VERWUNDBAR
};
```

`/etc/bind/db.lab.local`:
```
$TTL 604800
@   IN  SOA ns1.lab.local. admin.lab.local. (
        2024010101 ; Serial
        604800 86400 2419200 604800 )
@       IN  NS   ns1.lab.local.
ns1     IN  A    192.168.56.60
www     IN  A    192.168.56.61
mail    IN  A    192.168.56.62
intranet IN A    192.168.56.63
dev     IN  A    192.168.56.64
vpn     IN  A    192.168.56.65
@       IN  MX 10 mail.lab.local.
```

Prüfen & starten:
```bash
sudo named-checkconf
sudo named-checkzone lab.local /etc/bind/db.lab.local
sudo systemctl restart bind9    # bzw. named
```

## 2. AXFR mit dig (Angreifer, Kali)

```bash
dig NS lab.local @192.168.56.60 +short        # Name-Server finden
dig AXFR lab.local @192.168.56.60             # kompletten Zonentransfer
```
Erfolg = die **gesamte Zone** wird ausgegeben:
```
lab.local.        IN SOA ns1.lab.local. admin.lab.local. ...
lab.local.        IN NS  ns1.lab.local.
www.lab.local.    IN A   192.168.56.61
mail.lab.local.   IN A   192.168.56.62
intranet.lab.local. IN A 192.168.56.63
dev.lab.local.    IN A   192.168.56.64
vpn.lab.local.    IN A   192.168.56.65
...
```

## 3. Mit dnsenum / dnsrecon

```bash
dnsenum --dnsserver 192.168.56.60 lab.local
dnsrecon -n 192.168.56.60 -d lab.local -t axfr
```
Beide erkennen den offenen Transfer automatisch und listen dieselben Records (bei Erfolg „Zone Transfer was successful").

## 4. Verteidiger-Teil: härten

`/etc/bind/named.conf.local` ändern:
```
    allow-transfer { 192.168.56.70; };   // nur bekannter Secondary
    // oder komplett verbieten:
    // allow-transfer { none; };
```
Neu laden und erneut testen:
```bash
sudo systemctl restart bind9
dig AXFR lab.local @192.168.56.60
```
Jetzt:
```
; Transfer failed.
```
→ AXFR von Kali wird abgelehnt. Einzelne Lookups (`dig www.lab.local @...`) funktionieren weiter – nur der **Komplett-Transfer** ist dicht.

## 5. Warum so kritisch

Ein offener AXFR liefert die **komplette interne Namenslandschaft** auf einen Schlag: alle Subdomains (`dev`, `intranet`, `vpn`, `mail`), zugehörige IPs, Mail-Infrastruktur. Statt mühsam Subdomains zu raten (Übung 05), bekommt der Angreifer die fertige Zielliste – inkl. Hinweisen auf interne/sensible Systeme.

## Häufige Fehler / Troubleshooting

- **`named` startet nicht:** `named-checkconf` / `named-checkzone` zeigen Syntax-/Serial-Fehler; Journal: `journalctl -u bind9 -e`.
- **Dienstname:** je nach Distro `bind9` oder `named`.
- **AXFR „connection refused":** BIND lauscht evtl. nur auf localhost → `listen-on { any; };` in `named.conf.options`, Firewall auf der VM prüfen (Port 53 TCP! AXFR nutzt **TCP**, nicht UDP).
- **`dig AXFR` leer, aber kein Fehler:** falscher NS angefragt; immer `@<autoritativer NS>` setzen.
