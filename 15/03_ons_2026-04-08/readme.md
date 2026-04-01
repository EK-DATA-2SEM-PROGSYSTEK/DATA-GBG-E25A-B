# Kickoff: Wishlist Projekt & Github Projects

## Beskrivelse
Officiel start på jeres mini-projekt "Wish list".
I bliver præsenteret for detaljerne i projektet.  
I mini-projektet skal vi bruge Github projects til projektstyring. 
## Forberedelse  
Se disse videoer om Github Projects:  
Overview:  
[Issues and Projects in GitHub](https://www.youtube.com/watch?v=fFrq28RY1SQ)  
Detaljerede forklaringer:  
[Getting started with GitHub Projects](https://www.youtube.com/watch?v=lzpcyYIbHqE&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=1)  
[Adding existing issues to GitHub Projects](https://www.youtube.com/watch?v=Wym76EjWKZw&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=2)  
[Creating issues in GitHub Projects](https://www.youtube.com/watch?v=-xM2MT0Nv8k&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=3)  
[DevOps Bytes - Using the iteration field with GitHub Projects](https://www.youtube.com/watch?v=iFrJs8abTWg&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=4)  
[DevOps Bytes - Create a priority field with GitHub Projects](https://www.youtube.com/watch?v=ZzXsmsfdJKM&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=5)  
[DevOps Bytes - Custom views with GitHub Projects](https://www.youtube.com/watch?v=28Hr5zxsPl8&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=6)  
[Issue Hierarchy with Sub-issues (opt-in beta)](https://www.youtube.com/watch?v=F42FN6cZmA4&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=8)  
[Issue Types (opt-in beta)](https://www.youtube.com/watch?v=2wVmcuCC1is&list=PLiO7XHcmTsldZR93nkTFmmWbCEVF_8F5H&index=9)  

Github organizations (giver jer mulighed for at være 'ligeværdige')  
[How to Create Github Organization (Full 2025 Guide)](https://www.youtube.com/watch?v=6Byb4wWpPSQ)

Ressourcer:  
[Third-party application access policy i GitHub-organisationer](resources/third-party-application-access.md)


## Læringsmål
Kunne anvende Github projects, herunder Issues til tracking af User stories og tasks.

## Indhold

### Github projects
Formålet med denne session er at lære, hvordan man bruger GitHub Projects til at organisere og styre et udviklingsprojekt.
I lærer at forbinde user stories (issues) med konkrete tasks (sub-issues), og hvordan Project boards kan bruges til at visualisere og følge fremdriften i arbejdet.  

### Repository
Et repository (eller repo) er selve projektet — her ligger din kode, dokumentation og workflows.
Et Project board og dets issues knyttes altid til ét eller flere repositories.  
### Issue (User Story)
Et issue bruges til at beskrive et stykke arbejde, typisk en user story, en feature request eller en bug.  
### Sub-issues (Tasks)
Et issue kan opdeles i mindre tasks, enten som afkrydsningsfelter i beskrivelsen eller som selvstændige issues, der linkes til hoved-issuet.  
### Project Board
Et Project i GitHub fungerer som en visuel Scrum-tavle, hvor du kan følge arbejdet fra idé til færdigt resultat.
Boardet kan have kolonner som fx:
- To do – opgaver der skal laves
- In progress – opgaver i gang
- Done – færdige opgaver

Kollonnerne er baseret på værdier i status field, som kan konfigureres under settings 

### Eksempel på User Stories og Tasks – Message App  
Repository: [message](https://github.com/EK-DATA-2SEM-PROGSYSTEK/message)  

Tabellen nedenfor viser et eksempel på, hvordan man kan dokumentere **user stories** og tilhørende **tasks** i et projekt.  
Strukturen kan bruges som grundlag for at oprette **Issues** og **Sub-issues** i GitHub, hvor hver *User Story* repræsenterer en funktionel del af systemet, og *Tasks* beskriver de konkrete udviklingsopgaver, der skal udføres.

| Type | Titel | Beskrivelse |
|------|--------|-------------|
| **User Story** | <span style="white-space: nowrap;">Vis beskeder</span> | Som bruger vil jeg kunne se alle beskeder, så jeg kan få et overblik over tidligere beskeder |
| Task | Implementér GET `/message` endpoint | Returnér alle beskeder som JSON |
| Task | Opret metode `getAllMessages()` i `MessageRepository` | Returnér liste over beskeder fra repository |
| **User Story** | <span style="white-space: nowrap;">Opret besked</span> | Som bruger vil jeg kunne oprette en besked, så jeg kan dele en besked med andre |
| Task | Implementér POST `/message` endpoint | Modtag besked fra bruger og gem i repository |
| Task | Valider input | Afvis tom tekst og returnér HTTP 400 |
| **User Story** | <span style="white-space: nowrap;">Slet besked</span> | Som bruger vil jeg kunne slette en besked, så jeg kan fjerne uønsket indhold |
| Task | Implementér DELETE `/message/{id}` | Fjern besked fra repository og returnér 204 |




## Aktiviteter
Efter projektpræsentationen skal I danne projektgrupper (15 min)
- Diskutere oplægget i jeres studiegrupper.
- Find inspiration fra tilsvarende apps på nettet, f.eks: https://min-oenskeseddel.dk/, https://oenskesedlen.dk/, https://onskeskyen.dk/da
- Lav orgnisations github og tilføj medlemmer
- Definér issue types i organisationen
- Opret et repo og et tihørende project
- Lav forslag til userstories for jeres "Wish list"
- Læg userstories i backlog i projects (table view)
