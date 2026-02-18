# Spring boot Github action workflow

Vi skal lave vores første Gitbuh workflow for et Spring boot projekt. Projektet er message eksemplet fra uge 05

## Gihub repository

- Opret et lokalt git repository 
- Opret et remote repository, message, på Github
- Push det lokale git repository til Github repositoriet 

## Template action workflow fil
Git hub actions tilbyder en række forskellige template filer til forskellige teknologier.  
Vi skal anvende "Java with Maven".  
- Gå til Actions tab og vælg "Java with Maven".

<img src="assets/image7.jpg" alt="Alt Text" width="700">  

Template filen maven.yml vises nu:  
```yml
# This workflow will build a Java project with Maven, and cache/restore any dependencies to improve the workflow execution time
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-java-with-maven

# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.

name: Java CI with Maven

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4
    - name: Set up JDK 17
      uses: actions/setup-java@v4
      with:
        java-version: '17'
        distribution: 'temurin'
        cache: maven
    - name: Build with Maven
      run: mvn -B package --file pom.xml

    # Optional: Uploads the full dependency graph to GitHub to improve the quality of Dependabot alerts this repository can receive
    - name: Update dependency graph
      uses: advanced-security/maven-dependency-submission-action@571e99aab1055c2e71a1e2309b9691de18d6b7d6
```


Hvornår kører workflowet?
```yml
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
```
Workflowet starter når:
- Der pushes kode til main.
- Der laves en pull request ind til main.

Job: build
```yml
jobs:
  build:
    runs-on: ubuntu-latest
```
Der defineres ét job, build, som kører på en virtuel Ubuntu-maskine.

Steps i jobbet:  
1. Checkout
```yml
- uses: actions/checkout@v4
```  
Henter koden fra repository, så den kan bygges.

2. Setup JDK 17
```yml
- name: Set up JDK 17
  uses: actions/setup-java@v4
  with:
    java-version: '17'
    distribution: 'temurin'
    cache: maven
```
Installerer Java 17 (Temurin distribution) og aktiverer caching af Maven-afhængigheder, hvilket gør fremtidige builds hurtigere.  

3. Build med Maven  
```yml
- name: Build with Maven
  run: mvn -B package --file pom.xml
```
Bygger projektet:
- -B = batch mode (ingen interaktiv input).
- package = bygger projektet og laver en JAR-fil i target/.

``` --file pom.xml ``` er ikke nødvendigt, hvis pom.xml ligger i roden.  
```-B``` er heller ikke strengt nødvendigt, men bruges ofte i CI for at være helt sikker på, at Maven kører non-interaktivt.

## Rettelser til maven.yml  
- slet 'optional' sektkionen
- ændrer java 17 til java 21
- tilfæj 'workflow_dispatch' til triggers i on sektionen, så man kan køre workflow manuelt

## Kør workflow  
-  workflow køeres når ændringer i maven.yml committes
-  workflow kan også køres manuelt via knappen 'Run workflow'
