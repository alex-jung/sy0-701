# Übung 05 – PMKID-Angriff (clientless)

**Schwierigkeit: 5/10 · Dauer: ca. 45 Min.**

## Lernziele

- Den PMKID-Angriff verstehen (ohne verbundenen Client, ohne Deauth)
- PMKID mit hcxdumptool capturen und konvertieren
- Mit hashcat (22000) cracken
- Abgrenzung PMKID vs. 4-Way-Handshake

## Theorie

Der **PMKID-Angriff** (2018) braucht **keinen verbundenen Client** und **keine Deauth**. Manche APs senden die **PMKID** bereits in der **ersten Handshake-Nachricht** (RSN-IE), wenn man eine Assoziation anfragt. Die PMKID = HMAC-SHA1(PMK, "PMK Name" + AP-MAC + STA-MAC) – daraus lässt sich die PSK offline genauso raten wie beim Handshake.

Vorteile für den Angreifer: **leiser** (kein Deauth), funktioniert auch ohne aktive Clients. Nicht alle APs sind anfällig (abhängig von Firmware/Roaming-Features).

## Verwendete Tools

| Tool | Zweck | Optionen |
|------|-------|----------|
| `hcxdumptool` | PMKID capturen | `-i <iface> --enable_status` / Filter auf BSSID |
| `hcxpcapngtool` | → 22000-Format | `-o hash.22000 <pcapng>` |
| `hashcat` | cracken | `-m 22000` |

## Lab-Setup

- Monitor-Interface + eigener Test-AP (idealerweise einer, der PMKID sendet). `rockyou.txt`.

## Aufgabe (selbst lösen)

1. Capture die **PMKID** deines Test-APs mit hcxdumptool – **ohne** Client/Deauth.
2. Konvertiere den Capture ins 22000-Format und prüfe, ob eine PMKID enthalten ist.
3. Cracke die PMKID mit hashcat + rockyou.
4. Vergleiche Aufwand/Lautstärke mit dem Handshake-Angriff (Übung 03/04).
5. Erkläre, warum nicht jeder AP anfällig ist und wie man es verhindert.

**Ziel:** die PSK deines Test-APs über PMKID (clientless) gewonnen und gegen den Handshake-Weg abgegrenzt.

## SY0-701 Prüfungsbezug

- **PMKID-Attack** als moderne WLAN-Bedrohung (clientless, leise).
- **Mitigation:** starke PSK, PMKID/Roaming-Feature deaktivieren wo möglich, **WPA3**.
- Begriffe: *PMKID attack*, *WPA2-PSK*, *RSN IE*, *offline cracking*, *WPA3*.
