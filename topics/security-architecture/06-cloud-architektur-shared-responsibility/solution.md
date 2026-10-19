# Lösung – Übung 06: Cloud & Shared Responsibility

## 1. Service-Modelle

| Modell | Beispiel | Kunde verantwortet |
|--------|----------|--------------------|
| IaaS | EC2/VM, VPC | OS, Middleware, App, Daten, Zugriff, Netz-Konfig |
| PaaS | App Engine/DB-Service | App-Code, Daten, Zugriff |
| SaaS | M365/Gmail | v. a. Daten, Zugriff/Sharing |

## 2. Shared-Responsibility-Matrix

| Schicht | IaaS | SaaS |
|---------|------|------|
| Physisch/RZ | Provider | Provider |
| Hypervisor/Host | Provider | Provider |
| Betriebssystem | **Kunde** | Provider |
| Netzwerk-Konfig | **Kunde** | Provider |
| Anwendung | **Kunde** | Provider |
| Daten | **Kunde** | **Kunde** |
| IAM/Zugriff | **Kunde** | **Kunde** |

→ „security **of** the cloud" = Provider; „security **in** the cloud" = Kunde. Daten/IAM bleiben **immer** Kunde.

## 3. Misconfiguration

Der Kunde ist für Konfiguration/Zugriff zuständig; Defaults/Komplexität führen zu Fehlern:
- Offener Storage-Bucket (public) → Datenabfluss. Gegen: Default-Private, Policy/CSPM.
- Zu weite IAM-Rolle (`*:*`) → Privilege Escalation. Gegen: Least Privilege, Policy-Review.

## 4. Cloud-Konzepte

| Konzept | Zweck |
|---------|-------|
| CASB | Sichtbarkeit/Kontrolle über Cloud-Nutzung (Shadow IT, DLP) |
| Security Group/NSG | virtuelle Firewall um Instanzen |
| CSPM | Fehlkonfigurationen/Posture automatisch finden |
| KMS | Schlüsselverwaltung/Verschlüsselung (at-rest) |

## Hinweise / Troubleshooting

- Shared Responsibility heißt **nicht** „Provider macht Security" – Daten/IAM/Config bleiben beim Kunden.
- SaaS: wenig zu verwalten, aber **Zugriff/Sharing** (und Daten) sind kritisch.
- Cloud-Logging (CloudTrail o. Ä.) früh aktivieren (Sichtbarkeit).
