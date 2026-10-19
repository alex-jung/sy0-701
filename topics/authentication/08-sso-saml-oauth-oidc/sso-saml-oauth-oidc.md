# Übung 08 – SSO: SAML / OAuth2 / OIDC

**Schwierigkeit: 8/10 · Dauer: ca. 90 Min.**

## Lernziele

- SSO/Federation verstehen und SAML, OAuth2, OIDC abgrenzen
- Einen Test-IdP (Keycloak) betreiben und einen OIDC-Login durchspielen
- AuthN vs. AuthZ bei diesen Protokollen klar trennen

## Theorie

**Federation/SSO** erlaubt Login bei vielen Diensten über **einen** zentralen **Identity Provider (IdP)**. Drei Schlüsselbegriffe:

- **SAML 2.0:** XML-basiert, Enterprise-/Web-SSO. **IdP** stellt eine signierte **Assertion** aus, die der **Service Provider (SP)** prüft. Fokus: **Authentifizierung** (wer bist du) + Attribute.
- **OAuth 2.0:** **Autorisierungs**-Framework (Delegation). Eine App erhält ein **Access Token**, um **im Namen** des Nutzers auf eine API zuzugreifen – es sagt **nicht**, „wer eingeloggt ist". OAuth ist **keine** Authentifizierung.
- **OIDC (OpenID Connect):** eine **Authentifizierungs**-Schicht **auf** OAuth2; liefert zusätzlich ein **ID Token (JWT)** mit Identitäts-Claims → modernes Web-/App-SSO.

Rollen/Flows: Authorization Code Flow (+PKCE), Tokens (access/refresh/ID), Scopes, Redirect-URIs. Typische Risiken: offene Redirects, Token-Leak, fehlende Signatur-/Audience-Prüfung, SAML-Signature-Wrapping.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Keycloak (Container) | Test-IdP (SAML/OIDC) |
| Browser + DevTools | Flow/Tokens beobachten |
| `jwt`/CyberChef | JWT (ID Token) dekodieren |

## Lab-Setup

- Keycloak als Container; eine simple Demo-App (OIDC-Client) oder Keycloaks eigenes Account-Portal.

## Aufgabe (selbst lösen)

1. Starte Keycloak, lege einen **Realm**, einen **User** und einen **OIDC-Client** an.
2. Spiele den **Authorization Code Flow** durch und fange das **ID Token** ab; dekodiere das JWT und benenne Claims (`iss`, `sub`, `aud`, `exp`).
3. Erkläre an deinem Flow den Unterschied **OAuth2 (Access Token, Autorisierung)** vs. **OIDC (ID Token, Authentifizierung)**.
4. Beschreibe für **SAML** die Rollen IdP/SP und die Assertion; nenne je ein Sicherheitsrisiko von SAML und OAuth/OIDC.

**Ziel:** ein funktionierender OIDC-SSO-Login mit dekodiertem ID Token + klare Abgrenzung SAML/OAuth2/OIDC und AuthN vs. AuthZ.

## SY0-701 Prüfungsbezug

- **1.0/4.0** Federation, SSO, SAML, OAuth2, OpenID Connect; IdP/SP; AuthN vs. AuthZ.
- Fallen: „OAuth ≠ Authentifizierung"; JWT-Claims; Redirect-URI-Validierung.
- Begriffe: *SSO/federation*, *IdP/SP*, *SAML assertion*, *OAuth2 access token*, *OIDC ID token/JWT*, *scopes*, *PKCE*.
