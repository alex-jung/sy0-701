# Übung 03 – WireGuard Remote-Access über OPNsense

**Schwierigkeit: 3/10 · Dauer: ca. 70 Min.**

## Lernziele

- WireGuard als Remote-Access-Gateway auf OPNsense einrichten
- Einen Road-Warrior-Client ins Lab-Netz bringen
- Firewall-Regeln und NAT/Routing für das Tunnel-Netz setzen

## Theorie

Beim **Remote-Access** (Road Warrior) verbindet sich ein einzelner Client ins Lab-Netz. OPNsense (Plugin `os-wireguard`) agiert als **Server/Gateway**: es hat ein eigenes Keypair, ein Tunnel-Subnetz (z. B. `10.10.0.0/24`), und für jeden Client einen **Peer** mit dessen Public Key + einer festen Tunnel-IP. Zusätzlich braucht es:

- eine **Firewall-Regel** auf dem WireGuard-Interface/WAN (UDP-Port rein, dann wer ins LAN darf),
- **Routing/NAT**, damit Tunnel-Clients das Lab erreichen (und Antworten zurückfinden),
- bewusste `AllowedIPs` am Client (Split vs. Full Tunnel, Übung 06).

So wird aus dem Internet-Client ein vollwertiger Lab-Teilnehmer – kontrolliert durch Firewall-Regeln (Least Privilege, nur nötige Ziele).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense (`os-wireguard`) | VPN-Gateway (GUI) |
| `wg`/App | Client-Konfiguration |
| OPNsense Firewall/NAT | Zugriff/Routing steuern |

## Lab-Setup

- OPNsense mit WireGuard-Plugin; ein Client (Kali/Handy) „von außen"; ein Ziel im LAN (z. B. ein Server).

## Aufgabe (selbst lösen)

1. Richte auf OPNsense einen WireGuard-**Server** (Instance) mit Tunnel-Netz `10.10.0.0/24` ein.
2. Lege einen **Client-Peer** an (Public Key, Tunnel-IP `10.10.0.2`) und erzeuge die Client-Config/QR.
3. Setze die nötige **Firewall-Regel** (UDP-Port auf WAN) und erlaube dem Tunnel gezielt den Zugriff auf **ein** LAN-Ziel.
4. Verbinde den Client, pinge das LAN-Ziel durch den Tunnel und prüfe den Handshake in der OPNsense-GUI.

**Ziel:** ein Road-Warrior-Client erreicht über WireGuard/OPNsense kontrolliert ein internes Lab-Ziel.

## SY0-701 Prüfungsbezug

- **3.0/4.0** secure remote access, VPN-Gateway, Firewall-Regeln, Least-Privilege-Zugriff.
- Begriffe: *road warrior*, *VPN gateway*, *peer*, *AllowedIPs*, *firewall rule*, *NAT/routing*.
