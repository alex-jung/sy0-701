# Social-Engineer Toolkit (setoolkit / SET)

**Kategorie:** Social Engineering (Framework)

Menügeführtes Framework für **autorisierte** Social-Engineering-Tests: Spear-Phishing, Website-Attack-Vektoren (Site Cloner, **Credential Harvester**), Payload-Generierung, USB/Infectious Media u. a.

```bash
sudo setoolkit
```

## Menü (Auszug)

| Pfad | Zweck |
|------|-------|
| 1) Social-Engineering Attacks | Einstieg |
| → Website Attack Vectors → Credential Harvester → Site Cloner | Login-Seite klonen + Eingaben abfangen |
| → Spear-Phishing | Mail mit Payload (autorisiert) |
| → Infectious Media Generator | USB/Media-Payload |

## Hinweis (Ethik/Lab)

Nur gegen **eigene Test-Seiten/Test-Accounts** bzw. in einem **autorisierten** Awareness-/Red-Team-Engagement. **Keine realen Portale/Marken** gegen Dritte klonen, **keine echten Credentials** abgreifen. Credential-Harvester-POST-back-IP = erreichbare Kali-IP, Port 80 frei (`apache2` stoppen). Vorinstalliert in Kali.

## Verwendet in

social-engineering 05 (Credential Harvesting), 06 (Payloads), 09.
