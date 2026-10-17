# Übung 04 – DNS-Zonentransfer (eigenes BIND-Lab)

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min. (inkl. Setup)**

## Lernziele

- Verstehen, was ein DNS-Zonentransfer (AXFR) ist und warum eine offene Konfiguration gefährlich ist
- Einen eigenen autoritativen **BIND9**-Server im Lab aufsetzen – einmal verwundbar, einmal gehärtet
- Einen AXFR mit `dig`, `dnsenum` und `dnsrecon` durchführen
- Die komplette Zone als Angreifer „abgreifen" und als Verteidiger absichern

## Theorie

**AXFR (Asynchronous Full Transfer)** ist der Mechanismus, mit dem ein **Secondary**-Name-Server die komplette Zone vom **Primary** kopiert. Ist der Primary falsch konfiguriert und erlaubt AXFR für **jeden**, kann ein Angreifer die **gesamte DNS-Zone** herunterladen – inkl. aller internen Hostnamen, Subdomains, Mailserver, evtl. interner IPs. Das ist einer der ergiebigsten Recon-Funde überhaupt.

Korrekt konfiguriert wird AXFR auf bekannte Secondary-IPs beschränkt (`allow-transfer`). Diese Übung baut **beides** nach – das ist nur im eigenen Lab möglich und darum ideal zum Lernen.

> ⚠️ AXFR-Versuche gegen fremde Domains sind **aktiv** und unerwünscht/teils strafbar. Nur gegen deinen eigenen BIND-Server oder freigegebene Ziele.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `bind9` / `named` | eigener DNS-Server (Ziel) | `/etc/bind/named.conf.*`, `allow-transfer` |
| `dig` | AXFR anfragen | `dig AXFR <zone> @<ns>` |
| `dnsenum` | DNS-Enum inkl. AXFR | `dnsenum <domain>` |
| `dnsrecon` | DNS-Enum/AXFR/Bruteforce | `dnsrecon -d <domain> -t axfr` |

## Lab-Setup

Eine **Linux-VM** (Debian/Ubuntu) als DNS-Server:
```bash
sudo apt install bind9 bind9utils
```
Beispiel-Zone `lab.local` anlegen (`/etc/bind/db.lab.local`) mit ein paar Records (ns1, www, mail, intranet, dev …). In `/etc/bind/named.conf.local` die Zone eintragen. **Zunächst absichtlich verwundbar:**
```
allow-transfer { any; };     // VERWUNDBAR – jeder darf AXFR
```
Details siehe `solution.md`. Kali fragt dann diesen Server.

## Aufgabe (selbst lösen)

1. Richte den BIND-Server mit der Zone `lab.local` und mehreren Records ein (verwundbare `allow-transfer { any; }`).
2. Von Kali: ermittle die **NS** der Zone und führe einen **AXFR** mit `dig` durch. Lade die **komplette Zone** herunter.
3. Wiederhole den Transfer mit `dnsenum` und `dnsrecon` – bekommst du dieselben Records?
4. **Verteidiger-Teil:** härte den Server (`allow-transfer` auf eine bekannte IP beschränken oder ganz verbieten), starte neu und zeige, dass der AXFR jetzt **fehlschlägt** (`Transfer failed`).
5. Erkläre, welche Informationen der offene AXFR einem Angreifer liefert und warum das so kritisch ist.

**Ziel:** einen offenen Zonentransfer erfolgreich ausnutzen *und* ihn anschließend wirksam schließen – Angriff und Fix selbst durchgespielt.

## SY0-701 Prüfungsbezug

- **DNS zone transfer** ist ein klassisches Prüfungs-/Pentest-Thema (Information Disclosure, Misconfiguration).
- **Hardening / secure configuration:** `allow-transfer` beschränken = *secure baseline*, Prinzip *least privilege* auf Dienstebene.
- **Attack surface:** interne Hostnamen aus der Zone = viele neue Ziele.
- Begriffe: *AXFR/IXFR*, *primary/secondary (master/slave)*, *misconfiguration*, *information disclosure*, *hardening*.
