# Übung 05 – Credential Harvesting mit SET (Lab)

**Schwierigkeit: 5/10 · Dauer: ca. 60 Min.**

## Lernziele

- Das Social-Engineer Toolkit (SET) bedienen
- Den Credential-Harvester (geklonte Login-Seite) im Lab verstehen
- Nachvollziehen, wie Eingaben abgefangen werden
- Die Abwehr kennen (MFA, URL-Prüfung, Passwort-Manager)

## Theorie

Der **Credential Harvester** klont eine Login-Seite und präsentiert sie unter einer vom Angreifer kontrollierten URL; gibt ein Opfer dort seine Daten ein, werden sie abgefangen (und meist zur echten Seite weitergeleitet, damit es unbemerkt bleibt). Kombiniert mit einer Phishing-Mail (Link auf die Fake-Seite) ist das der klassische Credential-Diebstahl.

**SET (setoolkit)** automatisiert das (Site Cloner, Harvester). **In diesem Kurs** läuft das **nur im Lab gegen eine eigene Test-Login-Seite und eigene Test-Accounts** – es geht ums **Prinzip und die Abwehr**, nicht um reale Zugangsdaten.

**Warum MFA zentral ist:** selbst erbeutete Passwörter sind ohne zweiten Faktor wertlos (außer bei MFA-Phishing/Real-time-Proxy – fortgeschritten, konzeptionell).

> ⚠️ Keine realen Portale/Marken klonen und gegen Dritte einsetzen. Eigene Test-Seite, eigene Test-Eingaben.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `setoolkit` (SET) | Site Cloner + Credential Harvester |
| eigener Webserver | eigene Test-Login-Seite hosten |

## Lab-Setup

- Kali mit SET. Eine **eigene** Test-Login-Seite (selbst gebaut) + **eigene** Test-Accounts. Isoliertes Netz.

## Aufgabe (selbst lösen)

1. Baue/benutze eine **eigene** simple Login-Seite als Zielobjekt (kein reales Portal).
2. Nutze SETs **Credential Harvester** (Site Clone deiner eigenen Seite), hoste ihn und rufe ihn **selbst** auf.
3. Gib **Test-Credentials** ein und beobachte, wie SET sie abfängt und zur „echten" Seite weiterleitet.
4. Erkläre, warum das Opfer oft nichts merkt – und welche URL-/Zertifikats-Hinweise es trotzdem gäbe.
5. Erkläre, wie **MFA**, URL-Prüfung und Passwort-Manager den Angriff entwerten.

**Ziel:** das Credential-Harvesting-Prinzip im Lab an eigener Seite/Test-Daten nachvollzogen – mit klarem Fokus auf Abwehr.

## SY0-701 Prüfungsbezug

- **Credential harvesting / phishing landing pages**; Site Cloning.
- **MFA** als wichtigste Gegenmaßnahme; URL/Zertifikatsprüfung, Passwort-Manager (füllt nur auf echter Domain aus).
- Begriffe: *credential harvesting*, *phishing*, *MFA*, *site cloning*, *passwordless/FIDO2*.
