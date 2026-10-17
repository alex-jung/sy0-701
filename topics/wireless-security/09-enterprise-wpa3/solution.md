# Lösung – Übung 09: WPA-Enterprise & WPA3

## 1. Personal vs. Enterprise

- **Personal (PSK):** eine gemeinsame Passphrase für alle → kompromittiert = alle betroffen; keine Nutzer-Identität.
- **Enterprise (802.1X/EAP):** RADIUS-Server, **individuelle** Authentifizierung (Nutzer/Passwort oder Zertifikat), zentral sperrbar, Accounting.
- EAP-Methoden: **EAP-TLS** (beidseitige Zerts), **PEAP** (MSCHAPv2 im TLS-Tunnel), **EAP-TTLS** (diverse innere Methoden).

## 2. Enterprise-Evil-Twin (hostapd-wpe)

```bash
sudo hostapd-wpe hostapd-wpe.conf      # fälscht RADIUS + AP mit Ziel-ESSID
```
Validiert der Client das **Server-Zertifikat nicht**, baut er den EAP/PEAP-Tunnel zum **gefälschten** RADIUS auf und sendet seinen **MSCHAPv2 Challenge/Response** (= Benutzer + abgeleiteter NT-Hash-Response). hostapd-wpe loggt diesen → offline crackbar. Ursache: **fehlende Server-Authentifizierung** auf Client-Seite.

## 3. MSCHAPv2 cracken

```bash
# aus dem hostapd-wpe-Log: username + challenge + response
asleap -C <challenge> -R <response> -W /usr/share/wordlists/rockyou.txt
# oder hashcat (NetNTLMv1-artig):
hashcat -m 5500 mschap.hash /usr/share/wordlists/rockyou.txt
```
→ Klartext-Passwort des (Test-)Nutzers.

## 4. WPA3-SAE resistent

WPA2-PSK erlaubt **capture-and-crack** (Handshake/PMKID offline raten). **WPA3-SAE (Dragonfly)** nutzt einen **PAKE** (Password Authenticated Key Exchange): aus einem passiven Capture lässt sich **kein** Offline-Wörterbuchangriff fahren; jeder Rateversuch erfordert eine **aktive** Interaktion mit dem AP (ratelimitierbar). Zudem **Forward Secrecy** und erzwungenes **PMF**. (Historisch: „Dragonblood"-Seitenkanäle/Downgrade im Transition-Mode.)

## 5. Zentrale Härtung

**Server-Zertifikatsvalidierung erzwingen** (Client akzeptiert nur den echten RADIUS mit definierter CA/Servername) → Enterprise-Evil-Twin scheitert. Besser noch **EAP-TLS** (keine Passwörter). Für Personal: **WPA3** statt WPA2.

## Häufige Fehler / Troubleshooting

- **Kein Lab/Hardware:** konzeptionell durchspielen; `hashcat -m 5500` an Beispiel-Challenge üben.
- **Client verbindet nicht zum WPE:** ESSID/Kanal/Signal; Client hat Server-Validierung an (gut gehärtet) → Angriff scheitert (= Lerneffekt).
- **WPA3-Adapterprobleme:** aktuelle Treiber/`iw`-Unterstützung nötig.
- **asleap/hashcat-Format:** Challenge/Response exakt aus dem Log übernehmen.
