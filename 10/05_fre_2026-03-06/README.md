# Turistguide del 3, normalisering, SQL DDL

## Beskrivelse

Vi ser hvordan vi kan strukturere en database og organiserer data i tabeller på en måde,
der reducerer redundans (gentagne data) og forbedrer dataintegritet.
Det gør vi ved at kigge på 1., 2. og 3. normalform.

Vi ser også på hvordan vi kan anvende SQL DDL (Data Definition Language) til at oprette databaser og tabeller.

## Forberedelse

Se videoer:

[
Database Normalization: 1NF to 5NF in Plain English](https://youtu.be/wY1qqBFnKhk?si=XlyCfYIsKi5zKYNi) - kun op til 3NF (12.00) 

[Normalization: first, second and third form](https://www.linkedin.com/learning-login/share?account=36836804&forceAccount=false&redirect=https%3A%2F%2Fwww.linkedin.com%2Flearning%2Fprogramming-foundations-databases-2%2Fnormalization-2%3Ftrk%3Dshare_video_url%26shareId%3DIsTl7CEuSX6lgNbtVl3%252Ftg%253D%253D)

[DDL](https://www.linkedin.com/learning-login/share?account=36836804&forceAccount=false&redirect=https%3A%2F%2Fwww.linkedin.com%2Flearning%2Fprogramming-foundations-databases-2%2Fcreating-a-database%3Ftrk%3Dshare_video_url%26shareId%3DUIS%252FcAcMQxmgB6iVaSU0bg%253D%253D)

## Læringsmål

- At kunne beskrive 1., 2. og 3. normalform.
- At kunne normalisere en database til 3. normalform.
- At kunne anvende SQL DDL til at oprette databaser og tabeller.

## Indhold

---

### Normalisering

#### Formålet

Det overordnede formål med normalisering er at organisere data i en database på en måde,
der reducerer redundans og forbedrer dataintegritet.

Det gøres ved at opdele data i mindre, relaterede tabeller og definere relationer mellem dem.

Data integritet betyder, at data i et system er korrekte, konsistente og pålidelige når
de bliver oprettet, opdateret, lagret og anvendes.

---

#### Normalformer

Først Normalform (1NF) - Atomiske værdier
- Alle attributter (kolonner) indeholder kun atomiske værdier (ikke lister eller gentagelser).

Andet Normalform (2NF) - Fuld funktionel afhængighed
- Kræver først 1NF.
- Alle ikke-nøgleattributter skal være fuldt afhængige af hele komposit primærnøglen (ikke kun en del af den).

Tredje Normalform (3NF) - Ingen transitive afhængigheder
- Kræver først 2NF.
-  Ingen ikke-nøgleattributter må være afhængige af en anden ikke-nøgleattribut

---
