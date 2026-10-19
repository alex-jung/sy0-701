# Übung 04 – Überwachung & Detection

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min.**

## Lernziele

- Physische Überwachungs-/Detektionssysteme verstehen
- Sensor-Typen und CCTV/Kameras einordnen
- Alarmierung, Monitoring und Response verbinden

## Theorie

Detection macht physische Vorfälle **sichtbar** und löst **Response** aus. Systeme (SY0-701):

- **Video surveillance / CCTV:** Abschreckung + Aufzeichnung + Beweis; moderne Kameras mit Bewegungserkennung/Analytics; **PTZ**. Grenzen: tote Winkel, Aufzeichnung muss geprüft/gespeichert werden (sonst nur „gefühlte" Sicherheit).
- **Sensoren:** **motion**, **infrared/PIR**, **microwave**, **ultrasonic**, **pressure**, **magnetic (Tür/Fenster)**, **glass break**, **vibration**, **temperature/humidity**, **water/flood**, **smoke/fire**. „**Sensor fusion**" reduziert Fehlalarme.
- **Alarme/IDS (physisch):** Einbruchmeldeanlage, verbunden mit Leitstelle/Response.
- **Guards + patrols**, **lighting** (unterstützt Kameras).

Wichtig: Detection ohne **Monitoring + Response** ist wertlos (wie SIEM-Alarm, der niemand liest). Zusammenspiel mit Delay (Übung 02): Barriere kauft Zeit, Detection meldet, Response reagiert. Bezug: `logging-siem`/`incident-response` (gleiche Logik, physische Welt).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Sensor-/Überwachungs-Design |

## Lab-Setup

- Dein Lab-Standort; optional vorhandene Smart-Home-Sensoren als Beispiel.

## Aufgabe (selbst lösen)

1. Ordne 6 Sensor-Typen je einem Erkennungszweck zu (Bewegung/Tür/Glasbruch/Temperatur/Wasser/Rauch).
2. Beschreibe Nutzen und Grenzen von CCTV (Abschreckung/Beweis vs. tote Winkel/Datenschutz).
3. Erkläre, warum Detection nur mit **Monitoring + Response** wirkt (Beispiel-Alarmkette).
4. Entwirf ein kleines Detektions-Konzept für deinen Lab-Raum (welche Sensoren + Alarmierung).

**Ziel:** ein stimmiges physisches Detektions-/Überwachungskonzept mit Alarmkette entwerfen.

## SY0-701 Prüfungsbezug

- **1.0/2.0** video surveillance/CCTV, sensors (motion/infrared/microwave/ultrasonic/pressure/magnetic), alarms, guards, lighting; detection + response.
- Begriffe: *CCTV/PTZ*, *motion/infrared/pressure/magnetic sensors*, *sensor fusion*, *alarm/monitoring*, *detection+response*.
