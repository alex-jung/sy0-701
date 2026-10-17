# Übung 02 – Suricata auf OPNsense aufsetzen (IDS-Modus)

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Suricata in OPNsense aktivieren und das richtige Interface wählen
- Regelsätze (ET Open) herunterladen und aktivieren
- Den IDS-Modus (nur erkennen) konfigurieren
- Die Funktion mit einem einfachen Test verifizieren

## Theorie

**Suricata** ist eine leistungsfähige Open-Source-IDS/IPS-Engine (Multi-Threaded, signaturbasiert + Protokoll-Analyse). In OPNsense ist sie als Plugin integriert (**Services → Intrusion Detection**). Kernentscheidungen beim Setup:

- **Interface:** wo lauschen? **WAN** sieht den Perimeter-Traffic (viele Internet-Angriffe), ein **internes Interface** sieht internen/segmentübergreifenden Traffic. (Hinweis: auf WAN sieht Suricata durch NAT teils nur die öffentliche Seite.)
- **IDS vs. IPS:** zunächst **IDS** (nur „Detect"/Alert, kein Blocking) – sicher zum Lernen; IPS später (Übung 06).
- **Rulesets:** **ET Open** (Emerging Threats, kostenlos) als Basis; Regeln müssen heruntergeladen und **aktiviert** werden.
- **Pattern Matcher/Promiscuous**: Standardwerte meist ok.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Services → Intrusion Detection → Administration | Suricata aktivieren, Interface, Modus |
| → Download | Regelsätze (ET Open) laden |
| → Rules | Regeln aktivieren/filtern |

## Lab-Setup

- OPNsense mit genügend RAM (Suricata ist speicherhungrig – ≥ 2–4 GB). Kali + internes Ziel zum späteren Testen.

## Aufgabe (selbst lösen)

1. Aktiviere Suricata, wähle das zu überwachende **Interface** und begründe die Wahl.
2. Lade die **ET-Open**-Regelsätze herunter und aktiviere eine sinnvolle Auswahl (z. B. scan/exploit/malware).
3. Stelle sicher, dass der **IDS-Modus** (Detect, **kein** IPS/Blocking) aktiv ist.
4. Starte Suricata und prüfe, dass der Dienst läuft (Status/Logs).
5. Löse einen simplen Test aus (z. B. einen Scan von Kali) und bestätige, dass **Alerts** erscheinen.

**Ziel:** eine laufende Suricata-IDS-Instanz auf dem richtigen Interface mit aktiven ET-Open-Regeln, verifiziert durch erste Alerts.

## SY0-701 Prüfungsbezug

- **IDS-Deployment**, Sensor-**Platzierung**, Regelsätze/Feeds, regelmäßige Updates.
- **Signature-based detection** in der Praxis.
- Begriffe: *IDS*, *Suricata/Snort*, *rule feed (ET Open)*, *sensor placement*, *detect mode*.
