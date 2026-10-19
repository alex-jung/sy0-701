# Übung 02 – Self-signed Zertifikat erstellen

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- Ein self-signed Zertifikat samt Schlüssel erzeugen
- Verstehen, warum es „funktioniert", aber Warnungen auslöst
- Den Unterschied self-signed vs. CA-signiert einordnen

## Theorie

Ein **self-signed** Zertifikat ist von **sich selbst** signiert (Issuer = Subject) – es gibt keine externe CA, die die Identität bestätigt. Kryptografisch verschlüsselt es TLS genauso stark, aber es fehlt das **Vertrauen**: kein Trust Store kennt diese „CA", deshalb warnen Browser/Clients („not trusted / self signed certificate"). 

Einsatz: interne Tests, Entwicklung, Geräte ohne öffentliche Namen. Für echte Dienste nutzt man CA-signierte Zertifikate (eigene CA im Lab ab Übung 03, öffentlich z. B. Let's Encrypt). Wichtig schon hier: **SAN** setzen, sonst akzeptieren moderne Clients das Zertifikat selbst bei manuellem Vertrauen nicht sauber.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl req -x509` | Key + self-signed Zertifikat in einem Schritt |
| `openssl x509` | Ergebnis prüfen |

## Lab-Setup

- Linux-Host mit `openssl`.

## Aufgabe (selbst lösen)

1. Erzeuge in einem Schritt einen **privaten Schlüssel** (RSA-2048 oder EC) **und** ein **self-signed** Zertifikat für `server.lab`, gültig 365 Tage, **mit SAN** `DNS:server.lab`.
2. Prüfe am Ergebnis: Issuer == Subject? Welche Extensions sind gesetzt?
3. Verifiziere das Zertifikat gegen sich selbst (`openssl verify`) und beschreibe die Meldung.
4. Erkläre, warum ein Client trotz gültiger Krypto eine **Warnung** zeigt und wie man das (im Lab) behebt.

**Ziel:** ein korrektes self-signed Zertifikat mit SAN erzeugen und den Trust-Unterschied erklären.

## SY0-701 Prüfungsbezug

- **1.0** Self-signed vs. CA-signed; chain of trust; wann self-signed akzeptabel ist.
- **3.0** Transport-Sicherheit, Trust-Warnungen.
- Begriffe: *self-signed*, *trust store*, *SAN*, *CA-signed*, *third-party trust*.
