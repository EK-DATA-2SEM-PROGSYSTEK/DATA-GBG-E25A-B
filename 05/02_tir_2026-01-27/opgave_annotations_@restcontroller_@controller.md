
## RestController vs Controller
Når man bruger @RestController, bliver objekter automatisk konverteret til [JSON](https://en.wikipedia.org/wiki/JSON) og returneret i HTTP-responsen.

I dette semester skal vi primært bruge en template engine der hedder Thymeleaf til at generere HTML (fra og med Turistguide del 2). Her bruger vi annotationen @Controller i stedet for @RestController. 
Når man bruger @Controller (som man normalt gør ved server-side rendering med Thymeleaf), forventer Spring, at man returnerer en String, som henviser til et view (f.eks. en .html-skabelon). Hvis man i stedet prøver at returnere data som objekter direkte, vil Spring forsøge at lede efter en Thymeleaf-side med det navn – og fejle hvis den ikke findes.

### Løsningen: ResponseEntity
Ved at bruge ```ResponseEntity<>(dataObjekt, HttpStatus.STATUSKODE);``` kan man returnere data på JSON form fra en Controller sammen med http statuskoden.

### Eksempel med brug af @Controller
```java
@Controller
public class WelcomeController {
    @GetMapping("welcome")
    public ResponseEntity<String> welcome() {
        return new ResponseEntity<>("Velkommen til 2. semester", HttpStatus.OK);
    }
}
```
Hvis man blot vil returnere en statuskode, f.eks: 404: Not found, kan det gøres ved:
```java
ResponseEntity<>(HttpStatus.NOT_FOUND);
```
Lav om i eksemplet fra tidligere så I bruger @Controller annotation og returnerer en ResponseEntity i stedet for en String.


---