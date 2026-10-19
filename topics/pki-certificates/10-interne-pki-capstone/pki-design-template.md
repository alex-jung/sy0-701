# Interne PKI – Design & Betrieb

**Organisation/Lab:** ____  **Autor:** ____  **Datum:** ____  **Version:** ____

---

## 1. Zweck & Scope
_Welche Dienste/Clients werden zertifiziert? Welche Domains (z. B. *.server.lab)?_

## 2. Hierarchie (Diagramm)
```
Root CA (offline)
  └─ Intermediate CA (pathlen:0, nameConstraints .server.lab)
       ├─ TLS-Server-Zerts (serverAuth, SAN)
       └─ Client-Zerts (clientAuth)   [mTLS]
```

## 3. Rollen & Verantwortlichkeiten
| Rolle | Aufgabe |
|-------|---------|
| Root-CA-Operator | Intermediate signieren (selten, offline) |
| Intermediate/RA | Ausstellen, Widerruf, CRL/OCSP |
| Antragsteller | Key+CSR erzeugen, Private Key schützen |

## 4. Schlüssel & Algorithmen
| CA/Zert | Algorithmus | Länge/Kurve | Laufzeit | Key-Schutz |
|---------|-------------|-------------|----------|------------|
| Root | RSA/EC | 4096 / P-384 | 10 J | Passphrase, offline/HSM |
| Intermediate | | | 5 J | |
| Leaf | | | ≤ 397 T | |

## 5. Extensions-Policy
_SAN-Pflicht, KU/EKU je Zert-Typ, BasicConstraints, NameConstraints._

## 6. Lifecycle
_Enrollment (CSR), Issuance, Renewal, Revocation, Erneuerung der CRL._

## 7. Revocation
_CRL-Veröffentlichung (URL/Intervall/nextUpdate), OCSP-Responder, Stapling, fail-open/closed._

## 8. Trust-Verteilung
_Wie kommt die Root in die Trust-Stores (OS/Browser/Geräte)?_

## 9. Risiken & Gegenmaßnahmen
| Risiko | Maßnahme |
|--------|----------|
| CA-Key-Compromise | offline Root, Passphrase/HSM, NameConstraints, Revoke+Reissue |
| OCSP/CRL fail-open | kurze Laufzeiten, Stapling, Monitoring |
| Fehlausstellung | 4-Augen, Logging (index.txt), Audits |

## 10. Betrieb/Monitoring
_Ablauf-Monitoring, Logging, Backups der CA-DB, Audits._
