# Turistguide del 3, normalisering

## Beskrivelse

Vi ser hvordan vi kan strukturere en database og organiserer data i tabeller på en måde,
der reducerer redundans (gentagne data) og forbedrer dataintegritet.
Det gør vi ved at kigge på 1., 2. og 3. normalform.

## Forberedelse

Se videoer:

[Database Normalization: 1NF to 5NF in Plain English](https://youtu.be/wY1qqBFnKhk?si=XlyCfYIsKi5zKYNi) - kun op til 3NF (12.00) 

[Normalization: first, second and third form](https://www.linkedin.com/learning-login/share?account=36836804&forceAccount=false&redirect=https%3A%2F%2Fwww.linkedin.com%2Flearning%2Fprogramming-foundations-databases-2%2Fnormalization-2%3Ftrk%3Dshare_video_url%26shareId%3DIsTl7CEuSX6lgNbtVl3%252Ftg%253D%253D)

## Læringsmål

- At kunne beskrive 1., 2. og 3. normalform.
- At kunne normalisere en database til 3. normalform.

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


1NF?

| CourseID (PK) | CourseName        | LecturerEmail         | LecturerName | StudentID (FK)      |
|---------------|-------------------|-----------------------|--------------|---------------------|
| 101           | Databaser         | jensen@uni.example    | Anja Jensen  | S1001, S1002, S1003 |
| 102           | Programming       | hansen@uni.example    | Emma Hansen  | S1004, S1005        |
| 103           | Web Development   | smith@uni.example     | John Smith   | S1001, S1006        |

---

1NF? 2NF?

| CourseID (PK) | StudentID (PK, FK) | CourseName      | LecturerEmail       | LecturerName |
|---------------|--------------------|-----------------|---------------------|--------------|
| 101           | S1001              | Databaser       | jensen@uni.example  | Anja Jensen  |
| 101           | S1002              | Databaser       | jensen@uni.example  | Anja Jensen  |
| 101           | S1003              | Databaser       | jensen@uni.example  | Anja Jensen  |
| 102           | S1004              | Programming     | hansen@uni.example  | Emma Hansen  |
| 102           | S1005              | Programming     | hansen@uni.example  | Emma Hansen  |
| 103           | S1001              | Web Development | smith@uni.example   | John Smith   |
| 103           | S1006              | Web Development | smith@uni.example   | John Smith   |

---

2NF? 3NF?

Courses

| CourseID (PK) | CourseName      | LecturerEmail       | LecturerName |
|---------------|-----------------|---------------------|--------------|
| 101           | Databaser       | jensen@uni.example  | Anja Jensen  |
| 102           | Programming     | hansen@uni.example  | Emma Hansen  |
| 103           | Web Development | smith@uni.example   | John Smith   |


Enrollments

| CourseID (PK, FK) | StudentID (PK, FK) |
|-------------------|--------------------|
| 101               | S1001              |
| 101               | S1002              |
| 101               | S1003              |
| 102               | S1004              |
| 102               | S1005              |
| 103               | S1001              |
| 103               | S1006              |

---

3NF?

Lecturers

| LecturerID (PK) | LecturerEmail        | LecturerName |
|-----------------|----------------------|--------------|
| 1               | jensen@uni.example   | Anja Jensen  |
| 2               | hansen@uni.example   | Emma Hansen  |
| 3               | smith@uni.example    | John Smith   |


Courses

| CourseID (PK) | CourseName      | LecturerID (FK) |
|---------------|-----------------|-----------------|
| 101           | Databaser       | 1               |
| 102           | Programming     | 2               |
| 103           | Web Development | 3               |

Enrollments

| CourseID (PK, FK) | StudentNo (PK, FK) |
|-------------------|--------------------|
| 101               | S1001              |
| 101               | S1002              |
| 101               | S1003              |
| 102               | S1004              |
| 102               | S1005              |
| 103               | S1001              |
| 103               | S1006              |


Students

| StudentNo (PK) | StudentName       |
|----------------|-------------------|
| S1001          | Mads Nielsen      |
| S1002          | Emma Sørensen     |
| S1003          | William Andersen  |
| S1004          | Sarah Johnson     |
| S1005          | Peter Christensen |
| S1006          | Lucy Thompson     |

---

#### ER-Diagram

```mermaid
erDiagram
    LECTURERS {
      int LecturerID PK
      string LecturerEmail "UNIQUE, NOT NULL"
      string LecturerName  "NOT NULL"
    }

    COURSES {
      int CourseID PK
      string CourseName   "NOT NULL"
      int LecturerID FK   "NOT NULL"
    }

    STUDENTS {
      string StudentNo  PK
      string StudentName "NOT NULL"
    }

    ENROLLMENTS {
      int CourseID   FK "PK part, NOT NULL"
      string StudentNo FK "PK part, NOT NULL"
    }

    LECTURERS ||--o{ COURSES : "teaches"
    COURSES   ||--o{ ENROLLMENTS : "has"
    STUDENTS  ||--o{ ENROLLMENTS : "takes"
```

---

#### Opgave: Normalisering

[Opgave: Normalisering](opgave-normalisering.md)

---



