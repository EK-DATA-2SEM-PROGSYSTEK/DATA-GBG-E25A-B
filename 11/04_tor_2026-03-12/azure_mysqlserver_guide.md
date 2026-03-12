### Create a MySQL Database Server on Azure

This guide describes how to create a MySQL database server on Microsoft's Azure cloud platform.

Log in to the [Azure portal](https://portal.azure.com/#home).
This requires a (student) account on Azure. If an account has not been created, follow the instructions here:
[Azure for Students for free](https://azure.microsoft.com/en-gb/free/students) and use your EK student mail.


1. From the home screen choose Create a resource.

<img src="assets/azure_home.png" alt="Azure home" width="900">

1. From the home screen choose Create a resource.

<img src="assets/azure_home.png" alt="Azure home" width="900">

2. Under Categories select Databases.

<img src="assets/azure_categories.png" alt="Categories" width="450">

3. Under Databases, Select Azure Database for MySQL Flexible Server

<img src="assets/azure_categories_database.png" alt="create sql database" width="450">

4. Under Flexible Server, choose Advanced Create.

<img src="assets/azure_advanced_create.png" alt="flexible server" width="450">

5. Under Project details, choose your subscription. Create a new resource group e.g. rg-world

<img src="assets/azure_project_details.png" alt="project details" width="450">

6. Set the Server details as shown. Here, North Europe is chosen as the Region. 

NB. In the Azure Free Plan Subscription, only a limited number of regions are allowed. 
 The regions can be seen by in Policy | Authoring | Assignments | Allowed resource deployment regions

<img src="assets/azure_server_details.png" alt="server details" width="450">

7. Set the Authentication details as shown. Remember the Administrator login and Password. Select Next: Networking >

<img src="assets/azure_authentication.png" alt="server details" width="450">

8. Set the Network connectivity as shown. Under Firewall rules, select + Add current client IP address. 
The firewall rule must be updated when a new client IP address is used e.g. at home or at school. 
Select Review and create.

<img src="assets/azure_networking.png" alt="network details" width="450">

9. Select Create. After a short period (several minutes), the resources will be created.

<img src="assets/azure_create.png" alt="network details" width="450">

10. Select Go to resource

<img src="assets/azure_deployment_complete.png" alt="network details" width="450">

11. Note the endpoint.

<img src="assets/azure_endpoint.png" alt="network details" width="900">

12. The deployed database server can now be accessed by creating a connection in e.g. MySQL Workbench.

 **NB. When the database is no longer required, delete all the resources on Azure. 
 This will prevent credits being used unnecessarily.
 A stopped database server restarts automatically after 30 days.**







