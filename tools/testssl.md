# testssl.sh

**Kategorie:** TLS-/Zertifikats-Analyse

Bash-Script, das einen TLS-Dienst gründlich prüft: unterstützte **Protokolle** (SSLv3–TLS 1.3), **Cipher Suites**, **PFS**, Zertifikat (Kette, SAN, Ablauf, Signatur), Revocation-Hinweise und bekannte **Schwachstellen** (Heartbleed, POODLE, ROBOT, Logjam, …).

```bash
testssl.sh https://host:443
```

## Wichtige Optionen

| Option | Zweck |
|--------|-------|
| `-p` | nur Protokolle (TLS-Versionen) |
| `-E` / `-e` | Cipher-Suiten (pro Kategorie / alle) |
| `-S` | Server-/Zertifikats-Details |
| `-U` | alle bekannten Vulnerabilities testen |
| `-P` | PFS-Prüfung |
| `--severity HIGH` | nur relevante Findings |
| `--jsonfile out.json` | maschinenlesbarer Report |

## Hinweise

Nur gegen **eigene**/freigegebene Dienste. Zeigt schnell „Weak"-Konfigurationen (alte Protokolle, RC4/3DES, kein PFS) → Fix: TLS 1.2/1.3 + AEAD + ECDHE. Alternative: `nmap --script ssl-enum-ciphers`, `sslscan`.

## Verwendet in

cryptography-basics 09 (Weak TLS); pki-certificates 09 (Diagnose), 10 (Capstone).
