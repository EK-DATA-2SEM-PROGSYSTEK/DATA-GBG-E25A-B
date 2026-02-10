# Opgave: tilføj en edit-funktion til userform-thymeleaf-projektet

I showusers.html skal der tilføjes et link inden i loopet så der kommer en edit-mulighed for hver registereret user:

th:href="@{/user/edit/{userId}(userId=${user.userId})}"



Tilføj nedenstående mappings i UserControlleren:

```java

 //Display the edit form
    @GetMapping("/edit/{userId}")
    public String editUser(@PathVariable int userId, Model model){
        User user = userService.getUserById(userId);
        if(user==null){
            throw new IllegalArgumentException("Invalid user id");
        }
        model.addAttribute("user", user);
        model.addAttribute("userRoles", UserRole.values());
        return "user-edit-form";
    }
    
    //Handle the form submission
    @PostMapping("/update")
    public String editUser(@ModelAttribute User user){
        userService.updateUser(user);
        return "redirect:/user/users";
    }

```
Der skal også laves to nye metoder som kalder ned gennem alle lag: 
getUsersById(int userID) og updateUser(User user).

Lav en ny html-fil som hedder "user-edit-form.html". Den skal stort set have samme form i sig som user-registration-form.html, men dens action skal have et andet endpoint: th:action="@{/user/update}".

Den skal også have denne linje:
```html
<input type="hidden" th:field="*{userId}"/>
```

Den skal sættes som den første linje i edit-formen.