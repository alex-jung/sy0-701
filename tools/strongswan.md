# strongSwan (IPsec)

**Kategorie:** VPN (IPsec / IKEv2)

IPsec-Implementierung (auch unter OPNsense). Sichert IP-Verkehr auf Layer 3 via **IKE** (Key Exchange/Auth) und **ESP** (Verschlüsselung+Integrität). Standard für **Site-to-Site** zwischen Gateways; Phase 1 (IKE SA) + Phase 2 (Child/IPsec SA), Tunnel- vs. Transport-Mode.

```bash
ipsec statusall          # bzw. swanctl --list-sas
swanctl --initiate --child <name>
```

## Wichtige Befehle/Konfig

| Befehl/Datei | Zweck |
|--------------|-------|
| `swanctl.conf` / `ipsec.conf` | Connections/Proposals |
| `ipsec statusall` | SAs/Status |
| `swanctl --list-sas` | aktive SAs (neues API) |
| Proposals | AES-GCM, SHA2, DH 19/20, PFS |

## Hinweise

Immer **IKEv2** (kein v1/Aggressive Mode), **PFS**, starke DH-Gruppen. NAT zwischen Gateways → **NAT-T (UDP 4500)**. Phase-2-Fehler meist falsche/asymmetrische Traffic Selectors. Auth per PSK oder Zertifikate (→ `pki-certificates`). In OPNsense meist per GUI konfiguriert.

## Verwendet in

vpn-tunneling 05 (Site-to-Site), 08, 09, 10.
