# Übung 07 – Third-Party- & Supply-Chain-Risiko

**Schwierigkeit: 7/10 · Dauer: ca. 80 Min.**

## Lernziele

- Third-Party-/Supply-Chain-Risiken erkennen und bewerten
- Vendor-Assessment und vertragliche Instrumente (SLA/MSA/BPA/SOW) einordnen
- Software-Supply-Chain-Sicherheit (SBOM, Signaturen) verstehen

## Theorie

Risiken entstehen oft **außerhalb** der eigenen Organisation – durch Lieferanten, Dienstleister und Software von Dritten. **Supply-Chain-Angriffe** (SolarWinds, dependency confusion, kompromittierte Images/Pakete) treffen viele Opfer über einen vertrauten Kanal.

**Vendor/Third-Party Risk Management:**
- **Assessment vor Vertrag:** Fragebögen, Audits, Zertifikate (SOC 2, ISO 27001), Pen-Test-Reports, **Right-to-Audit**.
- **Vertragliche Instrumente:** **SLA** (Service Level Agreement, Leistung/Verfügbarkeit), **MSA** (Master Service Agreement), **SOW** (Statement of Work), **BPA** (Business Partner Agreement), **MOU/MOA**, **NDA**, **DPA** (Datenschutz). **Right-to-audit clause**, Exit-/Offboarding-Regeln.
- **Laufende Überwachung:** Vendor-Monitoring, erneute Assessments, Vorfallsmeldepflichten.

**Software Supply Chain:** Herkunft/Integrität prüfen – **Signaturen/Hashes**, **SBOM (Software Bill of Materials)**, Dependency-/Vulnerability-Scanning, vertrauenswürdige Repos, Pinning. Bezug zu `cryptography-basics` (Signaturen) und `malware-analysis` (Image prüfen).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Vendor-Assessment-Fragebogen | Third-Party-Bewertung |
| `sha256sum`/`gpg` | Image-/Paket-Integrität |
| (SBOM-Konzept) | Abhängigkeiten erfassen |

## Lab-Setup

- Dein Lab nutzt Dritt-Software (Proxmox, OPNsense, Kali, Docker-Images, Repos) → als Supply-Chain-Objekt.

## Aufgabe (selbst lösen)

1. Liste die **Third-Party-Komponenten** deines Labs (OS/Images/Tools/Repos) und bewerte je das Supply-Chain-Risiko.
2. Erstelle einen kurzen **Vendor-Assessment-Fragebogen** (8–10 Fragen), den du an einen hypothetischen Dienstleister stellen würdest.
3. Ordne die Vertragsinstrumente **SLA/MSA/SOW/BPA/NDA/DPA** je einem passenden Einsatzzweck zu.
4. Prüfe praktisch die **Integrität** eines bezogenen Images/Pakets (Hash/Signatur) und beschreibe, wie eine **SBOM** dein Dependency-Risiko senkt.

**Ziel:** eine Third-Party-Risikobewertung deines Labs + Vendor-Fragebogen + eine praktische Integritätsprüfung.

## SY0-701 Prüfungsbezug

- **5.0** third-party/vendor risk, supply chain, due diligence, right-to-audit, SLA/MSA/SOW/BPA/MOU/NDA, SBOM.
- **2.0** supply chain attacks, software integrity (signatures/hashes).
- Begriffe: *supply chain risk*, *vendor assessment/due diligence*, *SLA/MSA/SOW/BPA/MOU/NDA/DPA*, *right-to-audit*, *SBOM*.
