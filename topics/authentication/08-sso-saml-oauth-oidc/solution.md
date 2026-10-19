# Lösung – Übung 08: SSO (SAML/OAuth2/OIDC)

## 1. Keycloak-IdP

```bash
docker run -d --name keycloak -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin \
  quay.io/keycloak/keycloak:latest start-dev
# Admin-Konsole http://localhost:8080 -> Realm "lab", User "alex", Client "demo" (OIDC, Standard Flow)
```

## 2. Authorization Code Flow + ID Token

- Browser → `/realms/lab/protocol/openid-connect/auth?response_type=code&client_id=demo&redirect_uri=...&scope=openid`.
- Login → Redirect mit `?code=...` → App tauscht Code am **Token-Endpoint** gegen `access_token`, `id_token`, `refresh_token`.
- ID Token (JWT) dekodieren (CyberChef/`jwt`): Header (alg, kid) + Payload-Claims:
  - `iss` (Issuer = Keycloak-Realm), `sub` (User-ID), `aud` (Client `demo`), `exp`/`iat`, `preferred_username`.

## 3. OAuth2 vs OIDC

- **Access Token (OAuth2):** berechtigt die App, **APIs im Namen** des Nutzers aufzurufen (Scopes) – sagt nichts Verlässliches über „wer ist eingeloggt".
- **ID Token (OIDC):** beweist dem Client die **Identität** des Nutzers (signiertes JWT mit Claims) → das ist die **Authentifizierung**. OIDC = AuthN-Layer auf OAuth2 (AuthZ).

## 4. SAML + Risiken

- **SAML:** Nutzer will zum **SP** (App). SP leitet zum **IdP**, der nach Login eine **signierte XML-Assertion** (wer + Attribute) zurückgibt; SP prüft Signatur/Zeit/Audience → Zugriff.
- Risiken: **SAML Signature Wrapping**/fehlende Signaturprüfung; bei **OAuth/OIDC** offene **Redirect-URIs**, Token-Leak, fehlende `aud`/Signatur-Validierung, Authorization-Code-Interception (→ **PKCE**).

## Hinweise / Troubleshooting

- `redirect_uri` muss exakt registriert sein, sonst „Invalid redirect".
- Public Clients (SPA/Mobile) immer mit **PKCE**.
- ID Token nicht als API-Zugriffstoken verwenden (dafür Access Token); Signatur (`kid`/JWKS) prüfen.
