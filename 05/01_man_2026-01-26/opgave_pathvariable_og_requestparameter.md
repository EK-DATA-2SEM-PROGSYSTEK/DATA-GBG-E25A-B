# Path variable og requestparameter



Du skal nu tilføje en `@PathVariable` (id)  og en `@RequestParam` (caps) til controller get-endpointet.  
Controlleren skal kunne modtage en en path til en bestemt message, samt en request parameter, `caps`, der angiver om resultatet skal konverteres til store bogstaver.  
Eksempelvis skal dette kald: `http://localhost:8080/message/2?caps=yes` give følgende output:
```text
VELKOMMEN TIL 2.SEMESTER
```

I Hello World-eksemplets controller så metodesignaturen sådan ud:

```java
 public String helloWorld(@PathVariable String name, @RequestParam (required = false) String caps)
```