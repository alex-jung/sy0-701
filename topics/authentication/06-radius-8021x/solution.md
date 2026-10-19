# Lösung – Übung 06: RADIUS & 802.1X

## 1. FreeRADIUS einrichten

```bash
sudo apt install -y freeradius freeradius-utils
# Testnutzer: /etc/freeradius/3.0/users (oder mods-config/files/authorize)
#   alex  Cleartext-Password := "Lab-Pass-123"
# Client/NAS: /etc/freeradius/3.0/clients.conf
#   client lab-nas { ipaddr = 127.0.0.1  secret = testing123 }
sudo freeradius -X        # Debug-Modus (Vordergrund)
```

## 2. radtest

```bash
radtest alex Lab-Pass-123 127.0.0.1 0 testing123   # -> Access-Accept
radtest alex FALSCH       127.0.0.1 0 testing123   # -> Access-Reject
```
Im `-X`-Log sieht man Access-Request → Accept/Reject inkl. Attributen (NAS-IP, User-Name).

## 3. 802.1X-Rollen & Fluss

- **Supplicant** (Client/Gerät) ↔ **Authenticator** (Switch/AP, hält Port „nur EAP") ↔ **Authentication Server** (RADIUS).
- Fluss: Port-Up → EAPOL-Start → Identity-Request/Response → EAP-Methode (TLS/PEAP) zwischen Supplicant und RADIUS (Authenticator leitet nur durch) → RADIUS Access-Accept (+ ggf. VLAN-Zuweisung) → Port freigegeben.

## 4. EAP-TLS vs PEAP

| | EAP-TLS | PEAP(/EAP-TTLS) |
|---|--------|------------------|
| Auth | **beidseitige Zertifikate** | Server-Zert + inneres Passwort (MSCHAPv2) |
| Sicherheit | sehr hoch, phishing-resistent | gut, aber passwortbasiert |
| Aufwand | Client-Zerts/PKI nötig | nur Server-Zert |
| Einsatz | hohe Sicherheit, verwaltete Geräte | BYOD/einfacher Rollout |

## Hinweise / Troubleshooting

- Shared Secret im `clients.conf` muss am NAS identisch sein, sonst „Shared secret is incorrect".
- EAP-TLS braucht eine PKI (Server- **und** Client-Zerts) → `pki-certificates`.
- RADIUS über WAN nur mit RadSec/IPsec (klassisch nur schwacher MD5-Schutz).
- TACACS+ (Cisco) trennt AuthN/AuthZ/Acct und verschlüsselt den gesamten Payload → oft für Device-Admin.
