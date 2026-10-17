# Übung 05 – Parsing & Normalisierung

**Schwierigkeit: 5/10 · Dauer: ca. 65 Min.**

## Lernziele

- Verstehen, warum Rohlogs geparst und normalisiert werden müssen
- Wazuh-Decoder lesen und einen eigenen Decoder/Regel-Match bauen
- Felder extrahieren (srcip, user, action …) für Suche/Korrelation
- Ein Common Schema / Normalisierung als Korrelationsvoraussetzung begreifen

## Theorie

Jede Quelle loggt anders. Ein SIEM muss Rohzeilen in **strukturierte Felder** überführen:
- **Parsing (Decoder):** extrahiert aus einer Rohzeile Felder wie `srcip`, `srcuser`, `action`, `dstport`.
- **Normalisierung:** bildet diese auf ein **einheitliches Schema** ab (z. B. ECS/Common Schema), damit `srcip` aus Firewall, Host und IDS **gleich** heißt → erst dann kann man quellenübergreifend suchen/korrelieren.

In Wazuh machen das **Decoder** (parsen) + **Rules** (bewerten). Viele Quellen sind vordecodiert; für eigene/Custom-Logs schreibt man eigene **Decoder** (Regex-basiert) und ordnet Felder zu. Ohne saubere Felder ist Korrelation (Übung 08) unmöglich.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wazuh `wazuh-logtest` | Decoder/Rule gegen eine Logzeile testen |
| Management → Decoders/Rules | eigene Decoder/Regeln |
| Dashboard Discover | geparste Felder durchsuchen |

## Lab-Setup

- Laufendes Wazuh mit Quellen (Übung 04). Eine Custom-Log-Zeile (z. B. einer eigenen App) zum Decodieren.

## Aufgabe (selbst lösen)

1. Teste mit `wazuh-logtest` eine bekannte Logzeile (z. B. SSH-Fehllogin) – welche **Felder** extrahiert der Decoder, welche **Rule** matcht?
2. Nimm eine **nicht erkannte** Custom-Logzeile und zeige, dass keine Felder/keine Rule greifen.
3. Schreibe einen **eigenen Decoder** (Regex), der aus der Custom-Zeile `srcip`/`user`/`action` extrahiert.
4. Prüfe im Dashboard, dass die Felder jetzt **durchsuchbar** sind.
5. Erkläre, warum einheitliche Feldnamen (Normalisierung) für Korrelation nötig sind.

**Ziel:** ein eigener Decoder, der eine zuvor unstrukturierte Logzeile in durchsuchbare, normalisierte Felder überführt.

## SY0-701 Prüfungsbezug

- **Log parsing/normalization**, Common Schema, Feld-Extraktion als Korrelationsgrundlage.
- **Data enrichment**; Qualität der Normalisierung bestimmt Detection-Qualität.
- Begriffe: *parsing/decoding*, *normalization*, *common schema (ECS)*, *field extraction*, *correlation*.
