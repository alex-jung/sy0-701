# Lösung – Übung 08: Verschlüsselter Traffic (TLS)

## 1. TLS-Handshake

```
tls.handshake.type == 1      # ClientHello
tls.handshake.type == 2      # ServerHello
tls.handshake.type == 11     # Certificate
```
Im **ClientHello**: `tls.handshake.extensions_server_name` = **SNI** (Zielhostname). Im **Certificate**: Issuer/Subject (CN), Gültigkeit → self-signed/kurzlebig/ungewöhnlicher CN = verdächtig.

## 2. JA3

Wireshark zeigt `tls.handshake.ja3`/`ja3_full` (ggf. via Profil/Spalte). **JA3** hasht die ClientHello-Parameter → identifiziert **Client/Tool** unabhängig von IP/Port. Nutzen: ein C2-Tool hat oft einen charakteristischen JA3 → Erkennung/Blocklisten, auch bei wechselnder IP.

## 3. Payload verschlüsselt, Metadaten sichtbar

```
tls.record.content_type == 23     # Application Data -> unlesbar
```
Der Inhalt ist nicht rekonstruierbar (Export Objects/Credentials liefern nichts). **Sichtbar** bleiben: SNI, Zert, JA3, Paketgrößen/Timing → **Beaconing** (Statistics/IO-Graph wie Übung 07).

## 4. Eigenen Traffic entschlüsseln (Key Log)

```bash
export SSLKEYLOGFILE=~/sslkeys.log
firefox &        # bzw. curl --keylogfile; Client mit dieser Var starten
```
Wireshark: **Preferences → Protocols → TLS → (Pre)-Master-Secret log filename** = `~/sslkeys.log`. Danach wird **eigener** HTTPS-Traffic entschlüsselt angezeigt (HTTP im TLS lesbar). Geht nur mit **eigenem** Schlüsselmaterial.

## 5. TLS-C2 erkennen + Grenzen

Erkennung ohne Entschlüsselung: **JA3** (C2-Tool), **SNI**/Zielhäufigkeit, **Beaconing** (regelmäßige, gleich große Flows), ungewöhnliches/self-signed **Zertifikat**. Grenzen: Inhalt bleibt verborgen; echte Inhaltsprüfung braucht **TLS-Inspection** (MITM-Proxy mit eigener CA) – mit Datenschutz-/Vertrauens-Implikationen und teils umgangen (Cert Pinning, DoH).

## Härtung/Detection

JA3-Feeds + Beaconing-Analytics (Zeek, `ids-ips` 09), TLS-Inspection am Perimeter wo zulässig, Zertifikats-Monitoring.

## Häufige Fehler / Troubleshooting

- **Entschlüsselung klappt nicht:** Key-Log-Pfad/Preference falsch, Client nicht mit `SSLKEYLOGFILE` gestartet, TLS 1.3 braucht die richtigen Secrets.
- **Kein JA3-Feld:** Spalte/Profil ergänzen oder tshark-Feld `tls.handshake.ja3`.
- **Server-Key statt Key-Log:** nur bei RSA-Key-Exchange nutzbar; moderne PFS-Ciphers brauchen das Key-Log.
- **Fremden Traffic entschlüsseln:** ohne Schlüssel nicht möglich (und nicht erlaubt) – nur eigener.
