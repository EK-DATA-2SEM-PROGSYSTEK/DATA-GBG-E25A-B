
# JDBCtemplate og Spring 1, Turistguide del 3

## Beskrivelse
I dag ser vi på hvordan man får adgang til data i en database fra et Java program. Vi skal bruge JdbcTemplate, som er en del af Springboot, til dette.
Vi starter med en standalone applikation som viser de basale ting. Herefter ser vi på hvordan vi kan integrere JDBCTemplate i en Spring boot applikation


## Forberedelse
Se denne video:  
[Spring JDBC Template Tutorial: Learn to build a full CRUD application in Spring Boot](https://www.youtube.com/watch?v=0uLqdBpYAVA&list=PLEeqf0uSZqXutWJ-xNpSs5X4WdwKqBmab)  

Resourcer:  
[JDBC standalone eksempel]()  
[JDBC Spring Boot eksempel]()

## Læringsmål
- Kan lave simpel databaseapplikation, som forbinder et Java Springboot-projekt med en MYSQL database.
- Kan bruge JdbcTemplate, herunder forklare centrale biblioteksklasser og metoder der er involveret i at få forbindelsen mellem Springboot og databasen til at virke
- Kan integrere brugen af JDBC Teplate i en Spring Boot applikation, herunder brug af environment variable  

## Indhold  
Vi skal arbejde med databaseadgang i Spring Boot ved hjælp af JDBC Template. Fokus er på at forstå, hvordan data bevæger sig mellem MySQL-tabeller og Java-objekter.

Undervisningen er bygget op omkring repository-klasser, hvor al databaseadgang samles ét sted, så koden er let at forstå, teste og videreudvikle.

### Opsætning i Spring Boot: DataSource, dependencies og Dependency Injection

Før vi kan bruge JdbcTemplate, skal Spring Boot have to ting på plads:

- Dependencies til JDBC + MySQL (så Spring kan oprette en DataSource)
- DataSource-konfiguration (URL, bruger, password)
- Et repository, hvor vi injicerer JdbcTemplate (Dependency Injection)

#### 1) Dependencies (pom.xml)

I et Maven-projekt skal man som minimum have disse dependencies:  
```
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>

<dependency>
  <groupId>com.mysql</groupId>
  <artifactId>mysql-connector-j</artifactId>
  <scope>runtime</scope>
</dependency>
```

spring-boot-starter-jdbc giver bl.a. JdbcTemplate, og MySQL-driveren gør, at Spring kan forbinde til MySQL.  

#### 2) DataSource-konfiguration (application.properties)

Spring Boot opretter automatisk en DataSource, hvis spring.datasource.* er sat.

Eksempel med environment variables (anbefalet):  
```
spring.datasource.url=${DB_URL}
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
```
Hvis du lokalt vil teste “hurtigt”, kan du hardcode (men det bør undgås i delte repos):  
```
# kun til lokal test (ikke anbefalet i git)
spring.datasource.url=jdbc:mysql://localhost:3306/your_db?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=secret
```
DataSource-konfiguration er “input” til Spring Boot, som derefter kan levere en færdig JdbcTemplate til din kode.  

#### 3) Dependency Injection i repository (JdbcTemplate)

Når Spring Boot har oprettet DataSource, opretter den også en JdbcTemplate-bean.
Den kan vi injicere i vores repository via constructor injection:  
```
@Repository
public class PersonRepository {

    private final JdbcTemplate jdbcTemplate;

    public PersonRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // database-metoder kommer her...
}
```

#### Læsning af data med JdbcTemplate

Vi starter med at hente data fra databasen ved hjælp af SQL-SELECT.
JdbcTemplate håndterer forbindelsen til databasen, mens vi selv skriver SQL’en.

Eksempel: hent alle personer fra databasen  
```
public List<Person> findAll() {
    String sql = "SELECT id, name, age FROM person";
    return jdbcTemplate.query(sql, new PersonRowMapper());
}
```
Her returneres en liste af Person-objekter, som oprettes ved hjælp af en RowMapper:  
```
public class PersonRowMapper implements RowMapper<Person> {

    @Override
    public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Person(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("age")
        );
    }
}
```

#### Hent ét objekt baseret på id
Når vi forventer præcis én række fra databasen, kan vi skrive en metode, der henter et objekt ud fra primærnøglen:  
```
public Person findById(int id) {
    String sql = "SELECT id, name, age FROM person WHERE id = ?";
    return jdbcTemplate.queryForObject(sql, new PersonRowMapper(), id);
}
```
Her bruges ? som placeholder, så parametrene bindes sikkert og korrekt.  

#### Oprettelse og ændring af data

Når vi vil ændre data i databasen, anvender vi jdbcTemplate.update(...).
Den samme metode bruges til både INSERT, UPDATE og DELETE.

Eksempel: indsæt en ny person
```
public int create(Person person) {
    String sql = "INSERT INTO person (name, age) VALUES (?, ?)";
    return jdbcTemplate.update(sql, person.getName(), person.getAge());
}
```
Eksempel: opdater en eksisterende person  
```
public int update(Person person) {
    String sql = "UPDATE person SET name = ?, age = ? WHERE id = ?";
    return jdbcTemplate.update(
            sql,
            person.getName(),
            person.getAge(),
            person.getId()
    );
}
```
Metodernes returværdi angiver, hvor mange rækker der blev påvirket.  

### Konfiguration med environment variables

For at undgå hardcodede databaseoplysninger anvendes environment variables sammen med application.properties.

Eksempel fra application.properties:  
```
spring.datasource.url=${DB_URL}
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
```
Værdierne sættes som environment variables i udviklingsmiljøet (fx IntelliJ), så:
- koden kan deles i Git
- credentials ikke eksponeres
- konfiguration kan variere mellem miljøer

### Brug af Spring Profiles

Når en applikation skal køre i forskellige miljøer (fx udvikling, test og produktion), er det vigtigt, at konfigurationen kan variere uden at ændre Java-koden.
I Spring Boot løses dette ved hjælp af Spring Profiles.

Et profile repræsenterer et bestemt miljø og gør det muligt at have forskellige konfigurationer for samme applikation.

#### Konfigurationsfiler pr. miljø

I stedet for kun én application.properties, kan man opdele konfigurationen:
```
application.properties
application-dev.properties
application-test.properties
application-prod.properties
```
Eksempel: application-dev.properties
```
spring.datasource.url=jdbc:mysql://localhost:3306/countries_dev
spring.datasource.username=dev_user
spring.datasource.password=dev_pw
```
Eksempel: application-prod.properties
```
spring.datasource.url=jdbc:mysql://prod-db:3306/countries
spring.datasource.username=prod_user
spring.datasource.password=prod_pw
```
Spring Boot vælger automatisk den rigtige fil baseret på det aktive profile.

#### Aktivering af et profile

Der er flere måder at aktivere et profile på.

Via application.properties
```
spring.profiles.active=dev
```
Via environment variable
```
SPRING_PROFILES_ACTIVE=prod
```
#### Sammenhæng med DataSource og JdbcTemplate

Når et profile er aktivt:
1. Spring Boot læser den tilhørende application-<profile>.properties
2. DataSource konfigureres ud fra disse værdier
3. JdbcTemplate oprettes automatisk baseret på DataSource
4. Repository-klasserne bruger JdbcTemplate uden at kende miljøet

Repository-koden er identisk i alle miljøer og det bliver herved muligt at holde samme kodebase og skifte miljø uden kodeændringer.

#### Typiske anvendelser af Spring Profiles

Spring Profiles bruges typisk til:

- forskellige databaser (H2 / MySQL)
- forskellig mængde logging
- testdata vs. produktionsdata
- mock vs. rigtig integration


### Automatisk initialisering af databasen

Spring Boot kan automatisk køre SQL-scripts ved opstart.

Eksempel:
```
spring.sql.init.schema-locations=classpath:schema.sql
spring.sql.init.data-locations=classpath:data.sql
spring.sql.init.mode=always
```
Dette sikrer, at:
- tabeller oprettes automatisk
- databasen starter med kendte testdata
- alle på holdet arbejder mod samme struktur

### Manuel oprettelse og initialisering af databasen

I et produktionsmiljø er det normalt ikke applikationen, der opretter tabeller eller indsætter startdata automatisk ved opstart. I stedet håndteres databaseændringer typisk af drift/DevOps via fx:

- manuelle SQL-scripts kørt én gang
- release-processer (migrations)
- databaseadministration (DBA) / platform-team

Det betyder, at databasen (schema + evt. basisdata) skal være oprettet på forhånd, og applikationen skal kun forbinde og arbejde med data.  

I Spring Boot kan man sikre sig, at init-scripts (schema.sql og data.sql) ikke køres automatisk ved at sætte følgende i application-prod.properties:  
```
spring.sql.init.mode=never
```
Det forhindrer Spring Boot i at køre SQL-init scripts automatisk.
Hvis man bruger profiles, kan man f.eks. have dette i prod-profilen, mens dev-profilen gerne må initialisere:  
```
# application-dev.properties
spring.sql.init.mode=always

# application-prod.properties
spring.sql.init.mode=never
```






