# Databasetransaktioner

## Beskrivelse


## Forberedelse

Se videoer:

[Transactions and data consistency](https://www.linkedin.com/learning/database-foundations-database-management/transactions-and-data-consistency?autoplay=true&resume=false&u=36836804)

[ACID properties](https://www.linkedin.com/learning/database-foundations-database-management/acid-properties?autoplay=true&resume=false&u=36836804)

[Understanding concurrency and locks](https://www.linkedin.com/learning/database-foundations-database-management/understanding-concurrency-and-locks?autoplay=true&resume=false&u=36836804)

## Læringsmål

- At kunne forklare transaktioner og ACID-egenskaberne
- At kunne beskrive samtidighedsproblemer
- At kunne bruge isolationsniveauer til at håndtere samtidighed
- At kunne implementere transaktionsstyring i applikationskode

## Indhold

### Transaction

```mysql
UPDATE account SET balance = balance - 100 WHERE account_id = 1;
UPDATE account SET balance = balance + 100 WHERE account_id = 2;
```

Hvad sker der hvis en af updates fejler?

---

En transaction i en database er en gruppe af databaseoperationer, der behandles som én samlet enhed.

Enten gennemføres alle operationer i transaktionen, ellers gennemføres ingen.

Formålet er at sikre, at databasen forbliver konsistent, selv hvis der opstår fejl, nedbrud eller flere brugere arbejder samtidigt.

---

### ACID egenskaber

Atomicity: Alt eller intet. Alle operationer gennemføres eller ingen.

Consistency: Databasen forbliver i en gyldig tilstand før og efter transactionen.

Isolation: Flere samtidige transactions påvirker ikke hinanden på en måde, der giver inkonsistente resultater.

Durability: Når en transaction er committed, går ændringerne ikke tabt, selv ved systemnedbrud.

---

#### ```COMMIT```

I MySQL bliver statements som standard automatisk committet. 
Autocommit deaktiveres for en transaktion ved at starte en transaktion.

```mysql
START TRANSACTION;
UPDATE account SET balance = balance - 100 WHERE account_id = 1;
UPDATE account SET balance = balance + 100 WHERE account_id = 2;
COMMIT;
```

#### ```ROLLBACK```

Ændringerne fra disse statements gemmes ikke i databasen, når ROLLBACK-kommandoen køres.

```mysql
START TRANSACTION;
UPDATE account SET balance = balance - 100 WHERE account_id = 1;
UPDATE account SET balance = balance + 100 WHERE account_id = 2;
ROLLBACK;
```
---

### Isolationsniveauer

Når flere brugere arbejder på databasen samtidig, kan deres transactions påvirke hinanden.

---

F.eks. en sæde reservationssystem:


| Time | Transaction 1 (Customer 1) | Transaction 2 (Customer 2) |
|-----|------------------------------|-----------------------------|
| 1 | Reads seat A1 available | |
| 2 | | Reads seat A1 available |
| 3 | Books seat A1 | |
| 4 | | Books seat A1 |
| 5 | Commits transaction | |
| 6 | | Commits transaction |


Resultatet?

**Lost update**

En reservation foretaget af Customer 1 overskrives af Customer 2s reservation.

---

| Time | Transaction 1 (Customer 1) | Transaction 2 (Customer 2) |
|-----|-----------------------------|-----------------------------|
| 1 | Books seat B2 (uncommitted) | |
| 2 | | Reads seat B2 as booked |
| 3 | Cancels booking (rollback) | |
| 4 | | Makes decision based on B2 booked |


Resulatet?

**Dirty Read**

Customer 2 træffer en beslutning baseret på ikke-committede (“dirty”) reservation af Customer 1 som kan blive rullet tilbage.

---

| Time | Transaction 1 (Customer 1) | Transaction 2 (Customer 2) |
|-----|-----------------------------|-----------------------------|
| 1 | Checks seat C10: available | |
| 2 | | Books seat C10 and commits |
| 3 | Checks seat C10 again | |


Resultatet?

**Non-repeatable read**

Customer 1 ser forskellig tilgængelighed for det samme sæde inden for den samme transaktion.

---

| Time | Transaction 1 (Customer 1) | Transaction 2 (Admin) |
|-----|-----------------------------|------------------------|
| 1 | Searches row D, sees 3 seats available (D1, D2, D3) | |
| 2 | | Admin adds 2 extra seats: D4, D5, and commits |
| 3 | Searches row D again, now sees 5 seats available (phantom seats D4, D5 appeared) | |

Resultatet?

**Phantom read**

Nye (”fantom”) sæder dukker op under en transaktion.

---

| Problem | Forklaring                                                                                                                           |
|--------|--------------------------------------------------------------------------------------------------------------------------------------|
| Lost update | To transaktioner opdaterer den samme række, og den ene opdatering overskriver den anden.                                             |
| Dirty read | En transaktion læser data, som en anden transaktion har ændret, men endnu ikke har committet.                                        |
| Non-repeatable read | Den samme række læses to gange i samme transaktion, men værdien ændrer sig, fordi en anden transaktion har opdateret den.            |
| Phantom read | En transaktion gentager en forespørgsel og får flere eller færre rækker, fordi en anden transaktion har indsat eller slettet rækker. |

---

| Isolation level   | Dirty read | Non-repeatable read | Phantom read | Lost update | Forklaring                                                                          |
|-------------------|------------|---------------------|--------------|-------------|-------------------------------------------------------------------------------------|
| READ UNCOMMITTED  | Possible   | Possible            | Possible     | Possible    | Transaktioner kan læse data som endnu ikke er committet. Hurtigt men usikkert.      |
| READ COMMITTED    | Not possible | Possible          | Possible     | Possible    | Man kan kun læse committede data, men rækker kan ændre sig mellem læsninger.        |
| REPEATABLE READ   | Not possible | Not possible      | Possible*    | Not possible | Samme række giver samme resultat i hele transaktionen. Standard i MySQL.            |
| SERIALIZABLE      | Not possible | Not possible      | Not possible | Not possible | Transaktioner opfører sig som om de køres én ad gangen. Mest sikkert men langsomst. |

(*MySQL InnoDB forhindrer phantom reads i REPEATABLE READ ofte via next-key locking.)

---

#### Setting isolationsniveauer

Isolationssniveauer kan sættes på transaction, session (connection) eller global (server) niveau.

```mysql
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Avoid dirty read
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Avoid dirty read, non-repeatable read, phantom read*
-- Default MySQL level
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Avoid all read issues
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

---
NB. Opgaven skal udføres på localhost - ikke en deployede database.
[Opgave: SQL Transactions](opgave_transaction_sql.md)

---

### Opsummering

Transaktion - en gruppe operationer, der udføres atomisk.

Isolationsniveau - regler for hvordan samtidige transactions må påvirke hinanden.

Isolationsniveauer balancerer datasikkerhed vs. performance.

Isolationsniveauer styrer, hvad transaktioner kan læse, mens databasens låsemekanismer forhindrer konflikter ved samtidige skrivninger.

---

### Transactions med JDBC og Spring Boot

### JDBC Eksempel

```java
Connection con = null;

try {
con = dataSource.getConnection();
    con.setAutoCommit(false);

// statement 1
PreparedStatement ps1 = con.prepareStatement(...);
        ps1.executeUpdate();

// statement 2
PreparedStatement ps2 = con.prepareStatement(...);
        ps2.executeUpdate();

    con.commit();
}

catch (SQLException e) {
        if (con != null) {
        con.rollback();
        }
} 
finally {
        if (con != null) {
        con.setAutoCommit(true);
        con.close();
    }
}
```

---

### Spring Boot Eksempel

```java
@Service
public class AccountService {

    private final AccountRepository accountRepository;

    public AccountService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @Transactional
    public void transferMoney(int fromAccountId, int toAccountID, BigDecimal amount) {
        accountRepository.withdraw(fromAccountId, amount);
        accountRepository.deposit(toAccountID, amount);
    }
}

```

@Transactional fortæller Spring, at metoden skal køre som én transaktion.

Hvis en Exception opstår, laver Spring automatisk rollback.

```java
@Repository
public class AccountRepository {

    private final JdbcTemplate jdbcTemplate;

    public AccountRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void withdraw(int accountId, BigDecimal amount) {
        int rows = jdbcTemplate.update("UPDATE user_account SET balance = balance - ? WHERE account_id = ?", amount, accountId);
        if (rows == 0) {
            throw new IllegalArgumentException("Account not found");
        }
    }

    public void deposit(int accountId, BigDecimal amount) {
        int rows = jdbcTemplate.update("UPDATE user_account SET balance = balance + ? WHERE account_id = ?", amount, accountId);
        if (rows == 0) {
            throw new IllegalArgumentException("Account not found");
        }
    }
}
```

---

Service eller Repository lag?

@Transactional bør placeres på service-metoder, fordi en transaktion ofte omfatter flere repository-kald.

Service lag:

---

| Lag | Ansvar |
|-----|--------|
| Controller | HTTP / API |
| Service | Forretningslogik og transaktioner |
| Repository | Databaseadgang |


---

[Opgave: Transactions with Spring Boot](opgave_transaction_springboot.md)


