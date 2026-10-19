# Lösung – Übung 07: Key Management & HSM

## 1. Key Lifecycle (CA-Key, Beispiel)

| Phase | Maßnahme |
|-------|----------|
| Generate | starke Länge/Algorithmus, in sicherer Umgebung |
| Distribute | nur Public Key verteilen; Private nie weitergeben |
| Store | offline/verschlüsselt, `chmod 400`, Passphrase/HSM |
| Use | nur zum Signieren, minimaler Zugriff, protokolliert |
| Rotate | geplante Erneuerung/Nachfolger |
| Revoke | bei Kompromittierung (CRL, `pki-certificates` 08) |
| Destroy/Archive | sicheres Löschen bzw. verschlüsseltes Archiv |

## 2. Speicher-Technologien

| Tech | Zweck/Einsatz |
|------|---------------|
| HSM | manipulationssichere HW, Keys verlassen es nie (CA/PKI, hohe Sicherheit) |
| KMS | zentrale Schlüsselverwaltung (Cloud/Vault), Envelope Encryption |
| TPM | Geräte-Chip (BitLocker-Key, Measured Boot) |
| Secure Enclave | isolierter Bereich im Prozessor (mobile/Endgeräte) |

## 3. Rotation/Revocation + Storage

- **Rotation:** periodisch (z. B. Leaf-Zerts ≤ 1 Jahr) + anlassbezogen (Verdacht/Personalwechsel); Passwort-/Session-Keys häufiger.
- **Revocation:** sofort bei Kompromittierung (CRL/OCSP); Zugänge sperren.
- **Storage:** Keys **getrennt** von Daten, Zugriff minimal (Least Privilege), Backup/Escrow nur verschlüsselt und kontrolliert.

## 4. Key Escrow

- **Idee:** hinterlegte Schlüsselkopie (bei Treuhänder/HSM) für **Recovery** (verlorener Key) oder rechtliche Anforderungen.
- **Vorteil:** keine Datenverluste bei Key-Verlust. **Nachteil:** zusätzliches Angriffsziel/Missbrauchsrisiko → strenge Governance (Mehr-Augen, Audit).
- **Angebracht:** FDE-Recovery-Keys in Unternehmen, regulatorische Pflichten; **nicht** leichtfertig für alle Keys.

## Hinweise / Troubleshooting

- Der häufigste Krypto-Fehler ist schlechtes **Key Management**, nicht der Algorithmus.
- HSM/KMS trennen Key-Nutzung von Key-Besitz → Keys verlassen die geschützte Grenze nicht.
- Escrow bewusst/dokumentiert einsetzen (Governance), nicht als Standard für alles.
