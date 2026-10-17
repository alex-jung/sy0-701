# Übung 09 – WPA-Enterprise (EAP) & WPA3

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- WPA2/3-Enterprise (802.1X/EAP) vs. Personal (PSK) unterscheiden
- EAP-Methoden einordnen (PEAP, EAP-TLS, EAP-TTLS) und deren Schwächen
- Einen Enterprise-Evil-Twin zum Abgreifen von MSCHAPv2-Credentials verstehen
- WPA3 (SAE/Dragonfly) und seine Vorteile/Grenzen kennen

## Theorie

**WPA2/3-Enterprise** nutzt **802.1X/EAP** mit einem **RADIUS-Server** statt einer gemeinsamen PSK → jeder Nutzer authentifiziert sich individuell (Benutzer/Passwort oder Zertifikat).

EAP-Methoden:
- **EAP-TLS:** beidseitige Zertifikate – am sichersten (kein Passwort).
- **PEAP/EAP-TTLS (MSCHAPv2):** Nutzer/Passwort in einem TLS-Tunnel. **Schwäche:** validiert der Client das **RADIUS-Server-Zertifikat nicht**, kann ein **Enterprise-Evil-Twin** (`hostapd-wpe`) den MSCHAPv2-Challenge/Response abgreifen → offline crackbar.

**WPA3-Personal** ersetzt den PSK-Handshake durch **SAE (Dragonfly)** → **resistent gegen Offline-Wörterbuch** (kein capture-and-crack wie WPA2) und Forward Secrecy; erzwingt **PMF**. Angriffe: Downgrade (WPA3-Transition) und „Dragonblood"-Seitenkanäle (historisch).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `hostapd-wpe` | Enterprise-Evil-Twin (MSCHAPv2 abgreifen) |
| `asleap`/`hashcat` | MSCHAPv2 cracken (Mode 5500) |
| `freeradius` | eigener RADIUS fürs Lab |

## Lab-Setup

- Für Enterprise: ein 802.1X-Test-Setup (freeradius + Test-User) **oder** konzeptionell.
- Für WPA3: ein WPA3-fähiger Test-AP. Entsprechende Adapter/Treiber.

## Aufgabe (selbst lösen)

1. Erkläre den Unterschied **Personal (PSK)** vs. **Enterprise (802.1X/EAP)** und nenne drei EAP-Methoden.
2. Beschreibe/demonstriere den **Enterprise-Evil-Twin** (`hostapd-wpe`): wie landet ein MSCHAPv2-Hash beim Angreifer, und warum?
3. Cracke einen (Lab-)MSCHAPv2-Challenge/Response (`hashcat -m 5500` / `asleap`).
4. Erkläre, warum **WPA3-SAE** gegen das WPA2-Capture-and-Crack (Übung 03–05) resistent ist.
5. Nenne die zentrale Härtung gegen den Enterprise-Evil-Twin.

**Ziel:** Enterprise-vs-Personal und EAP-Schwächen verstanden, einen MSCHAPv2-Hash (Lab) geknackt und WPA3-SAE eingeordnet.

## SY0-701 Prüfungsbezug

- **WPA2/3-Enterprise, 802.1X, EAP (PEAP/EAP-TLS/TTLS)**, RADIUS.
- **Server-Zertifikatsvalidierung** als Schlüssel-Mitigation; **EAP-TLS** stärkste Methode.
- **WPA3/SAE**, PMF, Transition-Mode-Downgrade.
- Begriffe: *802.1X/EAP*, *RADIUS*, *PEAP/EAP-TLS/MSCHAPv2*, *WPA3-SAE*, *PMF*.
