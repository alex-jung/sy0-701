# Übung 03 – Eigene Root-CA aufbauen

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Eine eigene Root-CA (Schlüssel + CA-Zertifikat) erstellen
- Die CA-Verzeichnisstruktur und das Vertrauensmodell verstehen
- Den CA-Private-Key als „Kronjuwel" absichern

## Theorie

Eine **Certificate Authority (CA)** ist die vertrauenswürdige Instanz, die Zertifikate signiert. Die **Root-CA** steht an der Spitze der Trust Chain; ihr Zertifikat ist **self-signed**, wird aber **bewusst** in den Trust Store aufgenommen (im Lab einmalig). Alles, was die CA signiert, wird dann automatisch vertraut.

Der **CA-Private-Key** ist extrem sensibel: Wer ihn hat, kann **beliebige** Zertifikate (für jeden Namen) ausstellen. Daher: offline/geschützt halten, Passphrase, möglichst nur eine **Intermediate-CA** fürs Tagesgeschäft signieren lassen (Übung 06), die Root bleibt offline. Eine CA braucht Verwaltungsdateien: `index.txt` (ausgestellte Zerts), `serial` (fortlaufende Seriennummern), ein `openssl.cnf` mit CA-Policy.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl genpkey`/`req` | CA-Key + self-signed CA-Zertifikat |
| `openssl.cnf` | CA-Policy/Verzeichnisstruktur |

## Lab-Setup

- Linux-Host mit `openssl`. Eigenes CA-Verzeichnis (z. B. `~/lab-ca`).

## Aufgabe (selbst lösen)

1. Lege eine CA-Verzeichnisstruktur an (`private/`, `certs/`, `newcerts/`, `index.txt`, `serial`).
2. Erzeuge einen **CA-Private-Key** (RSA-4096 oder EC, **mit Passphrase**) und ein **self-signed CA-Zertifikat** mit `basicConstraints=CA:TRUE` und passender Key Usage (`keyCertSign, cRLSign`), Laufzeit z. B. 10 Jahre.
3. Prüfe am CA-Zertifikat, dass `CA:TRUE` gesetzt ist und Subject==Issuer (Root).
4. Beschreibe konkret, wie du den **CA-Key** absicherst (Rechte, Passphrase, Offline) und warum.

**Ziel:** eine funktionsfähige, abgesicherte Root-CA, deren Zertifikat als Trust-Anker dient (Grundlage für Übungen 04–10).

## SY0-701 Prüfungsbezug

- **1.0** CA, root of trust, self-signed root, CA key protection; PKI-Hierarchie.
- **3.0** Trust model; offline root/online intermediate.
- Begriffe: *root CA*, *basic constraints (CA:TRUE)*, *keyCertSign*, *CA key compromise*, *trust anchor*.
