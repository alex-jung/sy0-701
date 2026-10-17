# Lösung – Übung 03: Phishing-Mail analysieren

## 1. Received-Kette

Rohheader (Mail-Client → „Original/Quelltext anzeigen"). Die `Received:`-Zeilen von **unten nach oben** lesen = Weg vom Ursprung zum Empfänger. Der **unterste** einwerfende Server zeigt die echte Herkunft (IP/Hostname) – passt sie nicht zur vorgeblichen Absenderdomain, ist das verdächtig.

## 2. From vs. Return-Path/Reply-To

```
From: "IT-Support" <it@firma.de>
Return-Path: <bounce@random-xyz.ru>       <- Mismatch!
Reply-To: <angreifer@gmail.com>           <- Antworten gehen woanders hin
```
Abweichungen = starkes Spoofing-/Phishing-Indiz.

## 3. SPF/DKIM/DMARC

Im `Authentication-Results:`-Header:
```
spf=fail (sender IP not permitted) smtp.mailfrom=firma.de
dkim=fail
dmarc=fail (p=reject) header.from=firma.de
```
→ Absender **gespooft**; wäre DMARC `p=reject` serverseitig durchgesetzt, würde die Mail abgewiesen. `dig +short _dmarc.firma.de TXT` zeigt die Policy der echten Domain.

## 4. Links & Anhänge

```
Angezeigt: https://firma.de/login
Tatsächlich (Hover/Quelltext): https://firma-de.secure-login.ru/...
```
Lookalike-/Typosquatting-Domain → Phishing. Links **nicht klicken**; URL in `urlscan.io`/Sandbox prüfen. Anhänge (`.html`, `.htm`, Office mit Makros, `.iso`/`.zip` mit Script) als gefährlich einstufen, in Sandbox analysieren.

## 5. Klassifikation

Beispiel: From/Return-Path-Mismatch + SPF/DKIM/DMARC `fail` + Lookalike-Link + Urgency → **Phishing**. Begründung mit genau diesen Indikatoren dokumentieren; an das SOC/IT **melden** (nicht löschen).

## Gegenmaßnahmen

- **DMARC `p=reject`** + SPF (hart) + DKIM auf der eigenen Domain → eingehend durch Mail-Gateway durchsetzen.
- Mail-Security-Gateway (Link-Rewriting/Sandboxing), externe-Absender-Banner, Melde-Button, Awareness.

## Häufige Fehler / Troubleshooting

- **Nur `From` angeschaut:** der angezeigte Absender ist trivial fälschbar → Header/Auth-Results prüfen.
- **SPF pass = sicher?** Nein – SPF prüft nur den Envelope-Sender; **DMARC-Alignment** ist entscheidend.
- **Link geklickt:** nie in der echten Umgebung; Sandbox/urlscan.
- **Backscatter/Weiterleitungen** können SPF verfälschen → DKIM/DMARC mitbetrachten.
