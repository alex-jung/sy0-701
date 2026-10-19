# Lösung – Übung 01: Data States

## 1. States + Controls

| State | Controls |
|-------|----------|
| At Rest | FDE/LUKS, DB-/File-Encryption, Zugriffskontrolle |
| In Transit | TLS, VPN/IPsec, sichere Protokolle |
| In Use | Confidential Computing/Enclaves, Speicherverschlüsselung, Least Privilege |

## 2. Zuordnung

| Beispiel | State |
|----------|-------|
| VM-Disk-Image | at rest |
| SSH-Session | in transit |
| Prozess mit Passwort im RAM | in use |
| Backup-Datei | at rest |
| TLS-Download | in transit |
| DB im Betrieb (Queries) | in use (+ at rest für Dateien) |

## 3. Warum „in use" am schwersten

Zum Verarbeiten müssen Daten **entschlüsselt** im Speicher vorliegen → klassische Krypto schützt nicht. Angriffsvektoren: Memory-Dump, kompromittierter Prozess/OS, Side-Channels. Adressiert durch **Confidential Computing** (TEE/Enclaves wie Intel SGX, AMD SEV), Speicherverschlüsselung, strikte Isolation/Rechte.

## 4. Classification × State

**Classification** legt den **Schutzbedarf** fest (public→restricted), **State** den **Mechanismus**. Beispiel: „restricted"-Daten → at rest **und** in transit **immer** verschlüsselt + Zugriff minimal; „public" → in transit evtl. Integrität genügt. Also: erst klassifizieren, dann pro State die passende Stärke wählen.

## Hinweise / Troubleshooting

- Eine Datei kann mehrere States durchlaufen (at rest → in transit → in use) → durchgängig schützen.
- FDE schützt die Disk **im ausgeschalteten** Zustand; läuft das System, sind Daten „in use" angreifbar.
- Vertraulichkeit ≠ alles: Integrität (Signatur/Hash) und Verfügbarkeit (Backup) gehören dazu.
