# Lösung – Übung 02: Data Classification

## 1. Schema (Beispiel)

| Klasse | Kriterium |
|--------|-----------|
| Public | frei veröffentlichbar, kein Schaden |
| Internal | intern, geringer Schaden |
| Confidential | Schaden bei Offenlegung |
| Restricted | kritisch/geheim, schwerer/rechtlicher Schaden |

## 2. Datentypen + Klasse (Beispiele)

| Beispiel | Datentyp | Klasse |
|----------|----------|--------|
| Name+Adresse+Geburtsdatum | PII | Confidential/Restricted |
| Diagnosedaten | PHI | Restricted |
| Kreditkartennummer | PCI | Restricted |
| Quellcode/Produktdesign | IP/trade secret | Confidential |
| interne Notizen | — | Internal |
| Marketing-Blog | — | Public |

## 3. Lab-Daten + Handling

| Datenart | Klasse | Handling |
|----------|--------|----------|
| CA-/SSH-Private-Keys | Restricted | verschlüsselt, `chmod 400`, offline, nie committen, kurze Retention |
| Passwörter/Secrets | Restricted | Secret-Store, rotieren |
| OPNsense-Config | Confidential | Zugriff beschränkt, verschlüsseltes Backup |
| Logs | Confidential | Zugriff beschränkt, Retention, Integrität |
| Übungs-Markdown | Internal | Repo/Versionierung |
| README | Public | öffentlich |

## 4. Labeling/Tagging

- Macht die Klasse **sichtbar/maschinenlesbar** (Dateiname/Metadaten/Header) → ermöglicht **Automatisierung**: DLP blockt Versand von „confidential"-Tags, Backup/Retention greift je Tag, Zugriffsregeln automatisch. Ohne Labels kann man Handling nicht durchsetzen/automatisieren.

## Hinweise / Troubleshooting

- **Over-classification** (alles „restricted") lähmt Arbeit; **under-classification** leakt → risikobasiert.
- Data Owner (Business) entscheidet die Klasse, nicht die Technik (`governance-compliance`).
- Klassifizierung ist die **Voraussetzung** für zielgerichtete Verschlüsselung/DLP (Übungen 03–06).
