# Übung 02 – Data Classification

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Datenklassifizierungs-Schemata verstehen und anwenden
- Datentypen (PII/PHI/PCI/IP) erkennen und kennzeichnen (labeling/tagging)
- Aus der Klasse konkrete Controls ableiten

## Theorie

**Data Classification** teilt Daten nach **Sensitivität/Schutzbedarf** ein → steuert alle weiteren Controls. Übliche Schemata:

- **Kommerziell:** public / internal / confidential / restricted (oder „sensitive").
- **Staatlich/Militär:** unclassified / confidential / secret / top secret.

**Datentypen (SY0-701):** **PII** (personenbezogen), **PHI** (Gesundheit), **PCI/Financial** (Karten/Finanz), **Intellectual Property**, **trade secrets**, **legal/regulated**, **human- vs. non-human-readable**. 

Prozess: **Identify → classify → label/tag → handle** (Handling-Regeln je Klasse: Zugriff, Verschlüsselung, Transport, Retention, Löschung). **Labeling/Tagging** (sichtbar/Metadaten) ermöglicht Automatisierung (z. B. DLP erkennt „confidential"-Tags, Übung 06). **Data Owner** entscheidet die Klasse (`governance-compliance` 03/08). Fehler: über-/unterklassifizieren (zu streng lähmt, zu lax leakt).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Klassifizierungs-Schema + Tabelle | Daten ↔ Klasse ↔ Controls |

## Lab-Setup

- Daten in deinem Lab/Repo als Klassifizierungsobjekt (Keys, Configs, Übungen, Logs).

## Aufgabe (selbst lösen)

1. Definiere ein 4-stufiges Klassifizierungs-Schema mit Kriterien.
2. Erkenne in 6 Beispielen den **Datentyp** (PII/PHI/PCI/IP/…) und die passende **Klasse**.
3. Klassifiziere deine Lab-Daten (Keys/Configs/Logs/Übungen/README) und leite pro Klasse **Handling-Regeln** (Zugriff/Verschlüsselung/Transport/Retention) ab.
4. Erkläre Nutzen von **Labeling/Tagging** (inkl. Automatisierung/DLP).

**Ziel:** ein anwendbares Klassifizierungs-Schema + klassifizierte Lab-Daten mit abgeleiteten Handling-Regeln.

## SY0-701 Prüfungsbezug

- **3.0/5.0** data classification (public/internal/confidential/restricted; gov levels), data types (PII/PHI/PCI/IP/trade secrets), labeling/tagging, handling.
- Begriffe: *classification*, *PII/PHI/PCI/IP*, *labeling/tagging*, *data owner*, *handling rules*, *regulated data*.
