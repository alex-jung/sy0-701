# Übung 06 – Compensating Controls entwerfen

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- Verstehen, wann und warum Compensating Controls nötig sind
- Für reale Einschränkungen gleichwertige Ersatzmaßnahmen entwerfen
- Compensating Controls begründen und dokumentieren (Audit-tauglich)

## Theorie

Eine **Compensating Control** ist eine **alternative** Maßnahme, wenn die eigentlich geforderte (primäre) Control **nicht umsetzbar** ist – aus technischen, betrieblichen oder Kostengründen. Sie muss das Risiko **gleichwertig** (oder nahezu) reduzieren. Klassiker: ein **Legacy-System**, das nicht gepatcht werden kann → statt „Patch" (primär) ⇒ **Segmentierung + strenge Firewall + Monitoring + MFA davor** (compensating).

Wichtig: eine Compensating Control ist eine **bewusste, dokumentierte** Entscheidung mit Begründung („warum primär nicht möglich", „wie wird das Risiko sonst gesenkt", „befristet bis?"). In Compliance-Kontexten (z. B. PCI DSS) sind Compensating Controls formal erlaubt, aber rechtfertigungspflichtig. Abgrenzung: **corrective** behebt **nach** einem Vorfall; **compensating** **ersetzt** eine fehlende präventive Control **vorbeugend**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Design + Begründung; Bezug zu Lab-Controls |

## Lab-Setup

- Dein Lab + die Gaps aus Übung 05.

## Aufgabe (selbst lösen)

1. Wähle **drei** realistische Einschränkungen (z. B. nicht patchbares Metasploitable-Legacy, kein MFA-fähiger Altdienst, fehlendes Hardware-Security-Modul) und entwirf je eine **Compensating Control**.
2. Begründe pro Fall: warum ist die primäre Control nicht möglich, und **wie gleichwertig** senkt die Ersatzmaßnahme das Risiko?
3. Dokumentiere jede Compensating Control audit-tauglich (primäre Anforderung, Grund, Ersatzmaßnahme, Rest-Risiko, Befristung/Review).
4. Grenze an einem Beispiel **compensating** von **corrective** ab.

**Ziel:** drei begründete, dokumentierte Compensating Controls für reale Lab-Einschränkungen.

## SY0-701 Prüfungsbezug

- **1.0/5.0** compensating controls, risk acceptance/mitigation, exceptions, documentation.
- Fallen: compensating vs. corrective; „gleichwertige" Risikoreduktion.
- Begriffe: *compensating control*, *exception/waiver*, *residual risk*, *legacy/unpatchable*.
