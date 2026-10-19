# FreeRADIUS

**Kategorie:** AAA / RADIUS-Server

Verbreiteter RADIUS-Server für zentrale **Authentication/Authorization/Accounting** von Netzwerkzugang: WLAN (WPA-Enterprise), VPN, Switch-Ports (802.1X), Router-/Device-Admin. Spricht mit NAS-Geräten (AP/Switch) und Backends (Dateien, SQL, LDAP, AD).

```bash
sudo freeradius -X        # Debug-Modus im Vordergrund
```

## Wichtige Dateien/Tools

| Pfad/Tool | Zweck |
|-----------|-------|
| `clients.conf` | erlaubte NAS/Clients + Shared Secret |
| `mods-config/files/authorize` (`users`) | lokale Benutzer/Attribute |
| `mods-available/eap` | EAP-Methoden (EAP-TLS/PEAP/TTLS) |
| `sites-enabled/*` | Virtual Server / Policies |
| `radtest` / `radclient` | Access-Request testen |

## Hinweise

Shared Secret muss am NAS identisch sein. EAP-TLS braucht eine PKI (Server-/Client-Zerts → `pki-certificates`). RADIUS klassisch nur schwach geschützt (MD5) → über WAN RadSec/IPsec. `-X` ist das wichtigste Debug-Tool. Verwandt/Alternative: TACACS+ (Device-Admin, voll verschlüsselt).

## Verwendet in

authentication 06 (RADIUS & 802.1X), 10; Querbezug wireless-security (WPA-Enterprise).
