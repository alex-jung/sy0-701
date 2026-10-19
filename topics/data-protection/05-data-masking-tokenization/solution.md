# Lösung – Übung 05: Masking & Tokenization

## 1. Abgrenzung

| Verfahren | Idee | Reversibel? |
|-----------|------|-------------|
| Masking | Teile verdecken (`****1234`) | i. d. R. nein (in der Anzeige) |
| Tokenization | Wert → Token, Mapping im Vault | ja, nur über Vault |
| Anonymization | Personenbezug **unwiderruflich** entfernt | nein |
| Pseudonymization | Pseudonym statt Identität | ja, mit Zusatzinfo |

## 2. Praxis (Beispiel)

```python
# Masking
def mask_card(c): return "**** **** **** " + c[-4:]
def mask_mail(m): u,d=m.split("@"); return u[0]+"***@"+d
# Tokenization (mit Vault-Mapping)
import secrets
vault={}
def tokenize(v):
    t="tok_"+secrets.token_hex(6); vault[t]=v; return t
def detokenize(t): return vault.get(t)
print(mask_card("4111111111111234"))     # **** **** **** 1234
tok=tokenize("4111111111111234"); print(tok, detokenize(tok))
```

## 3. Szenarien

| Szenario | Verfahren | Begründung |
|----------|-----------|------------|
| Test-/Entwickler-DB | Masking/Pseudonymization | realistische, aber ungefährliche Daten |
| PCI-Zahlung | Tokenization | Kartennummer raus aus Systemen, Vault hält Mapping |
| DSGVO-Analyse/Statistik | Anonymization | kein Personenbezug → außerhalb DSGVO |
| Support-Anzeige | Masking | Agent sieht nur `****1234` |

## 4. Pseudonym vs Anonym (DSGVO)

- **Pseudonymisierung:** Re-Identifikation mit Zusatzinfo möglich → Daten bleiben **personenbezogen** → DSGVO gilt (aber risikomindernd/empfohlen).
- **Anonymisierung:** keine Re-Identifikation möglich → **kein** Personenbezug → fällt **aus** dem DSGVO-Scope. Schwierig korrekt umzusetzen (Re-Identifikationsrisiko).

## Hinweise / Troubleshooting

- Masking in der **Anzeige** ≠ Schutz in der DB – Originaldaten dahinter trotzdem schützen (Encryption/Access).
- Token Vault ist das neue „Kronjuwel" → besonders schützen.
- „Anonymisiert" ist oft nur pseudonymisiert (Re-Identifikation via Quasi-Identifier) → k-anonymity prüfen.
