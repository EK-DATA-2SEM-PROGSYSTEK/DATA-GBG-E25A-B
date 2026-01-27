# Opgave: @PostMapping til Message-projektet
I denne opgave skal I tilføje en add-metode til controlleren i Message-projektet.

Den skal annoteres med @PostMapping, og returnere en ResponseEntity (ligesom GetMapping-metoderne).

Metodesignaturen skal se sådan ud:

```java
@PostMapping("/add")
public ResponseEntity<Message> addMessage(@RequestBody Message message)
```
Når I tester i HttpClient skal I sørge for at det der står under endpointet ser ud som nedenfor. Husk at lave mellemrum mellem Content-Type linjen og den første curly brace.
```text
POST http://localhost:8080/message/add
Content-Type: application/json

{
 "content": "Velkommen til 4.semester"
}

```

Outputtet fra testen skal se ud som nedenstående:
```text
HTTP/1.1 201 
Content-Type: application/json
Transfer-Encoding: chunked
Date: Mon, 25 Aug 2025 20:46:40 GMT
Keep-Alive: timeout=60
Connection: keep-alive

{
  "id": 4,
  "content": "Velkommen til 4.semester"
}

```
Det vil sige at id'et skal tilføjes Message-objektet (i repository).