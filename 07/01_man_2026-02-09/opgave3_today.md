# Udskriv dagen i dag

Lav en ny controller i thymeleaf-demo. Denne controller skal hedde DateController, og have et GET endpoint der hedder "date/today". 

Der skal være et Model-objekt som får tilføjet attributten "day" med en værdi der er et kald til javas LocalDate-klasse: ``` LocalDate.now().getDayOfWeek())```. 

Lav en ny html-fil som hedder "showtoday". Den skal vise hvilken dag det er i dag.