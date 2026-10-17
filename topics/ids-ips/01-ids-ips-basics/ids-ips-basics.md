# Übung 01 – IDS/IPS-Grundlagen

**Schwierigkeit: 1/10 · Dauer: ca. 35 Min.**

## Lernziele

- IDS vs. IPS unterscheiden
- NIDS vs. HIDS und die Platzierung (inline/tap, Span/Mirror) verstehen
- Erkennungsmethoden einordnen: signature-, anomaly-, behavior-based
- Grenzen von IDS/IPS realistisch bewerten

## Theorie

- **IDS (Detection):** erkennt und **alarmiert**, greift aber **nicht** ein (passiv, out-of-band/am Tap/Span-Port). Kein Einfluss auf den Traffic → kein Risiko, Legitimes zu blocken, aber auch kein Schutz in Echtzeit.
- **IPS (Prevention):** sitzt **inline** im Datenpfad und kann Traffic **blocken/droppen**. Schützt aktiv, aber False Positives blockieren legitimen Verkehr → Tuning nötig.
- **NIDS/NIPS:** netzbasiert (Suricata/Snort/Zeek) – sieht den Netzwerk-Traffic.
- **HIDS/HIPS:** hostbasiert (z. B. Wazuh/OSSEC, EDR) – Logs/Dateiintegrität/Prozesse auf dem Host.

Erkennungsmethoden:
- **Signature-based:** Muster bekannter Angriffe (präzise bei Bekanntem, blind für Neues/0-Day).
- **Anomaly-based:** Abweichung von einer Baseline (findet Neues, mehr False Positives).
- **Behavior-/heuristic-based:** verhaltensbasiert.

Grenzen: Verschlüsselung (TLS) verbirgt Inhalte, Evasion (Fragmentation/Timing, vgl. `network-scanning` Übung 08), Tuning-Aufwand.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| — | konzeptionelle Übung |

## Lab-Setup

- Keines (Theorie/Einordnung). Vorbereitung für Suricata (Übung 02).

## Aufgabe (selbst lösen)

1. Erkläre den Kernunterschied **IDS vs. IPS** und je einen Vor-/Nachteil.
2. Grenze **NIDS vs. HIDS** ab und nenne je ein Beispiel-Tool.
3. Unterscheide **signature-based vs. anomaly-based** Detection – wann versagt welche?
4. Wo platziert man ein NIDS (**tap/span**) vs. ein NIPS (**inline**)? Zeichne/beschreibe die Position relativ zur Firewall.
5. Nenne drei **Grenzen/Umgehungen** von IDS/IPS (Bezug zu Evasion aus `network-scanning`).

**Ziel:** die IDS/IPS-Konzepte und ihre Einordnung sicher benennen – Grundlage für die praktischen Suricata-/Zeek-Übungen.

## SY0-701 Prüfungsbezug

- **IDS vs. IPS**, **NIDS/HIDS**, **signature vs. anomaly/behavior-based**, **inline vs. tap/span** – Kernstoff Domäne 4.0.
- **False positive/negative**, Verschlüsselung/Evasion als Grenzen.
- Begriffe: *IDS/IPS*, *NIDS/HIDS*, *signature/anomaly/behavior-based*, *inline vs. passive (tap/span)*, *false positive/negative*.
