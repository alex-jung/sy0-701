# Lösung – Übung 04: WPA2 cracken

## 1. aircrack-ng

```bash
aircrack-ng -w /usr/share/wordlists/rockyou.txt hs-01.cap
```
```
KEY FOUND! [ MeinSchwachesPW123 ]
```
CPU-basiert; Dauer hängt von Wortlistenposition + CPU ab (schwache PSK: Sekunden–Minuten).

## 2. hashcat (Mode 22000)

```bash
hcxpcapngtool -o hs.22000 hs-01.cap
hashcat -m 22000 -a 0 hs.22000 /usr/share/wordlists/rockyou.txt
hashcat -m 22000 hs.22000 --show
```
GPU deutlich schneller (Hunderttausende–Millionen Kandidaten/s vs. CPU). Mode **22000** (neu) ersetzt alt 2500/16800 und deckt Handshake **und** PMKID ab.

## 3. Mit Rule

```bash
hashcat -m 22000 -a 0 hs.22000 small.txt -r /usr/share/hashcat/rules/best64.rule
```
Mutiert Kandidaten (leet/Anhänge) → trifft „komplexe" PSK wie `Sommer2024!`.

## 4. Starke PSK

AP-PSK auf z. B. 20 zufällige Zeichen setzen, Handshake neu capturen, cracken → **kein Treffer** (nicht in Wortliste, Maskenraum zu groß). → Länge/Zufall schlägt alle Wortlisten/Rules.

## 5. SSID als Salt

Der PMK = PBKDF2(passphrase, **SSID**, 4096). Die **SSID geht als Salt ein** → derselbe Pass ergibt bei verschiedenen SSIDs verschiedene PMKs. Generische Rainbow Tables sind nutzlos; **pro SSID** vorbrechnete Tabellen (z. B. für häufige SSIDs wie „linksys") existieren aber → ungewöhnliche SSID + starke PSK.

## Härtung

- **Lange, zufällige PSK** (≥ 16–20 Zeichen), untypische SSID.
- **WPA3-SAE** (kein Offline-Wörterbuch) oder **802.1X/EAP** (Enterprise, Übung 09).

## Häufige Fehler / Troubleshooting

- **aircrack „No valid WPA handshakes":** Handshake unvollständig → erneut capturen (Übung 03), `wpaclean`.
- **hcxpcapngtool fehlt:** `sudo apt install hcxtools`.
- **hashcat ohne GPU:** `--force` (CPU, langsamer).
- **kein Treffer trotz schwacher PSK:** PSK nicht in rockyou → andere Liste/Rules/Maske.
