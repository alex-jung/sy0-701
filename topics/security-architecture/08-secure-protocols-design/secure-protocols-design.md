# Übung 08 – Secure Protocols & Design-Entscheidungen

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- Unsichere Protokolle durch sichere Pendants ersetzen
- Protokoll-Design-Entscheidungen begründen (Port/Verschlüsselung/Auth)
- Secure-Protocol-Auswahl in eine Architektur einbetten

## Theorie

Architektur legt fest, **welche Protokolle** wo laufen. Grundregel: **verschlüsselt + authentifiziert** statt Klartext. Sichere Pendants (SY0-701):

| Unsicher | Sicher |
|----------|--------|
| HTTP | **HTTPS (TLS)** |
| FTP/FTPS? | **SFTP/FTPS** |
| Telnet | **SSH** |
| SNMPv1/2c | **SNMPv3** |
| LDAP | **LDAPS/StartTLS** |
| DNS | **DNSSEC** (Integrität) / **DoH/DoT** (Vertraulichkeit) |
| SMTP (Klartext) | **SMTPS/STARTTLS** |
| NTP | **NTS** (Network Time Security) |
| POP3/IMAP | **POP3S/IMAPS** |
| RDP ohne TLS | **RDP mit TLS/NLA** |

Design-Dimensionen: **Vertraulichkeit** (TLS/VPN), **Integrität/Authentizität** (Signatur/DNSSEC), **Protokoll-Version/Cipher** (nur TLS 1.2/1.3, AEAD, PFS – `cryptography-basics`/`pki-certificates`), **Port/Exposure**, **Auth** (Zert/mTLS). Außerdem: unnötige Protokolle **abschalten** (Attack-Surface-Reduction) und Legacy nur isoliert (compensating control).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| nmap/testssl (Bezug) | Protokolle/Versionen prüfen |
| Diagramm/Tabelle | Protokoll-Zielbild |

## Lab-Setup

- Dein Lab (Dienste/Protokolle) als Objekt; optional Scan zur Ist-Aufnahme.

## Aufgabe (selbst lösen)

1. Nimm die in deinem Lab genutzten Protokolle auf (Ist) und markiere unsichere.
2. Erstelle ein **Zielbild**: unsichere Protokolle → sichere Pendants, je mit Begründung (was wird dadurch geschützt).
3. Treffe drei konkrete **Design-Entscheidungen** (z. B. „Management nur SSH/HTTPS, SNMPv3, DNS via DoT nach extern") und begründe Port/Verschlüsselung/Auth.
4. Benenne, welche Protokolle du **abschaltest** (Surface-Reduction) und wie du Legacy behandelst.

**Ziel:** ein sicheres Protokoll-Zielbild fürs Lab mit begründeten Design-Entscheidungen und Surface-Reduction.

## SY0-701 Prüfungsbezug

- **3.0** secure protocols (HTTPS/SSH/SFTP/SNMPv3/LDAPS/DNSSEC/DoT-DoH/NTS), protocol selection, transport encryption, port/service hardening.
- Begriffe: *secure protocol pairs*, *TLS 1.2/1.3/AEAD/PFS*, *SNMPv3*, *LDAPS*, *DNSSEC/DoH/DoT*, *mTLS*, *surface reduction*.
