# Übung 01 – Architektur-Modelle & Grundlagen

**Schwierigkeit: 1/10 · Dauer: ca. 45 Min.**

## Lernziele

- Grundprinzipien sicherer Architektur verstehen
- Architektur-Modelle/Deployment-Varianten unterscheiden (on-prem/cloud/hybrid)
- Security-by-Design und zentrale Prinzipien einordnen

## Theorie

**Security Architecture** entwirft, **wie** Systeme/Netze aufgebaut sind, damit Sicherheit strukturell eingebaut ist (nicht nachträglich). Leitprinzipien:

- **Security by Design / Default** – Sicherheit von Anfang an, sichere Grundeinstellungen.
- **Defense in Depth** (mehrschichtig, `security-controls` 03), **Least Privilege**, **Separation of Duties**, **Fail-safe/Fail-secure**, **Simplicity/KISS**, **Zero Trust** (Übung 04).
- **Minimize attack surface**, **Segmentierung**, **Redundanz/Resilience**.

Deployment-/Architektur-Varianten (SY0-701):
- **On-premises**, **Cloud** (IaaS/PaaS/SaaS), **Hybrid**, **Multi-Cloud**.
- **Serverless**, **Microservices/Container**, **IaC (Infrastructure as Code)**, **SDN (Software-Defined Networking)**, **IoT/ICS-OT**, **Embedded**.

Jede Variante hat eigene Sicherheits-Implikationen (z. B. Shared Responsibility in Cloud, Patchbarkeit bei IoT/ICS, Isolationsgrenzen bei Containern). Architektur-Entscheidungen sind **Trade-offs** (Kosten/Komplexität/Verfügbarkeit/Sicherheit).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Diagramm-Tool | Architektur skizzieren |
| (konzeptionell) | Prinzipien/Modelle |

## Lab-Setup

- Keines; optional Skizze deines Lab-Aufbaus (Proxmox/OPNsense/VMs).

## Aufgabe (selbst lösen)

1. Erkläre 5 Architektur-Prinzipien (security by design, least privilege, fail-secure, minimize attack surface, defense in depth) mit je einem Lab-Beispiel.
2. Unterscheide on-prem / cloud / hybrid / multi-cloud und nenne je eine Sicherheits-Implikation.
3. Charakterisiere serverless, container/microservices und IoT/ICS hinsichtlich ihrer Sicherheits-Besonderheiten.
4. Ordne dein eigenes Lab einem Architektur-Modell zu und benenne drei bewusste Trade-offs.

**Ziel:** Architektur-Grundprinzipien und -Modelle sicher einordnen und auf das eigene Lab beziehen.

## SY0-701 Prüfungsbezug

- **3.0** architecture models (on-prem/cloud/hybrid/serverless/microservices/IaC/SDN/IoT/ICS), security by design, principles.
- Begriffe: *security by design/default*, *least privilege*, *fail-secure*, *attack surface*, *on-prem/cloud/hybrid*, *serverless/microservices/IaC/SDN/IoT/ICS*.
