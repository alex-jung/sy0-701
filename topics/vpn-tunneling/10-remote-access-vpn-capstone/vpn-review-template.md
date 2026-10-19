# VPN – Security Review

**VPN/Dienst:** ____  **Autor:** ____  **Datum:** ____  **Typ:** Remote-Access / Site-to-Site

---

## 1. Architektur
_Gateway, Protokoll, Tunnel-Netz, Clients, interne Ziele – Diagramm/Beschreibung._

## 2. Krypto / Proposals
| Phase/Ebene | Cipher | Hash/AEAD | Key Exchange / DH | PFS? |
|-------------|--------|-----------|-------------------|------|
| IKE/TLS | AES-256-GCM | | ECDHE/DH19 | |
| Daten/ESP | | | | |

Protokollversion (IKEv2/TLS1.3/WireGuard): ____  Deprecated entfernt? ____

## 3. Authentifizierung
_Zertifikate/PSK/Keys, MFA, CRL/Revocation, Login-Quelle (RADIUS/LDAP)._

## 4. Zugriff (Least Privilege)
| Client/Rolle | erlaubte Ziele | Split/Full | begründet? |
|--------------|----------------|------------|-----------|
| | | | |

## 5. DNS / Leaks
| Test | Ergebnis |
|------|----------|
| Internes DNS funktioniert | |
| DNS-Leak | kein Leak / Leak |
| IPv6-Leak | |
| Kill Switch (Tunnelabbruch) | fail-closed? |

## 6. Monitoring
_Was wird geloggt? Alarme (ungewöhnliche Logins, Fehlversuche)?_

## 7. Findings
| # | Finding | Schweregrad | Empfehlung |
|---|---------|-------------|------------|
| 1 | | | |

## 8. Empfehlungen (priorisiert)
1. ____
2. ____

## 9. Fazit
_Sicher / bedingt / nachbessern – Begründung._
