# Opgave: lav den klassiske "Is it Friday?"-applikation

Lav et nyt endpoint i DateControlleren som hedder "date/friday".

Tilføj et LocalDate-objekt for dagen i dag som modelattribute.

Den tilhørende @GetMapping-metode skal sørge for at html-siden "isitfriday" vises. Her skal Thymeleaf bruges til at checke datoen, så der kan skrives et bekræftende svar hvis det er fredag.

Ekstra-opgave: prøv at lave en switch i Thymeleaf, så der skrives noget forskelligt ud alt efter hvilken ugedag det er. Tip: brug th:switch og th:case