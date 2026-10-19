# Lösung – Übung 08: Data Governance

## 1. Klassifizierungs-Schema (Beispiel)

| Klasse | Kriterium | Beispiel |
|--------|-----------|----------|
| Public | frei veröffentlichbar | README, öffentliche Doku |
| Internal | intern, geringer Schaden | Übungs-Markdown, Notizen |
| Confidential | Schaden bei Offenlegung | OPNsense-Config, Logs |
| Restricted | kritisch/geheim | CA-Key, SSH-Private-Keys, Passwörter |

## 2. Klassifizierte Daten + Controls

| Datenart | Klasse | Controls |
|----------|--------|----------|
| CA-/SSH-Private-Keys | Restricted | Verschlüsselung/Passphrase, `chmod 400`, offline, nie committen, kurze Gültigkeit |
| Passwörter/Secrets | Restricted | Secret-Store, `.gitignore`, Rotation |
| OPNsense-Config | Confidential | Zugriffsbeschränkt, verschlüsseltes Backup |
| Logs (SIEM) | Confidential | Zugriff beschränkt, Retention, Integrität |
| Übungs-Markdown | Internal | Repo, Versionierung |
| dieses README | Public | öffentlich (GitHub) |

## 3. Rollen (Beispiele)

- **CA-Keys:** Owner = Lab-Owner (entscheidet Nutzung), Custodian = ich technisch (Verwahrung/Backup), Steward = Pflege/Inventar.
- **Logs:** Owner = Lab-Owner, Custodian = SIEM-Betrieb, Steward = Normalisierung/Qualität.

## 4. Lifecycle (sensible Datenart: CA-Key)

create (generieren, Passphrase) → store (offline/verschlüsselt, `chmod 400`) → use (nur zum Signieren) → share (nur Public Key) → archive (verschlüsseltes Backup) → **destroy** (sicheres Löschen: `shred`/Crypto-Erase; bei Kompromittierung Revoke + Neuausstellung).
- **Retention:** Keys nur so lange wie nötig; Logs z. B. 90–365 Tage.
- **Sovereignty:** falls Backups in Cloud → Region/Recht beachten.

## Hinweise / Troubleshooting

- **Owner (Business) ≠ Custodian (Technik)** – häufiger Prüfungs-Stolperstein.
- Klassifizierung **treibt** Controls (nicht umgekehrt): erst klassifizieren, dann schützen.
- Sichere Löschung/Sanitization gehört zum Lifecycle (nicht „einfach rm").
- Über-Klassifizieren vermeiden (alles „Restricted" lähmt) → risikobasiert.
