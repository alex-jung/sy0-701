# oathtool

**Kategorie:** MFA / OTP (HOTP/TOTP)

CLI zum Erzeugen/Prüfen von **HOTP** (RFC 4226, zählerbasiert) und **TOTP** (RFC 6238, zeitbasiert) Einmalpasswörtern aus einem gemeinsamen Secret (Base32/Hex). Nützlich zum Testen von Authenticator-Setups.

```bash
oathtool --totp -b JBSWY3DPEHPK3PXP      # TOTP aus Base32-Secret
oathtool --hotp -c 5 -b <SECRET>         # HOTP, Zähler=5
```

## Wichtige Optionen

| Option | Zweck |
|--------|-------|
| `--totp` / `--hotp` | Zeit- bzw. zählerbasiert |
| `-b` | Secret ist Base32 (sonst Hex) |
| `-c N` | HOTP-Zähler |
| `-d N` | Stellen (default 6) |
| `-s N` | TOTP-Zeitschritt (default 30 s) |
| `-v` | Details (Zeitfenster, Hash) |

## Hinweise

TOTP braucht synchrone Uhr (NTP). TOTP ist stärker als SMS-OTP, aber **nicht phishing-resistent** (dafür FIDO2). Secret wie einen Schlüssel behandeln. Verwandt: `libpam-google-authenticator` (PAM-Integration).

## Verwendet in

authentication 03 (TOTP/HOTP MFA), 10 (Capstone).
