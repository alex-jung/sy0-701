# Übung 06 – Cloud-Architektur & Shared Responsibility

**Schwierigkeit: 6/10 · Dauer: ca. 75 Min.**

## Lernziele

- Cloud-Service-Modelle (IaaS/PaaS/SaaS) und das Shared-Responsibility-Modell verstehen
- Verantwortungsgrenzen korrekt zuordnen
- Typische Cloud-Sicherheitskonzepte/-Fehler einordnen

## Theorie

**Cloud-Service-Modelle:** **IaaS** (VMs/Netz/Storage – du verwaltest OS aufwärts), **PaaS** (Plattform/Runtime – du verwaltest App/Daten), **SaaS** (fertige Anwendung – du verwaltest v. a. Daten/Zugriff). Deployment: **public/private/hybrid/community**.

**Shared Responsibility Model:** Der Provider sichert die Cloud (**security *of* the cloud**: Hardware, Hypervisor, physisch), der Kunde sichert **in** der Cloud (**security *in* the cloud**: Daten, Zugriff/IAM, Konfiguration, ggf. OS/Netzwerk). **Je höher das Modell (IaaS→SaaS), desto mehr übernimmt der Provider.** Häufigste Ursache für Cloud-Vorfälle: **Fehlkonfiguration** des Kunden (offene Buckets, zu weite IAM-Rechte).

Cloud-Security-Konzepte (SY0-701): **CASB** (Cloud Access Security Broker), **security groups/NSG**, **IAM/least privilege**, **encryption (KMS)**, **CSPM** (Posture Management), **VPC/segmentation**, **secrets management**, **logging (CloudTrail etc.)**. Querbezug: `risk-management` (Third Party), `data-protection`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Modell-/Verantwortungs-Analyse |
| Diagramm/Matrix | Responsibility-Matrix |

## Lab-Setup

- Konzeptionell (kein Cloud-Account nötig); optional ein lokaler „IaaS-Nachbau" (Proxmox-VM = IaaS-Analogie).

## Aufgabe (selbst lösen)

1. Unterscheide IaaS/PaaS/SaaS und nenne je ein Beispiel + wer welche Schicht verantwortet.
2. Erstelle eine **Shared-Responsibility-Matrix** (Schichten: physisch/Hypervisor/OS/Netz/App/Daten/IAM) für IaaS **und** SaaS – markiere Provider vs. Kunde.
3. Erkläre, warum **Misconfiguration** die häufigste Cloud-Schwäche ist, mit zwei Beispielen + Gegenmaßnahme.
4. Ordne 4 Cloud-Security-Konzepte (CASB, security groups, CSPM, KMS) je einem Zweck zu.

**Ziel:** Service-Modelle und Shared Responsibility korrekt zuordnen und Cloud-Fehlkonfigurationen/Controls verstehen.

## SY0-701 Prüfungsbezug

- **3.0** cloud models (IaaS/PaaS/SaaS, public/private/hybrid), shared responsibility, misconfiguration, CASB, security groups, CSPM, IAM, encryption/KMS.
- Begriffe: *IaaS/PaaS/SaaS*, *shared responsibility (of/in the cloud)*, *misconfiguration*, *CASB/CSPM*, *security group*, *IAM/least privilege*, *KMS*.
