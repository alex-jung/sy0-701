# Übung 04 – First Response & Containment

**Schwierigkeit: 4/10 · Dauer: ca. 55 Min.**

## Lernziele

- Containment-Strategien verstehen (kurz-/langfristig, Isolation vs. Abschalten)
- Einen kompromittierten Host eindämmen, ohne Beweise zu zerstören
- Die Abwägung „Beweissicherung vs. Schadensbegrenzung" treffen
- Netz-/Account-basierte Eindämmung durchführen

## Theorie

**Containment** stoppt die Ausbreitung und begrenzt den Schaden – **bevor** man eradiziert. Zentrale Abwägung:

- **Isolieren statt Ausschalten:** ein `shutdown` löscht den **flüchtigen Speicher (RAM)** und laufende Verbindungen → Beweisverlust (Malware oft nur im RAM, Keys, C2-Sessions). Besser: **Netz-Isolation** (VLAN/Firewall-Regel, Port, Host-Firewall), Host bleibt an → Memory sicherbar (Übung 06).
- **Kurzfristig vs. langfristig:** schnelle Isolation (sofort) vs. nachhaltige Maßnahmen (Segment abriegeln, Konten sperren, Credentials rotieren).
- **Account-Containment:** kompromittierte Konten sperren/Passwörter zurücksetzen, Sessions/Tokens invalidieren.
- **Tipping off vermeiden:** je nach Lage den Angreifer nicht vorzeitig „aufschrecken" (abhängig von Strategie/Beweiszielen).

Faustregel: **erst eindämmen + Beweise sichern, dann bereinigen.**

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense/Firewall | Netz-Isolation (Regel/VLAN) |
| Host-Firewall (`nft`/`iptables`/Windows FW) | lokale Isolation |
| IdM/`passwd`/AD | Konten sperren/Passwörter rotieren |

## Lab-Setup

- Kompromittierter Lab-Host (aus Übung 03). OPNsense für Netz-Isolation. **Snapshot** vor Containment.

## Aufgabe (selbst lösen)

1. **Isoliere** den kompromittierten Host per Netz (OPNsense-Regel/VLAN) **ohne** ihn auszuschalten. Verifiziere, dass er nach außen/intern nichts mehr erreicht.
2. Begründe, warum du **nicht** `shutdown` machst (Beweise/Memory).
3. Führe **Account-Containment** durch: das kompromittierte Konto sperren / Passwort rotieren / Session beenden.
4. Prüfe, ob der Angreifer **weitere Zugänge** hat (Persistence/zweite Session) – sonst bringt Containment wenig.
5. Dokumentiere alle Maßnahmen mit **Zeitstempel** (für Timeline/Chain of Custody).

**Ziel:** den Host sauber eingedämmt (Netz + Account), ohne Beweise zu zerstören, inkl. zeitgestempelter Doku.

## SY0-701 Prüfungsbezug

- **Containment** (short-/long-term), **Isolation vs. Shutdown**, Beweisschonung.
- **Account-Containment** (Sperren/Rotation), Segmentierung als IR-Mittel.
- Begriffe: *containment*, *isolation/segmentation*, *order of volatility* (Memory!), *credential rotation*, *tipping off*.
