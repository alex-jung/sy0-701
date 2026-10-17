# hcxdumptool / hcxtools

**Kategorie:** WLAN – PMKID/Handshake-Capture & Konvertierung

**hcxdumptool** capturet WLAN-Material (v. a. **PMKID**, auch Handshakes) – teils **clientless** (ohne verbundenen Client, ohne Deauth). **hcxtools** (u. a. `hcxpcapngtool`) konvertiert Captures ins **hashcat-Format 22000**.

```bash
sudo hcxdumptool -i wlan0mon -w capture.pcapng --enable_status=1
hcxpcapngtool -o hash.22000 capture.pcapng
hashcat -m 22000 hash.22000 rockyou.txt
```

## Wichtigste Optionen

| Tool/Option | Bedeutung |
|-------------|-----------|
| `hcxdumptool -i <iface>` | Capture-Interface (Monitor) |
| `-w <datei>` | Ausgabe (pcapng) |
| `--enable_status=1` | Statusanzeige (PMKID/Handshake) |
| `--filterlist_ap` / `--filtermode` | auf eigene BSSID beschränken |
| `hcxpcapngtool -o <22000>` | → hashcat-Format |
| (22000) `WPA*01*` / `WPA*02*` | PMKID / Handshake |

## Hinweis

Nur **eigenen** AP filtern/capturen. Ersetzt ältere Formate (2500/16800) durch **22000** (PMKID + Handshake vereint). Installation: `sudo apt install hcxdumptool hcxtools`. Optionsnamen variieren je Version → `--help`.

## Verwendet in

wireless-security 04 (Konvertierung), 05 (PMKID), 10.
