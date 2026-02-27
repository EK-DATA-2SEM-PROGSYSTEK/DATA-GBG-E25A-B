# Opgaver: Fra domænebeskrivelse til relationel model

Når vi designer en database, starter vi med en domænebeskrivelse – en tekst der beskriver virkeligheden.

Arbejdsprocessen består af tre trin:

### Trin 1 – Konceptuel E/R-model

Her identificerer du:

- Entiteter (navneord)
- Relationer (udsagnsord)
- Kardinalitet (1–1, 1–mange, mange–mange)
- Optionalitet (obligatorisk/valgfri)

Vigtigt:
Ingen fremmednøgler.
Ingen tabeller.
Kun struktur og forretningsregler.

### Trin 2 – Logisk (relationel) model

Her oversætter du E/R-modellen til den relationelle datamodel:

- Tabeller
- Primærnøgler (PK)
- Fremmednøgler (FK)
- Join-tabeller ved mange–mange relationer

Regler:

- 1–mange → FK på mange-siden
- Mange–mange → join-tabel
- 1–1 → FK på den mest afhængige side

### Trin 3 – Opskrivning af tabeller

Her skriver du tabellerne op i strukturel form:  
```
TABELNAVN(
  attribut PK,
  attribut FK → ANDEN_TABEL.attribut
)
```
Bemærk: Ingen SQL - kun struktur.

## Opgave 1

En virksomhed har en række afdelinger (og hver afdeling er en del af virksomheden).
I hver afdeling er der en eller flere medarbejdere (og hver medarbejder er kun knyttet til én afdeling).
Nogle medarbejdere har en firmabil (og en firmabil tilhører altid kun én medarbejder).
En medarbejder kan have en ansættelseshistorik (og en historik er altid knyttet til en specifik medarbejder).

Du skal udarbejde:  
1️ Konceptuel E/R-model
- Identificér alle entiteter
- Fastlæg relationer og kardinalitet
- Vis optionalitet

Ingen PK/FK

2️ Logisk (relationel) model
- Tilføj primærnøgler
- Placér fremmednøgler korrekt
- Begrund håndtering af 1–1 relationen (firmabil)

3️ Opskrivning af tabeller
- Tabellenavne
- Attributter
- PK og FK tydeligt markeret

Ingen SQL

## Opgave 2

En virksomhed har en række udviklingsprojekter.
I hvert udviklingsprojekt indgår som oftest en eller flere softwarelicenser. En softwarelicens er knyttet til en bestemt IT-leverandør. En IT-leverandør tilbyder typisk flere forskellige softwarelicenser.
Et udviklingsprojekt har en projektleder tilknyttet. En medarbejder kan være projektleder på flere projekter.
Der er oftest knyttet en eller flere menige medarbejdere til et udviklingsprojekt.

Du skal udarbejde:  
1️ Konceptuel E/R-model

- Identificér entiteter
- Fastlæg kardinalitet
- Overvej om projektleder og menige medarbejdere skal modelleres som roller

2️ Logisk (relationel) model
- Placér primærnøgler
- Placér fremmednøgler
- Opret join-tabeller ved mange–mange relationer

Forklar dine valg

3️ Opskrivning af tabeller

- Tabellenavne
- Attributter
- PK og FK tydeligt angivet

Ingen SQL  
# Opgave: ER modellering

## Opgave 1

Lav en ER model over nedenstående:

- En virksomhed har en række afdelinger (og hver afdeling er en del af virksomheden). 
- I hver afdeling er der en eller flere medarbejdere (og hver medarbejder er kun knyttet til én afdeling).
- Nogle medarbejdere har en firmabil (og en firmabil tilhører altid kun én medarbejder).
- En medarbejder kan have en ansættelseshistorik (og en historik er altid knyttet til specifik medarbejder).

## Opgave 2

Lav en ER model over nedenstående:
- En virksomhed har en række udviklingsprojekter
- I hvert udviklingsprojekt indgår som oftest en eller flere softwarelicenser. En softwarelicens er knyttet til en bestemt IT-leverandør. En IT leverandør tilbyder typisk flere forskellige softwarelicenser.
- Et udviklingsprojekt har en projektleder tilknyttet. En medarbejder kan være projektleder på flere projekter.
- Der er oftest knyttet en eller flere menige medarbejdere til et udviklingsprojekt.


