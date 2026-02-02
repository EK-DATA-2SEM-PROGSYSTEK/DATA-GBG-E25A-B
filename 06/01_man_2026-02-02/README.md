
# HTML & CSS

## Beskrivelse

Dagens emner er de grundlæggende principper for lave en hjemmeside med brug af HTML og CSS.
HTML (Hyper Text Markup Language) er den mest basale måde at lave en hjemmeside på.
CSS (Cascading Style Sheets) anvendes til mere avanceret formatering og layout på hjemmesider.

HTML/CSS emnet afrundes ved at vi afprøver hvordan man laver statiske HTML-sider i Spring Boot.


## Forberedelse

### Se disse videoer:
Introduktopnsvideo om HTML: [HTML in 100 Seconds](https://www.youtube.com/watch?v=ok-plXXHlWw&list=PLEeqf0uSZqXsa5psDHHdU5i4VkkE4wF1s)  
HTML-LinkedIn Learning: [HTML Essential Training](https://www.linkedin.com/learning/html-essential-training-4/what-is-html?u=36836804)  (sektion 1 til og med sektion 5 samt sektion 10))  
CSS-Linkedin Learning: [CSS Essential Training](https://www.linkedin.com/learning/css-essential-training-22688362/css-syntax-and-terminology?resume=false&u=36836804) (Se fra “CSS syntax and terminology” i afsnit 2, samt hele afsnit 3 om “CSS Box Model” )  
Semantic HTML: [Why & When to Use Semantic HTML Elements over Divs](https://www.youtube.com/watch?v=bOUhq46fd5g)  
Grid layout  [Build a Classic Layout FAST in CSS Grid ](https://www.youtube.com/watch?v=KOvGeFUHAC0)  
Chrome developer tool [Chrome DevTools Crash Course - using Chrome 'Inspector' for CSS Development](https://www.youtube.com/watch?v=151NXMk0a2c)

Arbejd derefter med øvelserne på [W3Schools HTML Tutorials](https://www.w3schools.com/html/default.asp) (til og med HTML Paragraphs).

### Resourcer
I kan klone eksempelkode her: [html-css](https://github.com/EK-DATA-2SEM-PROGSYSTEK/html-css)  
Eksemplerne fra denne side findes i folderen: /src/main/resources/static/GitHub/

## Læringsmål

- at kende til HTML
- at kunne oprette simple HTML-sider
- at kende til brugen af CSS
- at kende til CSS box model
- at kende CSS selectors
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

- statiske informationssider (fx Spring Boot static folder
- views og templates i backend-frameworks (fx Spring Boot template folder)
- layout og styling af brugergrænseflader
- responsive designs til mobil, tablet og desktop

I dette forløb arbejdes der med klassiske HTML-sider, som senere kan indgå
som statiske views i en Spring Boot-applikation.

### [CSS – grundlæggende styling](https://www.w3schools.com/html/html_css.asp)

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
CSS-filen kobles til HTML via et ```html <link> element i <head>```

### [CSS Box Model](https://www.w3schools.com/css/css_boxmodel.asp)
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

### [CSS selectors – class og id](https://www.w3schools.com/css/css_selectors.asp)

CSS selectors bruges til at angive, hvilke HTML-elementer en CSS-regel skal
anvendes på. To af de mest anvendte selectors er **class selectors** og
**id selectors**. De bruges begge til at style specifikke elementer, men har
forskellige formål og anvendelser.

En **class selector** bruges, når den samme styling skal genbruges på flere
elementer. En class angives i HTML med attributten `class` og refereres i CSS
med et punktum (`.`). Det samme class-navn kan bruges på så mange elementer,
man ønsker.

Eksempel på brug af class:

```html
HTML:
<p class="highlight">Dette er vigtigt</p>
<p class="highlight">Dette er også vigtigt</p>

CSS:
.highlight {
  background-color: #ffffcc;
  padding: 0.5em;
}
```
Her får begge paragraffer samme styling, fordi de deler samme class.

En id selector bruges til at identificere ét unikt element på siden.
Et id angives i HTML med attributten id og refereres i CSS med et hashtag
(#). Et id må kun forekomme én gang i et HTML-dokument.

Eksempel på brug af id:
```html
HTML:
<header id="main-header">
  <h1>Min hjemmeside</h1>
</header>

CSS:
#main-header {
  background-color: rebeccapurple;
  color: white;
  padding: 1em;
}
```
Her styles kun det ene element med id’et main-header.

Som tommelfingerregel bruges class, når styling skal genbruges på flere
elementer, og id, når et element er unikt, fx hovedheader, hovednavigation
eller main content. I praksis anvendes class langt oftere end id, især i større
projekter og moderne CSS.


### [CSS Grid – layout med rækker og kolonner](https://www.w3schools.com/css/css_grid.asp)
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
### [Grid med semantisk layout (grid-template-areas)](https://www.w3schools.com/cssref/pr_grid-template.php)
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
### Vigtige CSS-enheder og begreber

Når man arbejder med CSS, anvendes forskellige enheder og nøgleord til at
beskrive størrelser, afstande og layout. Tre særligt vigtige begreber
er `em`, `fr` og `auto`.

Begrebet `em` er en relativ enhed, der tager udgangspunkt i den aktuelle
skriftstørrelse. Én `em` svarer til font-størrelsen på det element, som styles,
eller dets nærmeste forælder. Hvis et element har en font-størrelse på 16px,
vil `1em` svare til 16px, mens `2em` svarer til 32px. Fordelen ved `em` er, at
størrelser skalerer naturligt, hvis brugeren ændrer tekststørrelse i browseren.
Ulempen kan være, at værdierne kan blive svære at overskue, hvis flere elementer
arver og multiplicerer font-størrelser.

I CSS Grid anvendes ofte enheden `fr`, som står for “fraction”. `fr` bruges til
at fordele den tilgængelige plads i en grid-container. Når man eksempelvis
skriver `grid-template-columns: 1fr 3fr`, betyder det, at den første kolonne
får én del af den tilgængelige plads, mens den anden kolonne får tre dele.
`fr`-enheden gør det nemt at lave fleksible layouts, hvor kolonner automatisk
tilpasser sig containerens bredde.

Nøgleordet `auto` bruges i CSS til at lade browseren beregne størrelsen
automatisk. Når `auto` anvendes på bredde eller højde, betyder det, at elementet
tilpasser sig sit indhold eller den plads, der er til rådighed. I CSS Grid
bruges `auto` ofte i `grid-template-rows` eller `grid-template-columns` til
rækker eller kolonner, der skal have den højde eller bredde, som indholdet
kræver. Dette er særligt nyttigt til elementer som header og footer, hvor
indholdets størrelse kan variere.

Sammen giver `em`, `fr` og `auto` mulighed for at lave fleksible og responsive
layouts, der tilpasser sig både indhold og skærmstørrelse.

### [Responsivt grid med media query](https://www.w3schools.com/css/css_rwd_mediaqueries.asp)
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
Arbejd med disse [opgaver](opgaver.md)  
Fortsæt herefter med Turistguide projektet





























