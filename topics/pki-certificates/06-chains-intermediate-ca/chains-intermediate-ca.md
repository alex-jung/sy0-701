# Übung 06 – Certificate Chains & Intermediate CA

**Schwierigkeit: 6/10 · Dauer: ca. 75 Min.**

## Lernziele

- Eine Intermediate-CA erzeugen und von der Root signieren lassen
- Server-Zertifikate über die Intermediate ausstellen
- Die vollständige Chain (fullchain) korrekt bauen und verifizieren

## Theorie

In echten PKIs signiert die **Root-CA nicht direkt** Server-Zertifikate. Stattdessen signiert sie **einmal** eine **Intermediate-CA**, die dann das Tagesgeschäft übernimmt. Vorteile: Die **Root bleibt offline** (geschützt); wird die Intermediate kompromittiert, kann man sie widerrufen, ohne den Root-Trust-Anker neu verteilen zu müssen. Ergebnis ist eine **Kette**: `Leaf → Intermediate → Root`.

Damit Clients die Kette bilden können, muss der Server **Leaf + Intermediate** senden (die **fullchain**) – die Root liegt bereits im Trust Store und wird **nicht** mitgeschickt. Fehlt die Intermediate, scheitert die Validierung („unable to get local issuer"). Die Intermediate braucht `CA:TRUE` **mit** `pathlen:0` (darf selbst keine weiteren CAs ausstellen).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl req/ca/x509` | Intermediate erstellen/signieren, Leafs ausstellen |
| `openssl verify -untrusted` | Kette mit Intermediate prüfen |

## Lab-Setup

- Root-CA aus Übung 03. `openssl`.

## Aufgabe (selbst lösen)

1. Erzeuge eine **Intermediate-CA** (eigener Key + CSR) und lasse sie von der **Root** signieren – mit `basicConstraints=CA:TRUE,pathlen:0` und `keyCertSign,cRLSign`.
2. Stelle ein neues **Server-Zertifikat** aus, das von der **Intermediate** (nicht der Root) signiert ist.
3. Baue die **fullchain** (`server + intermediate`) und verifiziere das Server-Zertifikat korrekt gegen Root (+ untrusted Intermediate).
4. Zeige den Unterschied: Verifikation **ohne** Intermediate schlägt fehl, **mit** gelingt sie.

**Ziel:** eine dreistufige PKI (Root→Intermediate→Leaf) mit korrekt gebildeter und verifizierter Chain.

## SY0-701 Prüfungsbezug

- **1.0** Certificate chain, intermediate CA, path length, offline root; chain of trust.
- **3.0** PKI-Hierarchie, Kompromittierungs-Resilienz.
- Begriffe: *intermediate CA*, *fullchain*, *pathlen*, *chain of trust*, *offline root*.
