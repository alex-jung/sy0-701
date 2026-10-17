# Übung 04 – Phishing-Simulation mit GoPhish (Awareness)

**Schwierigkeit: 4/10 · Dauer: ca. 70 Min.**

## Lernziele

- Eine **autorisierte** Phishing-Simulation planen und mit GoPhish durchführen
- Komponenten verstehen: Sending Profile, Landing Page, Email Template, Groups, Campaign
- Kampagnen-Metriken auswerten (Sent/Opened/Clicked/Submitted)
- Die Ergebnisse in ein Awareness-Programm überführen

## Theorie

**GoPhish** ist ein legitimes Framework für **Security-Awareness-Phishing-Simulationen**: Organisationen senden damit (mit Management-Freigabe) kontrollierte Test-Phishing-Mails an die **eigenen Mitarbeiter**, messen die Klick-/Eingabe-Rate und schulen gezielt. Es ist **kein** Werkzeug gegen Dritte.

Bausteine:
- **Sending Profile** (SMTP-Absender), **Email Template** (die Test-Mail, mit Tracking), **Landing Page** (die Zielseite, erfasst Klick/„Eingabe"), **Users & Groups** (die Test-Empfänger), **Campaign** (verbindet alles).
Metriken: **Sent → Opened → Clicked → Submitted Data** + Reported.

> ⚠️ Nur **eigene Test-Accounts / eigene, informierte** Teilnehmer mit Scope/Freigabe. Keine echten Credentials erfassen – Landing Page dient der Awareness/Schulung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| **GoPhish** | Simulation (Admin-UI + Tracking) |
| eigener/Test-SMTP | Versand im Lab |

## Lab-Setup

- GoPhish auf Kali/VM (`./gophish` → Admin-UI `https://127.0.0.1:3333`). Eigene Test-Empfänger (eigene Postfächer). Test-SMTP.

## Aufgabe (selbst lösen)

1. Starte GoPhish und lege ein **Sending Profile** (Test-SMTP) an.
2. Erstelle ein **Email Template** (harmlose, klar als Test erkennbare Awareness-Mail) und eine **Landing Page** (die nur den Klick trackt, keine echten Daten speichert).
3. Lege eine **Group** mit deinen **eigenen Test-Adressen** an und starte eine **Campaign**.
4. Werte die **Metriken** aus: Sent/Opened/Clicked. Was sagt die Klickrate?
5. Leite daraus **Awareness-Maßnahmen** ab (Schulung, Melde-Button, Wiederholungstests).

**Ziel:** eine vollständige, autorisierte Phishing-Simulation gegen eigene Test-Adressen durchgeführt und ausgewertet.

## SY0-701 Prüfungsbezug

- **Phishing simulations / security awareness training** als Kontrolle (5.0).
- **Metriken/KPIs** (click rate, report rate) zur Wirksamkeitsmessung.
- **Kontinuierliche Awareness** statt Einmal-Schulung.
- Begriffe: *phishing simulation*, *security awareness training*, *KPIs*, *reporting*, *user behavior*.
