# README og CONTRIBUTING

## Beskrivelse
Vi ser på bruge af README og CONTRIBUTING filerne i et Github projekt.  
Begge disse filer anvender Markdown (.md), er et letvægts markup-sprog, hvor man bruger simple tegn til at formatere tekst.

## Forberedelse
Se disse videoer:  
[Learning GitHub - How to Write MarkDown](https://www.youtube.com/watch?v=eJojC3lSkwg)  
Nemmest at Skrive direkte i GitHub, hvor der også er preview



## Læringsmål
- At kunne forklare hvad README og CONTRIBUTING anvendes til 
- At kunne forklare opbygning af Markdown sprog
- At kunne udarbejde en README.md fil med relevant information til et github-projekt
- At kunne udarbejde en CONTRIBUTING.md med relevant information til et github-projekt


## Indhold
### Hvad er en README?

README.md er den første fil, man møder i et GitHub repository.
Den forklarer:

- Hvad projektet gør
- Hvordan man installerer og bruger det
- Hvilke teknologier der anvendes

README er rettet mod brugere og udviklere.  

Typisk struktur for README
1. Titel og beskrivelse
2. Features  
3. Teknologier
4. Installation
5. Brug
6. Bidrag

Eksempel: Touristguide projektet:  

---
### Tourist Guide

En webapplikation der viser turistattraktioner i Danmark.

### Features
- Se turistattraktioner
- Søg efter by
- Tilføj nye attraktioner

### Teknologier
- Java 21
- Spring Boot
- Thymeleaf
- MySQL

### Installation

git clone https://github.com/brugernavn/projekt.git  
cd projekt  
mvn spring-boot:run

### Brug

Åbn http://localhost:8080

### Bidrag

Se CONTRIBUTING.md for retningslinjer.  

---

Best practices for README
- Kort og præcis
- Nem at komme i gang med
- Indeholder konkrete eksempler
- Har en tydelig struktur


### Hvad er en CONTRIBUTING?

CONTRIBUTING.md beskriver hvordan man bidrager til projektet:

- Git workflow
- Branching strategi
- Pull Requests
- Kodestandarder

Den er rettet mod udviklere  
### Typisk indhold i CONTRIBUTING
#### Workflow
1. Fork repository
2. Opret branch
3. Lav ændringer
4. Commit
5. Push
6. Opret Pull Request

#### Branching strategi
- main → stabil kode
- dev → udvikling
- feature/* → nye features
#### Coding guidelines
- Brug meningsfulde navne
- Følg Java conventions
- Ingen hardcodede værdier
#### Pull Requests
- Beskriv ændringer
- Link til issue
- Få review før merge
### Best practices for CONTRIBUTING
- Klart og simpelt workflow
- Tydelige regler
- Ensartet struktur
- Let at følge for nye udviklere

### Samspillet mellem README og CONTRIBUTING

| README | CONTRIBUTING |
|--------|-------------|
| Forklarer projektet | Forklarer samarbejde |
| Rettet mod brugere | Rettet mod udviklere |
| Hvordan man bruger systemet | Hvordan man bidrager |
| Første indtryk | Arbejdsregler |

- README svarer på: “Hvad er det her?”
- CONTRIBUTING svarer på: “Hvordan arbejder vi med det?”

## Aktiviteter
