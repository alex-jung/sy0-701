# Lösung – Übung 01: IR-Grundlagen & Lifecycle

## 1. Event vs. Incident

- **Event:** jede beobachtbare Vorkommnis (ein Login, ein geblocktes Paket). Meist harmlos.
- **Incident:** ein Event (oder eine Kette), das die **Sicherheit tatsächlich/potenziell verletzt** – z. B. erfolgreicher Einbruch, Datenabfluss, Ransomware. Jeder Incident ist ein Event, nicht jedes Event ein Incident.

## 2. NIST ↔ SANS

| NIST (4) | SANS/PICERL (6) |
|----------|-----------------|
| Preparation | Preparation |
| Detection & Analysis | Identification |
| Containment, Eradication & Recovery | Containment → Eradication → Recovery |
| Post-Incident Activity | Lessons Learned |

## 3. Severity-Matrix (Beispiel)

| Severity | Kriterien |
|----------|-----------|
| **SEV1** (kritisch) | produktiv/breit, sensible Daten betroffen, aktive Ausbreitung |
| **SEV2** (hoch) | einzelnes wichtiges System, bestätigter Angriff, kein Datenabfluss belegt |
| **SEV3** (niedrig) | eingegrenzt, kein Impact / nur Versuch |

Dimensionen: **Scope** (wie viele Systeme), **Impact** (CIA), **Datenart** (PII/Secrets), **Ausbreitung**.

## 4. Rollen & Playbook

- **Incident Commander:** leitet den Vorfall, trifft Entscheidungen, koordiniert.
- **CSIRT/CERT:** das Reaktionsteam (Analyse/Forensik/Comms).
- **Playbook:** standardisierter Ablauf je Szenario (z. B. „Ransomware": isolieren, Backups prüfen, …) → schnelle, konsistente Reaktion ohne Improvisation.

## 5. Szenario-Einstufung

- **Ransomware auf Fileserver:** SEV1 (breit, Verfügbarkeit + Daten, Ausbreitung).
- **Datenabfluss PII:** SEV1 (Vertraulichkeit + ggf. Meldepflicht).
- **Einzelner kompromittierter Test-Webserver, kein Datenabfluss:** SEV2.
Begründung = Scope × Impact × Datenart.

## Häufige Fehler / Troubleshooting

- **Jedes Event als Incident behandeln:** überlastet das Team → Triage/Severity (Übung 03).
- **Phasen verwechseln:** Containment ≠ Eradication (eindämmen vs. entfernen).
- **Keine Rollen definiert:** im Ernstfall Chaos → Preparation (Übung 02).
