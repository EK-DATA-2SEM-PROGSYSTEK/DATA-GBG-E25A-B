# Introduktion til 2. semester og Spring Boot
## Underviser: Signe
## Beskrivelse
### Semestret – praktisk info
Vi går igennem semesterplanen, de obligatoriske opgaver, kravene til eksamen og hvad I ellers måtte have af spørgsmål til 2. semester.


### Nye teknologier
Vi tegner i dag det store billede over de komponenter og teknologier, I kommer til at arbejde med i løbet af semesteret:

- Browser (HTML, CSS), Netværksprotokol (HTTP), Servere (Tomcat og MySQL)
- Spring Boot Web MVC Framework (Java web applikationer)
-Database med JDBC og SQL
- Github Actions (automatisering af CI/CD workflow)
- Azure (deployment af webapplikation og database i skyen)
- Github Projects
 
I forhold til 1. semester går vi fra tekstbaserede stand-alone applikationer til webapplikationer, og fra at persistere programmerne i tekstfiler til at bruge en database.

Hvad angår systemudvikling skal I stadig bruge SCRUM som udviklingsmetode, men nu ved hjælp af værktøjet Github Projects.
I skal desuden optimere og automatisere jeres udviklingsproces ud fra CI/CD principperne (Continuous Integration og Continuous Delivery)


### Spring Boot, endpoints og HTTP protokollen
Vi ser på hvad et endpoint er og laver vores første endpoints i Spring Boot. Desuden skal vi snakke om HTTP protokollen og hvordan den virker. Vi kommer også ind på JSON, som er det format vi sender data i i første omgang.

## Forberedelse


Se disse videoer:  
 
[HTTP explained in 3 minutes](https://www.youtube.com/watch?v=KvGi-UDfy00)

[Spring Boot REST API - Getting Started | Chapter-1 ](https://www.youtube.com/watch?v=A86pk2n-u9I&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=1)  
[Mastering @RequestMapping Annotation in Spring Boot | Chapter-2](https://www.youtube.com/watch?v=OhRstcHvIM4&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=2)  
[Mastering @RequestParam Annotation: A Step-by-Step Guide | Chapter-3](https://www.youtube.com/watch?v=TJG-LTLZo5s&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=3)  
[@PathVariable Annotation: Everything You Need to Know | Chapter-4](https://www.youtube.com/watch?v=BVRRfmBHKSU&list=PLpxcSt9FGVVGRjn_Hgrxl6WJv4aFUDjKE&index=4)


## Læringsmål
- Forstå HTTP protokollens virkemåde
    - request og response message
    - GET og POST kommandoer
    - statuskoder
- Forstå opbygningen af en URL inkl.
    - request parametre,
    - path variable,
- Kunne lave get og post-endpoints i Spring Boot, herunder brug af annoteringerne:
    - `@Controller` (`@RestController`)
    - `@RequestParam`
    - `@PathVariable`
- Teste endpoints i HTTP client værktøjet i IntelliJ
--- 
