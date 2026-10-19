# Identity & Authentication – Assessment

**Umgebung:** ____  **Autor:** ____  **Datum:** ____

---

## 1. Architektur
_IdP, Directory, Apps, Netzwerk-AAA (RADIUS), SSH/Server – Diagramm/Beschreibung._

## 2. Faktoren & MFA-Abdeckung
| System | AuthN-Verfahren | Faktoren | MFA? | Phishing-resistent? |
|--------|-----------------|----------|------|---------------------|
| App (OIDC) | Passwort+TOTP | know+have | ✅ | ❌ |
| Admin/SSH | Key/Cert | have | ✅ | ✅ |
| WLAN/VPN | 802.1X EAP-TLS | have | ✅ | ✅ |

## 3. IAM-Lifecycle
_Provisioning, Rollen/Gruppen (Least Privilege), Review, **Deprovisioning**._

## 4. Findings
| # | Finding | Schweregrad | Empfehlung |
|---|---------|-------------|------------|
| 1 | Dienst X ohne MFA | hoch | MFA erzwingen |

## 5. Angriffe & Abwehr (getestet)
| Angriff | Ergebnis ohne Schutz | Abwehr | Ergebnis mit Schutz |
|---------|----------------------|--------|---------------------|
| Credential Stuffing | | MFA/Lockout | |
| AiTM-Phishing | | FIDO2 | |

## 6. Empfehlungen (priorisiert)
1. ____
2. ____

## 7. Reifegrad / Fazit
_z. B. passwordless-Roadmap, phishing-resistant MFA überall, Monitoring/Accounting._
