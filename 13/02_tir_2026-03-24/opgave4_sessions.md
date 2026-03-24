# OPGAVE: Shopping Cart (Indkøbskurv)
I denne opgave skal I lave en web applikation i Spring Boot og Thymeleaf der implementerer
en indkøbskurv.
Formålet med opgaven er at lære at bruge http sessions (HttpSession klassen) og også at blive
klogere på hvad forskellen er på “request” og “session” scope.

Følg. klasser oprettes i model pakken:

```java
CartItem: Definerer en vare.


public class CartItem {
private String name;
private double price;
private int quantity;
public CartItem(String name, double price, int quantity) {
this.name = name;
this.price = price;
this.quantity = quantity;
}
public String getName() {
return name;
}
public double getPrice() {
return price;
}
public int getQuantity() {
return quantity;
}
}

Cart: Definerer selve indkøbskurven.

public class Cart {
private List<CartItem> items = new ArrayList<>();
public List<CartItem> getItems() {
return items;
}
public void addItem(CartItem item) {
items.add(item);
}
public void removeItem(int index) {
items.remove(index);
}
public double getTotal() {
double total = 0.0;
for (CartItem item : items) {
total += item.getPrice() * item.getQuantity();
}
return total;
}
}

CartController, som kun er delvist færdig.
Opgaven er at kode controlleren med nedenstående endpoints som gør det der står i kommentarerne.

@Controller
public class CartController {
private Cart cart; // reference til indkøbskurv session
@GetMapping("/cart")
public String showCart(Model model, HttpSession session) {
// check om attributten ‘cart’ findes i sessions objektet
// hvis ikke - opret en ny indkøbskurv (cart)
// opret indkøbskurvattributten (cart) i session objektet
// sæt sessionslevetiden til 30 sec til testformål
// tilføj attributterne ‘items’, og ‘total’ til model objektet
// returner cart.html, der viser ui
}
@PostMapping("/cart/add")
public String addToCart(@RequestParam String name,
@RequestParam double price,
@RequestParam int quantity)
{
// opret nyt item
// tilføj item til cart
// redirect til /cart
}
@PostMapping("/cart/remove")
public String removeFromCart(@RequestParam int index) {
// slet item på ‘index’ i cart
// redirect til /cart
}
@PostMapping("/cart/empty")
public String emptyCart(HttpSession session) {
// fjern ‘cart’ attribute fra session objekt
// redirect til /cart
}
}

```
I kan finde forslag til Thymeleaf kode for cart.html i nedenfor.

Thymeleaf

```
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" th:href="@{/main.css}">
</head>
<body>
    <h1>Indkøbskurv:</h1>
    <table>
        <thead>
        <tr>
            <th>Navn</th>
            <th>Pris</th>
            <th>Antal</th>
            <th>Subtotal</th>
        <th>Fjern vare</th>
        </tr>
        </thead>
        <tbody>
            <tr th:each="item, itemStat : ${items}">
                <td th:text="${item.name}"></td>
                <td th:text="${item.price}"></td>
                <td th:text="${item.quantity}"></td>
                <td th:text="${item.price * item.quantity}"></td>
                <td>
                    <form method="post" th:action="@{/cart/remove}" th:object="${itemStat.index}">
                        <button type="submit">Fjern</button>
                        <input type="hidden" name="index" th:value="${itemStat.index}"/>
                    </form>
                </td>
            </tr>
        </tbody>
        <tr>
            <td colspan="3">Total:</td>
            <td th:text="${total}"></td>
            <td></td>
        </tr>
    </table>
<p>
<form method="post" th:action="@{/cart/empty}">
    <button type="submit">Tøm indkøbskurv</button>
</form>
</p>
<h1>Varer:</h1>
<form method="post" th:action="@{/cart/add}">
    <p><label>Navn:</label>
    <input type="text" name="name" required/></p>
    <p><label>Pris:</label>
    <input type="number" name="price" min="0" step="0.01" required/></p>
    <p><label>Antal:</label>
    <input type="number" name="quantity" min="1" required/></p>
    <button type="submit">Tilføj til indkøbskurv</button>
</form>
</body>
</html>
```