# Third-party application access policy i GitHub-organisationer

Denne guide beskriver, hvordan man kan give tredjepartsapplikationer adgang til data i sin GitHub-organisation.

Når man opretter en organisation på GitHub, følger de tredjepartsapplikationer, man har givet adgang til sin personlige konto, **ikke automatisk med**.

Ønsker man at bruge tredjepartsapplikationer – f.eks. IntelliJ – i organisationen, kræver det derfor følgende trin:

---

## Trin 1: Gå til organisationens indstillinger

Fra organisationens forside, vælg **Settings**.

<img src="assets/01-go-to-organization-settings.png" alt="Go to organization settings" width="900">

---

## Trin 2: Find OAuth App Policy

I menuen til venstre, gå til **OAuth app policy**.

<img src="assets/02-go-to-oauth-app-policy.png" alt="Go to OAuth app policy" width="900">

---

## Trin 3: Vælg tilgangsmetode

Herfra er der to muligheder:

1. **Fjern alle restriktioner** – giver adgang for alle tredjepartsapplikationer, som organisationens medlemmer allerede har godkendt på deres egne konti.  
2. **Godkend specifikke applikationer** – vælg manuelt hvilke applikationer, der må tilgå organisationens data.

---

## Option 1 – Fjern alle restriktioner

Klik på **Remove restrictions**.

<img src="assets/11-remove-restrictions.png" alt="Remove restrictions" width="900">

Bekræft derefter valget, når GitHub beder om det.

<img src="assets/12-confirm-removal.png" alt="Confirm removal" width="900">

Restriktionerne er nu fjernet.

<img src="assets/13-restrictions-removed.png" alt="Restrictions removed" width="900">

---

## Option 2 – Godkend specifikke applikationer

Følg linket til dine egne autoriserede tredjepartsapplikationer.

<img src="assets/21-go-to-your-authorized-applications.png" alt="Go to your authorized applications" width="900">

*(Alternativt: Gå til din personlige konto → **Settings** → **Applications** → **Authorized OAuth Apps**).*

Find og vælg den applikation, du ønsker at give adgang til – f.eks. IntelliJ.

<img src="assets/22-locate-application.png" alt="Locate application" width="900">

Klik på **Grant** ud for den organisation, som applikationen skal have adgang til.

<img src="assets/23-grant-app-access.png" alt="Grant application access" width="900">

Applikationen vil nu fremgå som **Approved**.

<img src="assets/24-application-approved.png" alt="Application approved" width="900">

Gentag ovenstående trin for hver applikation, du ønsker at autorisere i organisationen.
