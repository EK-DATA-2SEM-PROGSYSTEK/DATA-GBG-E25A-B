## Opgaver – CSS selectors (class/id) og CSS Grid  

Dette opgaveafsnit bygger direkte på gennemgangen af class/id selectors og CSS Grid.

### Opgave 1 – Brug af class selector (genbrug styling)

Opret en HTML-side med tre paragraffer. To af paragrafferne skal fremhæves
visuelt ved hjælp af en fælles class med navnet `highlight`.

### Opgave 2 – Brug af id selector (ét unikt element)

Tilføj en header til din HTML-side. Headeren skal have et id med navnet
main-header, og den skal styles med tydelig baggrund, hvid tekst og padding.

### Opgave 3 – Class vs. id (hvad “vinder”?)

Tilføj en paragraf, der både har class highlight og et id special.
Giv både class og id hver sin styling, så du kan se, hvilken der slår igennem.

### Opgave 4 – Genbrug af class på forskellige tags

Tilføj et ```<div>```-element, der også bruger classen highlight. Bekræft at det
samme CSS stadig virker, selvom tag-typen er en anden.

### Opgave 5 – Opret et simpelt grid (2 kolonner)

Opret en container med fire bokse. Brug CSS Grid til at lave to kolonner og
tilføj afstand med gap.

### Opgave 6 – Brug fr aktivt (eksperimentér)

Skift kolonnefordelingen i opgave 5 til forskellige fr-forhold og observer,
hvordan layoutet ændrer sig.

### Opgave 7 – Grid-layout med semantisk HTML (mobile-first)

Opret en side med header, nav, main og footer. Brug grid-template-areas
til et mobile-first layout, hvor elementerne står i én kolonne (ovenpå hinanden).

### Opgave 8 – Responsivt grid med media query

Udvid opgave 7: Ved større skærme skal layoutet ændres, så nav ligger i venstre
kolonne og main i højre kolonne, mens header og footer stadig fylder hele
bredden.

Udvid evt til tre skærmstørrelser:

Telefon (mobil): standard (ingen media query)
Layout: 1 kolonne (stack)

Tablet / mellem skærm: @media (min-width: 40em)
Ca. 640px hvis 1em ≈ 16px
Layout: 2 kolonner (nav + main)

Desktop / stor skærm: @media (min-width: 70em)
Ca. 1120px hvis 1em ≈ 16px
Layout: stadig 2 kolonner, men centreret og “luftigere” med max-width og bredere nav

Tip: Hvis I ændrer browserens standard font-size, ændrer em-baserede
breakpoints sig også. Det er ofte en fordel, fordi layoutet skalerer sammen
med tekststørrelsen.

1 em svarer til fontstørrelsen på den aktuelle element. I standardbrowsers er det typisk 16px, så 1em = 16px. Men det kan ændres via CSS (f.eks. hvis body har font-størrelse 14px, bliver 1em = 14px)

### Opgave 9 – Brug auto og fr sammen

Tilpas grid’et, så header og footer får højde efter indhold (auto), mens main
fylder resten af højden (1fr). Test ved at tilføje mere tekst i header eller
footer og observer effekten.

### Opgave 10 - Fejlfinding
Nedenfor er et grid-layout, der “burde” lave et semantisk layout med
grid-template-areas, men det virker ikke som forventet.
Din opgave er at:
1. finde fejlen/fejlene
2. forklare hvorfor det fejler
3. rette CSS’en, så layoutet virker

