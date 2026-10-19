# Übung 01 – Data States & Grundlagen

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Die drei Data States unterscheiden und je State Schutzmaßnahmen zuordnen
- Data-Protection-Grundbegriffe einordnen (Owner/Classification/CIA)
- Verstehen, warum „data in use" am schwersten zu schützen ist

## Theorie

Daten existieren in drei **States** (SY0-701), jeder braucht andere Controls:

- **Data at Rest** – gespeichert (Disk/DB/Backup). Schutz: **Verschlüsselung** (FDE/LUKS, DB-/File-Encryption), Zugriffskontrolle.
- **Data in Transit (in motion)** – unterwegs im Netz. Schutz: **TLS/VPN/IPsec**, sichere Protokolle.
- **Data in Use** – im Arbeitsspeicher/aktiv verarbeitet. Am schwersten zu schützen: **Confidential Computing/Enclaves (SGX/SEV)**, Speicherverschlüsselung, strikte Zugriffsrechte; klassische Verschlüsselung hilft hier wenig (Daten müssen entschlüsselt verarbeitet werden).

Querbegriffe: **Data Classification** (Übung 02) bestimmt, **wie** stark man schützt; **Data Sovereignty/Residency** (wo liegen Daten rechtlich); **CIA** – Vertraulichkeit steht im Vordergrund, aber auch Integrität/Verfügbarkeit (Backup). Data-Protection kombiniert technische Controls (Krypto/DLP) mit Governance (Data Owner/Policies, `governance-compliance`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | States/Controls zuordnen |

## Lab-Setup

- Keines.

## Aufgabe (selbst lösen)

1. Definiere die drei Data States und nenne je **zwei** passende Controls.
2. Ordne 6 Lab-Beispiele den States zu (z. B. VM-Disk, SSH-Session, laufender Prozess mit Passwort im RAM, Backup-Datei, TLS-Download, DB im Betrieb).
3. Erkläre, warum **data in use** am schwersten zu schützen ist und welche Technologien es adressieren.
4. Beschreibe, wie **Classification** und **State** zusammen die Control-Wahl bestimmen.

**Ziel:** Data States sicher unterscheiden und je State/Schutzbedarf die richtigen Controls zuordnen.

## SY0-701 Prüfungsbezug

- **3.0** data states (at rest/in transit/in use), protecting data, data types/classification (Bezug), sovereignty.
- Begriffe: *data at rest/in transit/in use*, *encryption*, *confidential computing/enclave*, *classification*, *data sovereignty*.
