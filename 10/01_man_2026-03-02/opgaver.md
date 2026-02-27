# Opgaver: Fra domænebeskrivelse til relationel model

Når vi designer en database, starter vi med en domænebeskrivelse – en tekst der beskriver virkeligheden.

Arbejdsprocessen består af fire trin:

### Trin 1 – Identificér entiteter

Find centrale navneord i teksten.

Spørg:  
- Er dette noget med selvstændig eksistens?
- Skal vi gemme information om det?
- Har det flere forekomster?

Eksempler:  
- virksomhed
- afdeling
- medarbejder


Disse bliver kandidater til entiteter.

### Trin 2 – Identificér attributter

Nu spørger vi for hver entitet:

- Hvilke oplysninger skal vi gemme?
- Hvad beskriver entiteten?

Eksempel:

MEDARBEJDER  
- medarbejder_id
- navn
- email
- ansættelsesdato

AFDELING
- afdeling_id
- navn
- lokation

Vigtige overvejelser:

- Find en egnet primærnøgle
- Undgå at blande relationer ind som attributter
- Overvej om en attribut i virkeligheden burde være en selvstændig entitet og vice versa
  - Entiteter er “ting”.
  - Attributter er “egenskaber ved ting”.

### Trin 3 – Identificér relationer og kardinalitet

Find udsagnsord og sammenhænge i teksten.

Spørg:
- Hvordan hænger entiteterne sammen?
- Hvor mange kan være involveret?
- Er relationen obligatorisk eller valgfri?

Eksempel:
- En afdeling har mange medarbejdere
- En medarbejder tilhører én afdeling

Dette fører til den konceptuelle E/R-model.

Vigtigt:
Ingen fremmednøgler endnu.

### Trin 4 – Oversæt til logisk (relationel) model

Nu omsættes modellen til:

- Tabeller
- Primærnøgler (PK)
- Fremmednøgler (FK)
- Join-tabeller ved mange–mange relationer

Regler:

- 1–mange → FK på mange-siden
- Mange–mange → join-tabel
- 1–1 → FK på den mest afhængige side

Herefter skriver tabellerne op i strukturel form:  
```
TABELNAVN(
  attribut PK,
  attribut FK → ANDEN_TABEL.attribut
)
```
Bemærk: Ingen SQL - kun struktur.

I de to følgende opgaver skal du udarbejde:  
1️ Konceptuel E/R-model
- Identificér alle entiteter
- Fastlæg relationer og kardinalitet
- Vis optionalitet

Ingen PK/FK

2️ Logisk (relationel) model
- Tilføj primærnøgler
- Placér fremmednøgler korrekt  

3️ Opskrivning af tabeller
- Tabellenavne
- Attributter
- PK og FK tydeligt markeret


## Opgave 1

En virksomhed har en række afdelinger (og hver afdeling er en del af virksomheden).
I hver afdeling er der en eller flere medarbejdere (og hver medarbejder er kun knyttet til én afdeling).
Nogle medarbejdere har en firmabil (og en firmabil tilhører altid kun én medarbejder).
En medarbejder kan have en ansættelseshistorik (og en historik er altid knyttet til en specifik medarbejder).

## Opgave 2

En virksomhed har en række udviklingsprojekter.
I hvert udviklingsprojekt indgår som oftest en eller flere softwarelicenser. En softwarelicens er knyttet til en bestemt IT-leverandør. En IT-leverandør tilbyder typisk flere forskellige softwarelicenser.
Et udviklingsprojekt har en projektleder tilknyttet. En medarbejder kan være projektleder på flere projekter.
Der er oftest knyttet en eller flere menige medarbejdere til et udviklingsprojekt.

