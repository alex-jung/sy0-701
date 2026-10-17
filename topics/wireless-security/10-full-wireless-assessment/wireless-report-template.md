# Wireless Security Assessment Report – <WLAN/Scope>

**Tester:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: welches WLAN, größte Schwächen, ob die PSK fiel, Top-Härtung.>

**Gesamtbewertung:** 🔴 / 🟡 / 🟢

---

## 2. Scope & Methodik

- **Ziel-SSID(s)/BSSID(s):** <…> · **Autorisierung:** eigenes Test-WLAN
- **Adapter/Tools:** aircrack-ng, hcxtools, reaver, airgeddon, hashcat, wifite
- **Einschränkungen:** Deauth minimal, nur eigene Clients

---

## 3. Erfassung

| SSID | BSSID | CH | Verschlüsselung | PMF | WPS | WPA3 |
|------|-------|----|-----------------|-----|-----|------|
| MeinTestAP | AA:.. | 6 | WPA2-PSK/CCMP | nein | an | nein |

---

## 4. Findings

| # | Finding | Nachweis | Risiko |
|---|---------|----------|--------|
| 1 | Schwache PSK (in rockyou) | Handshake in X min gecrackt | 🔴 |
| 2 | WPS aktiviert (pixie-anfällig) | PSK via reaver `-K` | 🔴 |
| 3 | Kein PMF (802.11w) | Deauth-DoS wirksam | 🟠 |
| 4 | Evil-Twin-anfällig (PSK/offen) | Client zog auf Twin | 🟠 |
| 5 | Kein WPA3 | nur WPA2 | 🟡 |

---

## 5. Härtung (priorisiert)

| Prio | Finding | Maßnahme |
|------|---------|----------|
| P1 | schwache PSK | lange, zufällige Passphrase (≥16–20) |
| P1 | WPS | WPS deaktivieren |
| P2 | kein PMF | 802.11w (PMF) aktivieren / WPA3 |
| P2 | Evil Twin | WPA3 / 802.1X mit Server-Zert-Validierung |
| P3 | Monitoring | WIDS/WIPS, Rogue-AP-Detection |

---

## 6. Anhang

- Captures (.cap/.pcapng/.22000), verwendete Befehle, Tool-Versionen, AP-Konfigurationen
