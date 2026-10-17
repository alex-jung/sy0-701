# Lösung – Übung 01: IDS/IPS-Grundlagen

## 1. IDS vs. IPS

- **IDS:** erkennt + alarmiert, **passiv** (out-of-band). Vorteil: stört nie legitimen Traffic, kein Single Point of Failure. Nachteil: verhindert nichts in Echtzeit.
- **IPS:** **inline**, kann **blocken**. Vorteil: aktiver Schutz. Nachteil: False Positives blockieren Legitimes; inline = potenzieller Flaschenhals/Ausfallpunkt.

## 2. NIDS vs. HIDS

- **NIDS:** sieht Netzwerk-Traffic (Suricata, Snort, Zeek). Gut für netzweite Muster/Scans/C2.
- **HIDS:** auf dem Host (Wazuh/OSSEC, EDR) – Logs, **File Integrity Monitoring**, Prozesse. Sieht auch, was verschlüsselt übers Netz lief, aber lokal sichtbar ist.
→ Kombination (Defense in Depth).

## 3. Signature vs. Anomaly

- **Signature:** präzise für **bekannte** Angriffe (ET-Regeln) → wenig FP, aber **blind für 0-Days/Neues**.
- **Anomaly:** erkennt **Abweichungen** von der Baseline → findet Unbekanntes, aber **mehr False Positives** und Baseline-Aufwand.
Versagen: Signature bei neuem/verschleiertem Angriff; Anomaly bei „langsam eingeschlichenem" Normalzustand oder schlechter Baseline.

## 4. Platzierung

- **NIDS:** am **Span/Mirror-Port** oder Tap – bekommt eine Kopie des Traffics, out-of-band. Position: beobachtet das Segment/den Perimeter, ohne im Pfad zu liegen.
- **NIPS:** **inline** zwischen zwei Segmenten / am Perimeter (oft in/an der Firewall) – aller Traffic läuft durch → kann droppen. Auf OPNsense ist Suricata-IPS inline auf dem Interface.

## 5. Grenzen/Umgehungen

- **Verschlüsselung (TLS):** Inhalt unsichtbar → nur Metadaten/JA3/Zert; TLS-Inspection nötig.
- **Evasion:** Fragmentation, Timing (`-T0`), Decoys (vgl. `network-scanning` 08) gegen signaturbasierte Erkennung.
- **Tuning/FP:** schlecht getunt → Alert-Flut oder blinde Flecken; Performance bei hohem Durchsatz.

## Häufige Fehler / Troubleshooting

- **IDS = Schutz?** Nein – IDS alarmiert nur; Schutz braucht IPS/Reaktion.
- **Nur signaturbasiert gedacht:** 0-Days brauchen Anomaly/Behavior + HIDS/EDR.
- **Platzierung falsch:** ein NIDS am falschen Interface sieht den relevanten Traffic nicht.
