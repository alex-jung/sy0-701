# Lösung – Übung 08: Secure Protocols & Design

## 1./2. Ist → Zielbild (Beispiel)

| Ist (unsicher) | Ziel (sicher) | schützt |
|----------------|---------------|---------|
| HTTP (DVWA/Test) | HTTPS (TLS, eigene CA) | Vertraulichkeit/Integrität in-transit |
| Telnet (Altgerät) | SSH | Auth + Verschlüsselung |
| SNMPv2c (Monitoring) | SNMPv3 | Auth + Verschlüsselung |
| LDAP | LDAPS/StartTLS | Klartext-Bind verhindern (`authentication` 05) |
| DNS (extern) | DoT/DoH + DNSSEC | Vertraulichkeit + Integrität |
| FTP | SFTP (über SSH) | Credentials/Daten schützen |

## 3. Design-Entscheidungen (Beispiele)

- **Management nur SSH (22→Key/Cert) und HTTPS (TLS 1.2/1.3, AEAD, PFS)** aus dem MGMT-Netz/Bastion → kein Klartext-Admin.
- **SNMPv3** mit authPriv statt SNMPv2c-Community → kein lesbarer Community-String auf der Leitung.
- **DNS nach extern via DoT** + intern DNSSEC-Validierung → keine Klartext-Queries/Spoofing.
Begründung jeweils über Vertraulichkeit/Integrität/Auth + minimierte Exposure (Port nur dort offen, wo nötig).

## 4. Abschalten / Legacy

- Abschalten: Telnet, FTP, SNMPv1/2c, alte TLS-Versionen (1.0/1.1), ungenutzte Dienste → Surface-Reduction.
- Legacy (nicht umstellbar): in isoliertes VLAN, Zugriff nur über Proxy/Bastion, Monitoring → **compensating control** (`security-controls` 06).

## Hinweise / Troubleshooting

- „Sicher" heißt auch **aktuelle Version/Cipher** (SNMPv3 authPriv, TLS 1.2/1.3 + PFS), nicht nur „das verschlüsselte Protokoll".
- DNSSEC schützt **Integrität** (nicht Vertraulichkeit); DoT/DoH schützt **Vertraulichkeit** → oft kombinieren.
- Nach Umstellung testen (`nmap`/`testssl`) und alte Ports schließen.
