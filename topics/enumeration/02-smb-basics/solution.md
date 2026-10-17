# Lösung – Übung 02: SMB Basics

`<ZIEL>` = Metasploitable-IP.

## 1. Shares anonym auflisten (Null Session)

```bash
smbclient -L //<ZIEL>/ -N
# -L = Shares listen, -N = kein Passwort (anonym)
```
Beispiel:
```
Sharename       Type      Comment
---------       ----      -------
print$          Disk      Printer Drivers
tmp             Disk      oh noes!
opt             Disk
IPC$            IPC       IPC Service (metasploitable server ...)
ADMIN$          IPC       IPC Service ...
```

## 2. Berechtigungen mit smbmap

```bash
smbmap -H <ZIEL> -u '' -p ''
```
```
Disk      Permissions
----      -----------
tmp       READ, WRITE
opt       NO ACCESS
IPC$      READ ONLY
print$    NO ACCESS
```
→ `tmp` ist **lesbar und beschreibbar** (= besonders kritisch).

## 3. Auf Share zugreifen + Datei holen

```bash
smbclient //<ZIEL>/tmp -N
smb: \> ls
smb: \> get <datei> /home/kali/<datei>
smb: \> exit
# oder rekursiv alles anschauen:
smbmap -H <ZIEL> -u '' -p '' -r tmp
```

## 4. SMB-Version/Dialekt

```bash
nmap -p139,445 --script smb-protocols,smb2-security-mode <ZIEL>
```
Zeigt unterstützte Dialekte (bei Metasploitable 2 u. a. **SMBv1/NT LM 0.12**) und ob Signing erzwungen wird. SMBv1 = veraltet/unsicher.

## 5. Gefahr & Gegenmaßnahmen

- **Null Session** gibt einem nicht authentifizierten Angreifer Einblick in Shares, oft auch User/Policies (Übung 06) → Grundlage für weitere Angriffe. Beschreibbare anonyme Shares erlauben sogar das **Ablegen von Dateien** (Payloads).
- Gegenmaßnahmen:
  - Anonyme Zugriffe verbieten (Samba: `restrict anonymous = 2`, `map to guest = Never`; Windows: `RestrictAnonymous`).
  - **SMBv1 deaktivieren**, SMB-Signing erzwingen.
  - Share-Berechtigungen nach **least privilege**, keine weltweit beschreibbaren Shares.

## Häufige Fehler / Troubleshooting

- **`protocol negotiation failed`:** moderner smbclient lehnt SMBv1 ab → `--option='client min protocol=NT1'` anhängen.
- **`-N` wird ignoriert / fragt Passwort:** leeres Passwort mit Enter bestätigen oder `-U '%'`.
- **smbmap „NO ACCESS" überall:** Ziel erlaubt keine Null Session (gut gehärtet) – dann mit Creds (Übung 06) testen.
- **Tools fehlen:** `sudo apt install smbclient smbmap`.
