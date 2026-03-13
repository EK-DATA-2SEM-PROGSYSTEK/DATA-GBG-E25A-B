### Opgave SQL Transactions

Formålet med opgaven er at illustrere transaktioner med Spring Boot herunder automatisk rollback.

Kun Service og repository lag klasser er implementerede.

Transaktioner med Spring Boot illustreres ved at implementere integrationstest metoder af service klassen. 

Opgaven laves parvis.

### Opsætning

Fork the [bank_transaction_starter](https://github.com/EK-DATA-2SEM-PROGSYSTEK/bank_transaction_starter) projekt.

1. Gennemgå koden i AccountService og AccountRepository klasserne og forklar koden til hinanden.
2. Gennemgå koden i AccountServiceIntegrationTest klassen og forklar koden til hinanden.
3. I AccountServiceIntegrationTest klassen, implementere transferMoney_commits_whenBothAccountsExist() testmetoden
   som beskrevet i kommentarerne i metoden.
4. Forklar implementeringen og resultaterne til hinanden.
5. I AccountServiceIntegrationTest klassen, implementere transferMoney_rollsBack_whenDestinationAccountDoesNotExist() testmetoden
   som beskrevet i kommentarerne i metoden.
6. Forklar implementeringen og resultaterne til hinanden.