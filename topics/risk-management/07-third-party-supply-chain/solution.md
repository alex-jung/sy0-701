# Lösung – Übung 07: Third-Party-/Supply-Chain-Risiko

## 1. Third-Party-Komponenten (Beispiel)

| Komponente | Herkunft | Supply-Chain-Risiko |
|------------|----------|---------------------|
| Proxmox/OPNsense/Kali | offizielle Projekte | mittel (Integrität der ISOs) |
| Docker-Images (Keycloak, LDAP, Dionaea…) | Docker Hub | mittel–hoch (Tags, Maintainer) |
| Python-Pakete/Tools | PyPI/apt | mittel (dependency confusion/typosquatting) |
| dieses Repo/Abhängigkeiten | GitHub | niedrig–mittel |

## 2. Vendor-Assessment-Fragebogen (Beispiel)

1. Habt ihr ISO 27001 / SOC 2 (aktueller Report)?
2. Wie werden unsere Daten gespeichert/verschlüsselt (at-rest/in-transit)?
3. Gibt es ein dokumentiertes IR-/Breach-Notification-Verfahren + Meldefristen?
4. Wie sieht euer Patch-/Vuln-Management aus?
5. Subunternehmer/4th parties – wer hat Zugriff?
6. Right-to-audit / Pen-Test-Reports verfügbar?
7. MFA und Zugriffskontrolle für euer Personal?
8. Backup/BCP/DR (RTO/RPO)?
9. Datenlöschung/Offboarding beim Vertragsende?
10. Compliance (DSGVO/DPA) – wo werden Daten verarbeitet (Region)?

## 3. Vertragsinstrumente

| Instrument | Zweck |
|-----------|-------|
| **SLA** | messbare Leistung/Verfügbarkeit + Strafen |
| **MSA** | übergreifender Rahmenvertrag |
| **SOW** | konkreter Arbeitsumfang/Deliverables |
| **BPA** | Rechte/Pflichten zwischen Geschäftspartnern |
| **MOU/MOA** | (unverbindliche) Absichtserklärung/Vereinbarung |
| **NDA** | Vertraulichkeit |
| **DPA** | Datenschutz/Auftragsverarbeitung (DSGVO) |

## 4. Integritätsprüfung + SBOM

```bash
sha256sum image.iso           # mit offiziellem Hash vergleichen
gpg --verify SHA256SUMS.gpg SHA256SUMS   # Signatur der Checksummen prüfen
```
**SBOM:** eine maschinenlesbare Stückliste aller Komponenten/Versionen → man kann bei einer neuen CVE sofort sehen, ob man betroffen ist (z. B. „ist log4j drin?"), und Abhängigkeiten gezielt scannen/pinnen → senkt Dependency-/Supply-Chain-Risiko.

## Hinweise / Troubleshooting

- Vendor-Risiko ist **laufend** (nicht nur bei Vertragsabschluss) → periodische Re-Assessments.
- Image-Tags wie `latest` sind ein Risiko → Version pinnen + Hash prüfen.
- Right-to-audit nur sinnvoll, wenn man es auch **ausübt**.
