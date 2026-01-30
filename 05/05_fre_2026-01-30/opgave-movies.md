## Movie Opgave

### Introduktion
I denne opgave skal I lave API endpoints i en Spring Boot applikation, der kan anvendes til
at søge efter og oprette film i en database (implementeret med en ArrayList).


Applikationen skal være uden brugergrænseflade, dvs. uden en
tilknyttet html side. Operationerne skal i stedet returnere et ResponseEntity.

### Læringsmål
At forstå HTTP request og response
- At forstå opbygningen af en URL
- At udarbejde endpoints i en Spring Boot applikation
- At teste endpoints vha. HTTP Client værktøj i IntelliJ

### Spring Boot projekt
Opret et Spring Boot projekt og inkludér Spring Web. Husk at vælge Maven.

### Pakker i projektet.

Opret følgende pakkestruktur, som afspejler applikationens lagdelte arkitektur.

```text
src
 └── main
     └── java
         └── com.example.demo
             ├── controller
             ├── model
             ├── repository
             └── service
```

### Klasser i projektet

- Opret en klasse Movie i model package. Klassen skal indeholde to String attributter title og director og en int for id.


- Opret en klasse MovieRepository i repository package med annoteringen @Repository.
Tilføj en ArrayList til opbevaring af data. Opret nogle Movie objekter, som tilføjes til denne
ArrayList. Tilføj metoder som:
  - returnerer en liste med alle Movie objekter
  - returnerer en Movie objekt med et bestemt id
  - returnerer en liste af Movie objekter med en bestemt titel og/eller director




- Opret en klasse MovieService i service package med annoteringen @Service. 
Klassen skal indeholde metoder svarende til MovieRepository klassen
og delegere kald til relevante metoder i denne.


- Opret en MovieController klasse i controller package med annoteringen
@RestController, samt @RequestMapping(”movies”).
Lav nedenstående endpoints med funktionalitet, der returnerer et
ResponseEntity. 

<img src="assets/movie-api-swagger.png" alt="Web app overblik" width="500">

GET endpoint /movies har optional request parametre title og director. 

Lav endpoints ad gangen og afprøv endpoints med HTTP Client i IntelliJ.

Videreudvikling: Tilføj genre til Movie klasse og at kunne søge efter film ved genre.