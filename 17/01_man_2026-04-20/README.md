# README og CONTRIBUTING

## Beskrivelse
Vi ser på bruge af README og CONTRIBUTING filerne i et Github projekt.  
Begge disse filer anvender Markdown (.md), er et letvægts markup-sprog, hvor man bruger simple tegn til at formatere tekst.

## Forberedelse
Se denne videoer:  
[Learning GitHub - How to Write MarkDown](https://www.youtube.com/watch?v=eJojC3lSkwg)  
Nemmest at Skrive direkte i GitHub, hvor der også er preview

Resourcer:  
[Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)


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

CONTRIBUTING.md kommer oprindeligt fra open-source verdenen, og nedenstående trin er således for et open-source projekt
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

#### Den interne model (Ingen forks) 
De fleste virksomheder (hvor alle udviklere er ansat af samme firma) bruger man ikke forks. Her arbejder alle direkte i det samme centrale repository (repo).
- Shared Repository Model: Alle teammedlemmer har skriveadgang til firmaets repo.
- Feature Branches: I stedet for at forke, opretter man en ny "branch" direkte i firmaets repo (f.eks. git checkout -b feature/ny-log-in-side).
- Pull Request: Man laver stadig en Pull Request, men den går fra én branch til en anden (f.eks. fra feature/ny-log-in-side til main) inden for det samme projekt.

#### Den eksterne/konsulent model (Forks bruges)
Der er dog situationer i erhvervslivet, hvor forks stadig giver god mening:
- Eksterne konsulenter: Hvis et firma hyrer et eksternt bureau, vil de ofte ikke give konsulenterne direkte adgang til deres "hellige" kildekode-repo. Konsulenterne forker projektet til deres egen organisation, arbejder der, og sender en Pull Request tilbage til kunden.
- Sikkerhed og isolation: Store tech-giganter som Google eller Meta bruger nogle gange en fork-model internt for at sikre, at ingen ved et uheld kommer til at slette noget i hoved-projektet (selvom branch-beskyttelse i dag ofte løser dette).

#### Hvorfor foretrækker firmaer "Branches" frem for "Forks"?
- Overblik: Det er nemmere for teamet at se alle igangværende opgaver ét sted.
- CI/CD: Det er lettere at opsætte automatiske tests (Continuous Integration), når alle branches lever i det samme repo.
- Rettighedsstyring: Det er simplere at styre adgangen centralt.

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

### Kort introduktion til Markdown
Markdown er et letvægts markup-sprog, hvor man bruger simple tegn til at formatere tekst. Det bruges til at skrive dokumentation som fx:
README.md og CONTRIBUTING.md  
Det gør det nemt at skrive struktureret tekst, som samtidig bliver pænt vist på GitHub.

#### Grundlæggende syntaks

**Overskrifter**
```
# H1
## H2
### H3
```
# H1
## H2
### H3

**Tekstformatering**
```
**Fed tekst**
*Kursiv tekst*
~~Gennemstreget~~
```
**Fed tekst**  
*Kursiv tekst*  
~~Gennemstreget~~  

Bemærk: ny linje fås ved to spaces efter hinanden



**Lister**  
**Punktliste**
```
- Punkt 1
- Punkt 2
```
- Punkt 1
- Punkt 2
  
**Nummereret liste**
```
1. Første
2. Anden
```
1. Første
2. Anden


**Links**
```
[Google](https://google.com)
```
[Google](https://google.com)  

**Billeder**
```
![Alt tekst](billede.png)
```
![Alt tekst](billede.png)


**Kode**  
**Inline kode**
```
`System.out.println("Hello");`
```
`System.out.println("Hello");`


**Kodeblok**
```
```java
System.out.println("Hello");
```
```java
System.out.println("Hello");
```

## Tabeller
```
| Overskrift 1 | Overskrift 2 | Overskrift 3 |
| :--- | :---: | ---: |
| Venstrestillet | Centreret | Højrestillet |
| Række 2 | Data | Data |
```
| Overskrift 1 | Overskrift 2 | Overskrift 3 |
| :--- | :---: | ---: |
| Venstrestillet | Centreret | Højrestillet |
| Række 2 | Data | Data |


## Aktiviteter
