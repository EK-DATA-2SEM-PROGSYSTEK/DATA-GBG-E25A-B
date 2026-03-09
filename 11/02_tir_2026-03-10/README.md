# Funktionelle interfaces, JdbcTemplate og Spring 2

## Beskrivelse

Vi skal arbejde videre med JdbcTemplate og Springboot. I den forbindelse skal vi se nærmere på funktionelle interfaces, og hvordan de bruges i Spring-biblioteket. 
## Forberedelse

Se denne video om [Funktionelle interfaces](https://www.youtube.com/watch?v=5D6LPl1NsbI)

Kig på dokumentationen for [JdbcTemplate](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/jdbc/core/JdbcTemplate.html)
## Læringsmål
- Kan forklare hvad et funktionelt interface er, og hvordan det optræder i Spring.
- Kan bruge JdbcTemplate (fortsat)
- Kan forstå og forklare andre centrale biblioteksklasser og metoder der er involveret i at få forbindelsen mellem Springboot og databasen til at virke

## Indhold

Funktionelle interfaces bruges flere steder i de biblioteker der hører til Springboot.

De bruges sammen med lambda-expressions, som I muligvis er stødt ind i på 1. semester. Det er vigtigt at forstå dem for at kunne læse kode som andre har skrevet (eller AI har givet jer), og selvfølgelig for at  kunne skrive dem selv.

Strukturen i en lambda-expression er 

<img src="lambdajava8.png" alt="lambda" width="900">
