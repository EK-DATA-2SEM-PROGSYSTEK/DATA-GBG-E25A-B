### Opgave: Fejlhåndtering i en Spring Boot WebMVC applikation

Formålet med opgaven er at illustrere hvor og hvordan fejl og exceptions håndteres i en Spring Boot WebMVC applikation.

Opgave skal gennemføres parvis og diskuter jeres observationer undervejs.

1. Fork [exception-profile](https://github.com/EK-DATA-2SEM-PROGSYSTEK/exceptional-profile.git) repoen.
2. Kør applikationen og undersøg funktionaliteten ved at udføre forskellige CRUD operationer, 
dvs. opret en ny profil, rediger en eksisterende profil og slet en profil.

Fejlhåndtering

I det følgende skal der fremprovokeres forskellige fejl. 
For hver fejl skal der noteres hvilke fejlbeskeden brugeren ser 
og der skal undersøges i koden hvor fejlen genererer en exception, 
hvilke type exception er kastet og hvor og hvordan den bliver håndteret dvs. hvilket lag.


3. Fremprovoker følgende fejl, observer hvilken fejlbesked brugeren ser, 
hvilken type exception der bliver kastet og hvor og hvordan den bliver håndteret.

|   | Fejl                                          | Hvor kastes exception (hvilket lag) | Exception Type | Hvor og hvordan håndteres den |
|---|-----------------------------------------------|-------------------------------------|--------------------------------|-------------------------------|
| 1 | Ugyldige inputdata (fx tomt navn eller email) |                                     |                                |                               |
| 2 | Ugyldigt email format                         |                                     |                                |                               |
| 3 | Name eller email eksisterer allerede          |                                     |                                |                               |
| 4 | Profil ikke fundet                            |                                     |                                |                               |
| 5 | "Forkert url"                                 |                                     |                                |                               |

NB. Fejl nr.4 Profil ikke fundet kan fremtvinges ved at manipulere urlen og skrive 
f.eks.localhost:8080/exprofiles/111/edit i browseren.

Fejl nr. 5 "Forkert" url kan fremtvinges ved at skrive f.eks localhost:8080/exprofiles/x