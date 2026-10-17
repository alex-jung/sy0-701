# Lösung – Übung 06: Detection-Regeln

Regeln in `/var/ossec/etc/rules/local_rules.xml`, eigene IDs ≥ 100000.

## 1. Einzel-Event-Regel

```xml
<group name="local,syslog,">
  <rule id="100100" level="10">
    <if_sid>5402</if_sid>            <!-- sudo-Nutzung -->
    <match>COMMAND=/bin/bash|to root</match>
    <description>Privilegierte sudo-Shell als root</description>
    <mitre><id>T1548.003</id></mitre>
  </rule>
</group>
```
Test:
```bash
sudo /var/ossec/bin/wazuh-logtest   # passende sudo-Logzeile einfügen -> rule 100100, level 10
```

## 2. Frequency/Brute-Force-Regel

```xml
<rule id="100110" level="12" frequency="6" timeframe="60">
  <if_matched_sid>5710</if_matched_sid>   <!-- sshd auth failed -->
  <same_source_ip/>
  <description>Moegliches SSH-Brute-Force: >=6 Fehllogins/60s von gleicher IP</description>
  <mitre><id>T1110</id></mitre>
</rule>
```
→ erst ab 6 Fehllogins derselben IP in 60 s feuert Level 12.

## 3. Auslösen + verifizieren

```bash
sudo -s                                  # sudo-root -> Regel 100100
hydra -l root -P pass.txt <host> ssh     # viele Fehllogins -> Regel 100110
```
Im Dashboard (Security Events) die Alerts 100100/100110 + Level prüfen.

## 4. ATT&CK-Mapping

`<mitre><id>T1110</id></mitre>` (Brute Force) bzw. `T1548.003` (sudo). Das **MITRE-Modul** im Dashboard zeigt die Technik-Zuordnung → Coverage-Sicht.

## 5. Einzel vs. Korrelation / actionable

- **Einzel-Event:** reagiert auf **ein** Ereignis (sudo-root). Einfach, aber manche Angriffe sind nur im Muster sichtbar.
- **Korrelation/Frequency:** erkennt **Muster** über mehrere Events (Brute-Force) → weniger FP, mehr Aussage.
- **Actionable** = ein Alert bedeutet klaren Handlungsbedarf (richtige Severity, wenig Rauschen) → Analyst muss nicht raten.

## Härtung/Betrieb

Regeln versioniert pflegen, auf ATT&CK mappen (Coverage), FP tunen (Bezug `ids-ips` 07), Levels konsistent vergeben.

## Häufige Fehler / Troubleshooting

- **Regel feuert nicht:** falsche `if_sid`/`match`; mit `wazuh-logtest` prüfen; Manager neu starten.
- **Frequency greift nicht:** `<same_source_ip/>`/`if_matched_sid` korrekt? Feld `srcip` vorhanden (Übung 05)?
- **Zu viele FP:** `match` präzisieren, Level/Frequency anpassen.
- **ID-Kollision:** eigene IDs ≥ 100000.
