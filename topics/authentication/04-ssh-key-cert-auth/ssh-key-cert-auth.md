# Übung 04 – SSH Key-based & Certificate-based Auth

**Schwierigkeit: 4/10 · Dauer: ca. 65 Min.**

## Lernziele

- Public-Key-Authentifizierung für SSH einrichten und absichern
- SSH-**Zertifikate** (CA-signiert) verstehen und einsetzen
- Vorteile ggü. Passwörtern/rohen Keys bewerten (Skalierung, Ablauf)

## Theorie

SSH-**Public-Key-Auth** ersetzt das Passwort durch ein Schlüsselpaar: der Public Key liegt in `~/.ssh/authorized_keys` des Servers, der Client beweist Besitz des Private Keys per Signatur (Challenge-Response) – ein „have"-Faktor. Deutlich stärker als Passwörter (kein Brute-Force über das Netz), der Private Key sollte mit **Passphrase** geschützt sein.

Problem bei vielen Hosts: `authorized_keys` überall pflegen/widerrufen ist mühsam. **SSH-Zertifikate** lösen das wie eine Mini-PKI: eine **SSH-CA** signiert User- (und Host-)Keys; Server vertrauen der **CA** (`TrustedUserCAKeys`) statt einzelner Keys. Zertifikate haben **Gültigkeit** (Ablauf statt manuellem Widerruf), **Principals** (welche User/Rollen) und optional Restriktionen. Host-Zertifikate beenden zudem das „unknown host key"-Warnungsproblem.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `ssh-keygen` | Keys erzeugen, als CA signieren |
| `sshd_config` | Key-/Cert-Trust konfigurieren |
| `ssh-add`/agent | Private Keys verwalten |

## Lab-Setup

- Zwei Linux-Hosts (oder localhost + VM): einer als SSH-Server, einer als Client/CA.

## Aufgabe (selbst lösen)

1. Richte **Public-Key-Auth** ein (Key mit Passphrase, in `authorized_keys`), deaktiviere Passwort-Login und teste.
2. Erzeuge eine **SSH-User-CA**, signiere deinen User-Key zu einem **Zertifikat** mit Principal + kurzer Gültigkeit und konfiguriere den Server, der **CA** zu vertrauen.
3. Logge dich per Zertifikat ein (ohne den Public Key im `authorized_keys`) und zeige, dass es über die CA funktioniert.
4. Erstelle zusätzlich ein **Host-Zertifikat** und erkläre, wie es die „unknown host key"-Warnung löst.

**Ziel:** passwortloser SSH-Login per Key **und** per CA-Zertifikat (mit Ablauf/Principals), inkl. Host-Cert-Verständnis.

## SY0-701 Prüfungsbezug

- **1.0/3.0** certificate-based authentication, key management, SSH CA; „something you have".
- Vorteil: Ablauf/Principals statt manuellem Key-Widerruf; Skalierung.
- Begriffe: *public key auth*, *SSH certificate*, *CA*, *principals*, *host certificate*, *passphrase/agent*.
