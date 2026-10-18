# Lösung – Übung 10: Hardening-Projekt

Beispiel: eine Linux-VM end-to-end härten. `hardening-report-template.md` ist das Gerüst. Snapshots!

## 1. Baseline (Vorher)

```bash
sudo lynis audit system | grep "Hardening index"     # z.B. 56/100
nmap -sS -sV -p- <VM> -oN before_ports.txt
# Vuln-Scan (Greenbone/nmap --script vuln) -> CVE-Zahl notieren
```

## 2. Härten

Bereiche aus Übung 03–06 (bzw. 07/09) umsetzen: SSH (key-only/fail2ban), unnötige Dienste entfernen, Accounts/Policy/MFA/sudo, Kernel/sysctl/SUID/Mounts. Jeweils testen (Snapshot!).

## 3. Automatisieren (Ansible-Skizze)

```yaml
# hardening.yml (Auszug)
- hosts: lab
  become: true
  tasks:
    - name: SSH härten
      lineinfile: { path: /etc/ssh/sshd_config, regexp: '^PermitRootLogin', line: 'PermitRootLogin no' }
    - name: unnötige Dienste entfernen
      apt: { name: [telnetd, vsftpd, rpcbind], state: absent }
    - name: sysctl-Härtung
      copy: { src: 99-hardening.conf, dest: /etc/sysctl.d/99-hardening.conf }
      notify: sysctl reload
```
```bash
ansible-playbook -i inv hardening.yml       # reproduzierbar, gegen Drift erneut ausführbar
```

## 4. Nachher

```bash
sudo lynis audit system | grep "Hardening index"     # z.B. 82/100 (↑)
nmap -sS -sV -p- <VM> -oN after_ports.txt
diff <(grep open before_ports.txt) <(grep open after_ports.txt)   # weniger Ports
```

## 5. Gegenprobe + Report

```bash
hydra -l user -P rockyou.txt <VM> ssh        # vorher evtl. erfolgreich -> jetzt chancenlos
```
Ein vorher erfolgreicher Angriff (Brute-Force / Dienst-Exploit) scheitert jetzt. `hardening-report-template.md` ausfüllen: Vorher/Nachher-Metriken, Maßnahmen, Automatisierung, Rest-Risiko/Ausnahmen.

## Kernaussagen (Prüfung)

- Hardening ist **messbar** (Index/Ports/CVEs vorher/nachher) und **reproduzierbar** (IaC/CM gegen Drift).
- Jede Maßnahme schließt einen konkreten Angriffsvektor aus den offensiven Themen.
- **Rest-Risiko dokumentieren** (was bewusst offen bleibt + kompensierende Kontrolle).

## Häufige Fehler / Troubleshooting

- **Kein Vorher-Wert:** ohne Baseline kein Fortschrittsnachweis.
- **Manuell statt CM:** nicht reproduzierbar, Drift → Ansible/Skript.
- **Dienst/Zugang gebrochen:** Snapshot + schrittweise testen.
- **Report ohne Belege:** Scan-/Audit-Outputs beilegen.
