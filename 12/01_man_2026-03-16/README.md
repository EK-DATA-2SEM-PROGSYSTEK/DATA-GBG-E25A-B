# Integrationstest med H2 database

## Beskrivelse
I dag skal vi se på, hvordan man bruger H2 databasen til integrationstest

## Forberedelse
Se denne video:  
[Spring Boot H2 Embedded Database Example - Java Junit Test H2 Database Tutorial](https://www.youtube.com/watch?v=ixIxXRoCr5w)  
Videoen er ikke helt up-to-date, men giver et god introduktion - inklusiv en naturoplevelse :smiley:


## Læringsmål
- at kunne forklare fordele ved at benytte H2 til test formål
- at kunne opsætte et testmiljø i Spring boot med anvendelse af H2

## Indhold
### Hvad er H2?
H2 er en lille, hurtig, Java-baseret relationel database, der kan køre in-memory (eller som fil) inde i din JVM-proces. Det gør den ideel til hurtige, integrationstests uden ekstern opsætning.  
Fordele ved at benytte H2 i tests:
- Lynhurtig opstart og nedlukning
- Ren database ved hvert test-run
- Ingen lokal serverdatabase at installere/vedligeholde
- Kompatibel med JDBC API (men der er små forskelle i sql syntaks ift f.eks. MySql, se [MySQL vs H2](https://www.geeksforgeeks.org/blogs/mysql-vs-h2/))
  
Vi bruger kun H2 i tests. Produktion/dev skal fortsat køre på den “rigtige” DB (fx MySQL).

### H2 dependency i pom.xml
H2 databasen benyttes ved at inkludere denne dependency i pom.xml 

```xml
<dependency>
   <groupId>com.h2database</groupId>
   <artifactId>h2</artifactId>
   <scope>test</scope>
</dependency>
```

<scope>test</scope> angiver at databasen kun skal være tilgængelig i testmiljøet
Der oprettes automatisk en database ´testdb’ med username = sa og password = ""  

Eksempelprojekt: [person_h2](https://github.com/EK-DATA-2SEM-PROGSYSTEK/person_h2)

### application-test.properties
Vi laver en selvstændig apllication-test.properties i test miljøet, der indeholde opsætningsparametre for H2 databasen.  
Filen placeres i /test/resources mappen

```
spring.datasource.url=jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=

# Vis SQL i logs (nyttigt i testfasen)
logging.level.org.springframework.jdbc.core.JdbcTemplate=DEBUG
logging.level.org.springframework.jdbc.core.StatementCreatorUtils=TRACE
```
```DB_CLOSE_DELAY=-1```  
Denne parameter betyder, at databasen ikke lukkes automatisk, selvom den sidste forbindelse til den bliver lukket.  
```DB_CLOSE_ON_EXIT=FALSE```  
Denne parameter sikrer, at databasen ikke lukker, når JVM'en (Java Virtual Machine) afsluttes.  

I et testmiljø bruges disse parametre for at sikre, at den indlejrede H2-database forbliver tilgængelig og i en kendt tilstand gennem hele test-livscyklussen, især når man kører en suite af integrationstests.  
### Test klasse

Test klassen placeres i mappen /test/java/com/example/person_h2
```java
package com.example.person_h2;

import com.example.person_h2.model.Person;
import com.example.person_h2.repository.PersonRepository;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD;

@SpringBootTest
@ActiveProfiles("test")
@Sql(scripts = "classpath:h2init.sql", executionPhase = BEFORE_TEST_METHOD)
class PersonRepositoryTest {

    @Autowired
    private PersonRepository repo;

    @Test
    void readAll() {
        List<Person> all = repo.findAll();

        assertThat(all).isNotNull();
        assertThat(all.size()).isEqualTo(2);
        assertThat(all.get(0).getName()).isEqualTo("Alice");
        assertThat(all.get(1).getName()).isEqualTo("Bob");
    }


    @Test
    void insertAndReadBack() {
        repo.save(new Person(3, "Carol"));
        var carol = repo.findById(3);
        assertThat(carol).isNotNull();
        assertThat(carol.getName()).isEqualTo("Carol");
    }
}
```
Disse tre annotations bruges ofte sammen til at skabe et robust og pålideligt integrationstestmiljø.

- @SpringBootTest starter en fuld Spring-kontekst.
- @ActiveProfiles("test") sikrer, at den starter med en konfiguration, der er skræddersyet til tests (f.eks. en in-memory database).
- @Sql klargør databasen ved at køre et script, der opretter skema og indsætter testdata, så testen kan udføres mod et kendt datasæt.

## h2init.sql
Sql initialiseringsfilen placeres i /test/resources mappen.
```sql
DROP TABLE IF EXISTS person;

CREATE TABLE person (
                        id INT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        email VARCHAR(150),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- init-data
INSERT INTO person (id, name, email) VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO person (id, name, email) VALUES (2, 'Bob',   'bob@example.com');
```
### Mappestruktur for testmiljø
```text

    ─ test/
      ├─ java/
      │  └─ com/
      │     └─ example/
      │         └─ person_h2/
      │              └─ PersonRepositoryTest.java    # @SpringBootTest + @Sql
      │              
      └─ resources/
         ├─ application-test.properties              # H2 properties
         └─ h2init.sql                               # DDL + init-data (køres før hver test via @Sql)
```

## Aktiviteter

- Fork projektet [person_h2](https://github.com/EK-DATA-2SEM-PROGSYSTEK/person_h2)    
- Klon dernæst projektet til din laptop.  
- Afprøv test lokalt og observér detailbeskeder i log vindue  
- Opret en CI pipeline lokalt i en .yml fil i .github/workflows
- Push til Github og observér afviling af job
