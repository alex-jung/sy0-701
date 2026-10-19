# Lösung – Übung 06: Compensating Controls

## 1./2./3. Drei Fälle (dokumentiert)

**Fall A – nicht patchbares Legacy (Metasploitable):**
- Primär: Patch/Update → **nicht möglich** (bewusst verwundbare, nicht wartbare VM).
- Compensating: in **isoliertes VLAN**, **Deny-by-default**-Firewall (nur nötiger Zugriff), **IDS/IPS** davor, **Snapshots**, kein Internet.
- Rest-Risiko: niedrig (kein Produktivbezug), Review bei Lab-Änderung.

**Fall B – Altdienst ohne MFA:**
- Primär: MFA am Dienst → nicht unterstützt.
- Compensating: Zugriff nur über **VPN mit MFA** + **Bastion/Jump-Host**, IP-Allowlist, verstärktes Logging/Alerting.
- Rest-Risiko: mittel, befristet bis Ablösung.

**Fall C – kein HSM für CA-Key:**
- Primär: Key im HSM → nicht vorhanden.
- Compensating: CA-Key **offline** auf verschlüsseltem Medium, starke **Passphrase**, 4-Augen/Zugriffsprotokoll, Name Constraints (`pki-certificates`).
- Rest-Risiko: akzeptiert (Lab).

Doku-Felder je Fall: *Anforderung · Grund der Nichtumsetzbarkeit · Ersatzmaßnahme · Rest-Risiko · Befristung/Review*.

## 4. Compensating vs Corrective

- **Compensating:** ersetzt **vorbeugend** eine fehlende präventive Control (Segmentierung **statt** Patch).
- **Corrective:** greift **nach** einem Vorfall (Restore/Quarantäne). 
Beispiel Legacy: Segmentierung = compensating; wenn die VM doch kompromittiert wird und man sie aus Snapshot zurücksetzt = corrective.

## Hinweise / Troubleshooting

- Compensating ≠ „Risiko ignorieren": Gleichwertigkeit muss plausibel sein und dokumentiert werden.
- Immer **befristen** + Review-Datum (sonst wird das Provisorium dauerhaft).
- Mehrere schwächere Controls können zusammen eine primäre ersetzen (Bündel).
