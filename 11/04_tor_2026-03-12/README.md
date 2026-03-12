# Database Deployment

---

## Beskrivelse

Vi deployer en database på Azure og kigger på integration med vores Spring Boot web app.

---

## Læringsmål

- At kunne deploye en mysql database

- At kunne integrere en deployed database i en deployed Spring Boot applikation

---

## Indhold

- Spring profiles
- Database deployment på Azure
- Integration med en Spring Boot applikation

---

### Overblik

![Overblik](assets/overblik.png)

---

### Spring Profiles

Spring Profiles er en måde i Spring/Spring Boot til at konfigurere en applikation, afhængigt af hvilket miljø den kører i.

Der kan være forskellige konfigurationer (fx databaseforbindelse, logging, sikkerhed) til:
- development (lokal udvikling)
- test (testmiljø eller CI/CD pipeline)
- production (driftsmiljø)


Der kan oprettes forskellige `application-{profile}.properties` filer til hvert miljø, fx:
- `application-dev.properties` (lokal udvikling)
- `application-test.properties` (testmiljø)
- `application-prod.properties` (produktionsmiljø)

`application.properties` er fælles for alle profiler

Profiles kan aktiveres ved at sætte `spring.profiles.active` property i `application.properties` filen f.eks.:
```spring.profiles.active=dev```

<img src="assets/spring-profiles.png" alt="Spring Profiles" width="900">

---

Environment variables skal angives i de forskellige kontekster dvs. localhost, github og Azure.

Husk database urlen skal inkludere protokollen f.eks `jdbc:mysql://localhost:3306/my_database_name` 

---

## Database Deployment på Azure

### Deployed Database

<img src="assets/deployed-database-workbench.png" alt="Deployed DB MySQL Workbench" width="900">

---

Deployed applikation med database integration

<img src="assets/deployed-app-db.png" alt="Deployed App with DB" width="900">  


---


### [Opgave: Opret en MySQL Database Server på Azure](azure_mysqlserver_guide.md)

---

### [Opgave: Deploy en MySQL database på Azure](opgave_database_deployment.md)

---

### [Opgave: Integration med deployed application](opgave-database-integration.md)

---
