# Übung 07 – Angriffe im Traffic erkennen

**Schwierigkeit: 7/10 · Dauer: ca. 70 Min.**

## Lernziele

- Angriffe aus den offensiven Themen im Paket-Capture wiedererkennen
- Scan-Typen, Brute-Force, Exploits und C2/Beaconing an Traffic-Mustern identifizieren
- Indikatoren (IoCs) aus Paketen ableiten
- Die Capture-Sicht mit IDS/SIEM verknüpfen

## Theorie

Jede Angriffsphase hinterlässt ein **Traffic-Muster**:
- **Portscan:** viele SYN von einer Quelle an viele Ports in kurzer Zeit; SYN-Scan = kein vollständiger Handshake; `RST`/`SYN,ACK` je nach Port-Status (vgl. `network-scanning`).
- **Brute-Force:** viele kurze Verbindungen/Logins zu einem Dienst (SSH/FTP/HTTP-POST) von einer Quelle.
- **Exploit:** ungewöhnliche Payloads/Protokoll-Abweichungen, bekannte Strings (z. B. Backdoor-Trigger), überlange Felder.
- **C2/Beaconing:** regelmäßige, gleich große Outbound-Verbindungen zu einem Ziel (feste Intervalle + Jitter), oft HTTP/HTTPS.
- **Exfiltration:** große/ungewöhnliche Outbound-Transfers, DNS-Tunneling (Übung 05).

Capture-Analyse ist die **tiefste** Sicht (Ground Truth) – ergänzt IDS (Signaturen, `ids-ips`) und SIEM (Korrelation, `logging-siem`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark (Filter/Statistics/IO-Graph) | Muster erkennen |
| eigene Angriffs-Captures | Testmaterial |

## Lab-Setup

- Captures der eigenen Angriffe (Scan/Brute-Force/Exploit/C2) aus den offensiven Themen – oder live mitschneiden, während Kali angreift.

## Aufgabe (selbst lösen)

1. Erkenne einen **Portscan** im Capture: welche Flags/Muster, wie viele Ziele/Ports, Timing?
2. Erkenne einen **Brute-Force** (z. B. SSH/HTTP-POST): wie sieht das Muster aus?
3. Finde einen **Exploit** (z. B. vsftpd-Backdoor/Samba): welche Pakete/Strings verraten ihn?
4. Erkenne **C2-Beaconing** über den **IO-Graph/Conversations**: regelmäßige Verbindungen zu einem Ziel.
5. Leite aus jedem Fund **IoCs** ab (IP/Port/Pattern) und verknüpfe mit IDS/SIEM.

**Ziel:** vier Angriffsmuster (Scan, Brute-Force, Exploit, C2) im Capture identifiziert und als IoCs dokumentiert.

## SY0-701 Prüfungsbezug

- **Netzwerkbasierte Angriffserkennung**, Traffic-Muster je Kill-Chain-Phase, **IoCs**.
- Zusammenspiel Capture ↔ **IDS/IPS** ↔ **SIEM**; Grenzen bei Verschlüsselung (Übung 08).
- Begriffe: *port scan*, *brute force*, *exploit traffic*, *beaconing/C2*, *IoC*, *kill chain*.
