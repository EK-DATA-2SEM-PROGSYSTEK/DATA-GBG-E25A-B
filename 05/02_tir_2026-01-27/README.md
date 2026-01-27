# Spring Boot & Turistguide 1
## Underviser: Signe

## Beskrivelse

I skal kode en lidt mere kompleks arkitektur i et Spring Boot projekt, og samtidig repetere det stof der blev gennemgået i går om GET mappings.

Vi skal også se på hvordan man laver POST mappings. 

Dernæst skal I teste både GET og POST endpoints med testværktøjet “HTTP Client” i IntelliJ.


I skal i gang med at lave den første del af Turistguide-projektet, som I får udleveret i dag og skal aflevere på onsdag i næste uge (4/2).


## Forberedelse

Se videoerne

[What are JSON files (in less than 3 minutes)](https://www.youtube.com/watch?v=jxvFT6VXty8)

[Spring Boot API @PostMapping & @RequestBody : Step-by-Step Guide](https://www.youtube.com/watch?v=vHEGlrPTFdc&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=5) (13 min)

[Spring ResponseEntity : Customizing the response in Spring Boot](https://www.youtube.com/watch?v=qo56g2PlS5o&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=6) (3 min) 

Vær opmærksom på at vi ikke tester endpoints med PostMan, men med HTTP Client som er indbygget i IntelliJ.






## Læringsmål

- at kunne lave struktur, klasser og bruge annotations til både @Controller, @Service og @Repository
- kunne bruge @RequestBody annotationen
- at kunne lave både GET og POST mappings i Spring Boot
- at kunne teste både GET og POST endpoints i Spring Boot med “HTTP Client” i IntelliJ


## Indhold

###  Struktur i en Spring Boot applikation
```text
src
 └── main
     └── java
         └── com.example.demo
             ├── controller
             ├── service
             ├── repository
             └── model
```

- `controller` håndterer HTTP-forespørgsler
- `service` indeholder forretningslogik
- `repository` håndterer dataadgang
- `model` indeholder klasser der beskriver applikationens data, dvs de data der flyder imellem client og server

Det er vigtigt at alle pakker ligger under projektets rod-pakke, her: com.example.demo

## Aktiviteter

Opgave 1: [@Controller og ResponseEntity](opgave_annotations_@restcontroller_@controller.md)

Opgave 2: [Test i HTTP Client](opgave_http_test.md)

Opgave 3: [Spring struktur](opgave_spring.md)

Opgave 4: [PostMapping](opgave_postmapping.md)





