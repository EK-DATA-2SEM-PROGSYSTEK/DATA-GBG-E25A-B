
# HTML & CSS

## Beskrivelse

Dagens emner er de grundlæggende principper for lave en hjemmeside med brug af HTML og CSS.
HTML (Hyper Text Markup Language) er den mest basale måde at lave en hjemmeside på.
CSS (Cascading Style Sheets) anvendes til mere avanceret formatering og layout på hjemmesider.

HTML/CSS emnet afrundes ved at vi afprøver hvordan man laver statiske HTML-sider i Spring Boot.


## Forberedelse

Se introduktopnsvideo om HTML: [HTML in 100 Seconds](https://www.youtube.com/watch?v=ok-plXXHlWw&list=PLEeqf0uSZqXsa5psDHHdU5i4VkkE4wF1s)

Se video på LinkedInLearning: [HTML Essential Training](https://www.linkedin.com/learning/html-essential-training-4/what-is-html?u=36836804)  (sektion 1 til og med sektion 5 samt sektion 10)).

Se fra “CSS syntax and terminology” i afsnit 2, samt hele afsnit 3 om “CSS Box Model” i [CSS Essential Training](https://www.linkedin.com/learning/css-essential-training-22688362/css-syntax-and-terminology?resume=false&u=36836804)

Se videoen  [Build a Classic Layout FAST in CSS Grid ](https://www.youtube.com/watch?v=KOvGeFUHAC0)

Arbejd derefter med øvelserne på [W3Schools HTML Tutorials](https://www.w3schools.com/html/default.asp) (til og med HTML Paragraphs).



## Læringsmål

- at kende til HTML
- at kunne oprette simple HTML-sider
- at kende til brugen af CSS
- at kende til CSS box model
- at kende til CSS grid layout
- at vide hvordan statiske HTML-sider fungerer i Spring Boot

## Indhold
### HTML og CSS – formål og samspil

HTML og CSS er grundteknologierne bag alle klassiske websites.

- **HTML** bruges til at definere struktur og indhold
- **CSS** bruges til at styre præsentation og layout

HTML beskriver *hvad* indholdet er, mens CSS beskriver *hvordan* det vises.
Denne adskillelse er vigtig for læsbarhed, genbrug og vedligeholdelse.

Eksempel på simpel HTML-struktur:

```html
<!DOCTYPE html>
<html lang="da">
<head>
  <meta charset="UTF-8">
  <title>Hello HTML</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Hello HTML</h1>
  <p>This is like it’s 1999</p>
</body>
</html>
```
### Eksempler på anvendelse af HTML/CSS

HTML og CSS anvendes bl.a. til:

- statiske informationssider
- views og templates i backend-frameworks (fx Spring Boot)
- layout og styling af brugergrænseflader
- responsive designs til mobil, tablet og desktop

I dette forløb arbejdes der med klassiske HTML-sider, som senere kan indgå
som statiske views i en Spring Boot-applikation.

### CSS – grundlæggende styling

CSS skrives som regler, der består af:

- en selector
- en eller flere properties med values

Eksempel:
```html
body {
  font-family: Verdana, sans-serif;
  background-color: #f6f6f6;
  color: rebeccapurple;
}

h1 {
  font-size: 3em;
  font-weight: lighter;
}
```
CSS-filen kobles til HTML via <link> i <head>

### CSS Box Model
Alle HTML-elementer renderes som rektangulære bokse.
Browseren anvender CSS Box Model til at beregne et elements samlede størrelse.

Box modellen består af fire lag:
- Content – selve indholdet
- Padding – luft mellem indhold og kant
- Border – kanten omkring elementet
- Margin – afstand til andre elementer

Eksempel:
```html
p {
  padding: 20px;
  border: 5px solid rebeccapurple;
  margin: 50px;
}
```
Det anbefales at inspicere elementer i browserens DevTools for visuelt
at se box modellens opbygning og forstå spacing.

### CSS Grid – layout med rækker og kolonner
CSS Grid er et todimensionelt layout-system, hvor man arbejder med både
rækker og kolonner samtidig.
Et grid aktiveres med display: grid.
Eksempel på simpelt grid:
```html
CSS:
.container {
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}

HTML:
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```
### Grid med semantisk layout (grid-template-areas)
CSS Grid kan bruges til at definere hele sidens layout på en læsbar måde.
Mobile-first eksempel:
```html
CSS:
body {
  min-height: 100vh;
  display: grid;
  gap: 1em;
  grid-template-areas:
    "header"
    "nav"
    "main"
    "footer";
  grid-template-columns: 1fr;
  grid-template-rows: auto auto 1fr auto;
}
```
Placering af elementer i grid-områder:
```html
CSS:
header { grid-area: header; }
nav    { grid-area: nav; }
main   { grid-area: main; }
footer { grid-area: footer; }

HTML:
<header>Header</header>
<nav>Navigation</nav>
<main>Main content</main>
<footer>Footer</footer>
```
### Responsivt grid med media query
Layoutet kan ændres ved større skærme uden at ændre HTML-strukturen:
```html
@media (min-width: 40em) {
  body {
    width: 80%;
    margin: 0 auto;
    grid-template-areas:
      "header header"
      "nav main"
      "footer footer";
    grid-template-columns: 12em 1fr;
  }
}
```
Denne tilgang gør det muligt at:
- starte med et simpelt mobil-layout
- udvide layoutet til tablet og desktop
- bevare en ren og semantisk HTML-struktur


## Aktiviteter











