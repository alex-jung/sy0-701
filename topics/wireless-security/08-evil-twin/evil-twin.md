# Übung 08 – Evil Twin / Rogue AP + Captive Portal

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Evil-Twin-/Rogue-AP-Angriffe verstehen
- Einen gefälschten AP mit identischer ESSID aufsetzen
- Clients per Deauth auf den Evil Twin treiben
- Credentials über ein Captive/Fake-Portal abgreifen (Lab) – und die Abwehr kennen

## Theorie

Ein **Evil Twin** ist ein gefälschter AP mit **gleicher ESSID** (und oft stärkerem Signal) wie das Zielnetz. Clients, die das Netz „kennen", verbinden sich automatisch – besonders bei **offenen** Netzen oder nach Deauth vom echten AP. Der Angreifer kann dann:
- Traffic mitlesen/manipulieren (MITM),
- über ein **Fake-Captive-Portal** die WLAN-/Account-Credentials abgreifen („Bitte WLAN-Passwort erneut eingeben").

**Rogue AP** = allgemein ein unautorisierter AP im Netz (auch intern angeschlossen). Beides zielt auf **fehlende gegenseitige Authentifizierung**. Tools wie **airgeddon**/**wifiphisher**/`hostapd` + `dnsmasq` automatisieren das.

> ⚠️ Nur eigene Test-SSID + eigene Test-Clients. Fake-Portale, die reale Dienste imitieren, nicht gegen Dritte einsetzen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `airgeddon` | Evil-Twin-Workflow (Menü) |
| `hostapd` + `dnsmasq` | manueller Rogue-AP + DHCP/DNS |
| `aireplay-ng` | Clients vom echten AP deauthen |
| (Portal) einfacher Webserver | Captive-Portal-Seite |

## Lab-Setup

- Zwei Interfaces hilfreich (einer AP, einer Deauth). Eigene Test-SSID + Test-Client. Isoliert.

## Aufgabe (selbst lösen)

1. Richte einen **Evil Twin** mit der ESSID deines Test-Netzes ein (airgeddon oder hostapd+dnsmasq).
2. Treibe deinen Test-Client per **Deauth** vom echten AP und beobachte, ob er sich zum Twin verbindet.
3. Serviere ein **Captive/Fake-Portal** und erfasse die (Test-)Eingabe – in einer kontrollierten Lab-Demo.
4. Erkläre, warum **offene** und WPA2-PSK-Netze anfälliger sind als 802.1X/WPA3.
5. Nenne die Gegenmaßnahmen (Server-Zertifikatsprüfung, 802.1X, WPA3, „bekannte Netze" aufräumen, WIDS).

**Ziel:** einen funktionierenden Evil Twin betrieben, einen Test-Client darauf gezogen und das Captive-Portal-Prinzip demonstriert – plus Abwehr.

## SY0-701 Prüfungsbezug

- **Evil Twin / Rogue AP** (Wireless Attacks, 2.0); MITM, Credential Harvesting.
- **Gegenseitige Authentifizierung fehlt** → 802.1X/EAP mit Server-Zert-Prüfung, **WPA3**.
- **WIDS/WIPS**, Rogue-AP-Detection.
- Begriffe: *evil twin*, *rogue access point*, *captive portal*, *MITM*, *802.1X*, *WPA3*.
