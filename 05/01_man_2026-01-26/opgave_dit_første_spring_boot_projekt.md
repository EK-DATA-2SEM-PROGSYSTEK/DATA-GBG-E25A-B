



# Dit første Spring Boot projekt
- Åben IntelliJ
- Gå til File | New | Project...
- Udfyld dialogbokse

<img src="assets/spring-boot.png" alt="Alt Text" width="700">
<img src="assets/spring-boot2.png" alt="Alt Text" width="700">

Opret en pakke `controller`

<img src="assets/spring-boot3.png" alt="Alt Text" width="500">

Opret en klasse `WelcomeController` i `controller`pakken
```java
package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WelcomeController {
    @GetMapping("welcome")
    public String welcome() {
        return "Velkommen til 2. semester";
    }
}
```
Afprøv applikationen. Hvilken URL skal endpointet tilgås på?

Prøv herefter at tilføje en `@RequestMapping("ek")`. Hvilken URL skal endpointet nu tilgås på?

---
