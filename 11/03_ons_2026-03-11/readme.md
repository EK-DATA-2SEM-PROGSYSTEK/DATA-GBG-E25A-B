# Deployment på Azure

## Beskrivelse
Så er det tid til at flytte hjemmefra (127.0.0.1).
Nu anvender vi GitHub Actions til et deployment workflow og deployer vores applikation på Microsoft Azure.
Vi ser på "Cloud computing" som teknologimodel, der giver brugerne mulighed for at få adgang til delte computingressourcer (som f.eks. servere, lagring, databaser, netværkstjenester, software, applikationer og mere) via internettet, hvilket er kendt som "skyen".
Vi kommer ind på begreberne: On-Prem, IaaS, PaaS, SaaS, BaaS, og ser på hvor Azure er placeret i disse.

## Forberedelse
Se disse videoer:  
[Cloud Computing Services Models - IaaS PaaS SaaS Explained](https://www.youtube.com/watch?v=36zducUX16w)  
[PaaS Explained](https://www.youtube.com/watch?v=QAbqJzd0PEE)  
[How to deploy Spring boot app to azure with GitHub actions!](https://www.youtube.com/watch?v=sbcPyaqycyI)

Opret en student account på Azure:  
[How To Sign Up for Azure for Students](https://www.youtube.com/watch?v=uSRCE8wVBLI&list=PLEeqf0uSZqXs0pDemlMhS4ifv3anaZQHj)  
NB: Brug din EK microsoft account  

Ressourcer:  
[Azure student subscription - FAQ](https://learn.microsoft.com/da-dk/azure/education-hub/azure-dev-tools-teaching/program-faq#azure-for-students)  
[Azure Latency Test](https://www.azurespeed.com/Azure/Latency)  
[Azure Pricing Overview](https://azure.microsoft.com/en-us/pricing)

## Læringsmål
- Kender begreberne: On-Prem, IaaS, PaaS, SaaS, BaaS
- Kan deploye en Spring Boot web applikation til Azure
## Indhold  

### Hvad er Cloud Computing?
Cloud computing er en teknologimodel, hvor brugere får adgang til computing-ressourcer (servere, databaser, lagring, netværk, software mm.) via internettet i stedet for at eje og administrere lokal infrastruktur.  

**Karakteristika:**
- **On-demand selvbetjening** – ressourcer kan oprettes og styres uden manuel indgriben.
- **Bred netværksadgang** – adgang fra enhver enhed med internet.
- **Ressourcedeling** – ressourcer deles mellem mange brugere.
- **Elasticitet** – skaler op/ned efter behov.
- **Pay-as-you-go** – betal kun for det du bruger.

---

## Ansvarsdeling: On-Prem, IaaS, PaaS, SaaS, BaaS
<img src="assets/cloudmodel.png" alt="Alt Text" width="700">
Cloud-modellerne handler om, hvor ansvaret ligger mellem bruger og cloud-udbyder:

- **On-Prem**: Alt styres selv (hardware, netværk, OS, middleware, data, app).
- **IaaS (Infrastructure as a Service)**: Udbyder leverer virtuelle maskiner, lagring og netværk. Brugeren styrer OS, middleware og apps.  
  Eksempler: AWS EC2, Azure Virtual Machines.
- **PaaS (Platform as a Service)**: Udbyder leverer en platform til udvikling og hosting. Brugeren fokuserer på kode og data.  
  Eksempler: Azure App Services, Heroku.
- **SaaS (Software as a Service)**: Hele applikationen leveres som service.  
  Eksempler: Office 365, Google Workspace.
- **BaaS (Backend as a Service)**: Addressere spicifikke backend behov til mobil- og webapps med API’er. (ex: database management, user authentication)  
  Eksempler: Firebase, AWS Amplify.

Analogi til **at køre bil**:  
- **On-Prem** = du ejer bilen og står for alle udgifter: anskaffelsespris, vedligeholdelse, forsikring, brændstof / el  
- **IaaS** = du leaser bilen og står for visse udgifter: dæk, forsikring, brændstof / el   
- **PaaS** = du lejer bilen og står kun for leje, brændstof / el.
- **SaaS** = du tager en taxa eller bruger offentlig transport.  Pay-as-you-go

---

### Azure App Service

**Azure App Service** er en **PaaS-løsning** hvor du kan hoste web-, API- og mobilapps uden at styre infrastrukturen.  

Fordele:
- Hurtig deployment
- Skalering og load balancing
- Indbygget integration med GitHub Actions

---

### Deployment af en Spring Boot app til Azure
Vi deployer [message appen](https://github.com/mnyborg/message) fra uge 35.  
#### Opret en Azure Web App
1. Log ind på [Azure Portal](https://portal.azure.com).
2. Vælg **Create a resource** og vælg **Web App** 
<img src="assets/azure1.png" alt="Alt Text" width="700">

3. Opret en ny **Resource Group** (samling af ressourcer).
<img src="assets/azure2.png" alt="Alt Text" width="700">

4. Indtast **instance details**  
<img src="assets/azure3.png" alt="Alt Text" width="700">
  
Bemærk: Der er kun et begrænset antal regions til rådighed i "free plan", se Policy | Authoring | Assignments | Allowed resource deployment regions

Hvis man vil se hordan de performer (latency test) kan man benytte [Azure Latency Test](https://www.azurespeed.com/Azure/Latency)   
5. Vælg **Pricing plan**  
Vælg **Free F1 Plan** for at undgå omkostninger. (vigitgt!) 
<img src="assets/azure4.png" alt="Alt Text" width="700">
Tryk "Review + create"
<img src="assets/azure5.png" alt="Alt Text" width="700">
Tryk "Create"  
Efter et stykke tid bliver appen deployed og man kan klikke "Go to resource":    
<img src="assets/azure6.png" alt="Alt Text" width="700">
Nu vises appen's URL på Azure:  
<img src="assets/azure7.png" alt="Alt Text" width="700">
Når man klkker på appen's URl kommer man til defualt landing page og man kan klikke på "Deployment center":  
<img src="assets/azure8.png" alt="Alt Text" width="700">
<img src="assets/azure9.png" alt="Alt Text" width="700">
<img src="assets/azure10.png" alt="Alt Text" width="700">

#### Opret GitHub Actions Workflow  
I deployment center angives Github som source og herefter skal GitHub autoriseres så Azure kan oprette en workflow fil i repoet:  

<img src="assets/azure11.png" alt="Alt Text" width="700">  
Vælg organization, repository og branch. Klik herefter på "Save":  
<img src="assets/azure12.png" alt="Alt Text" width="700">

   


Når du forbinder dit repo til Azure via Deployment Center, oprettes filen: main_messageapp.yml i `.github/workflows` og jobbet starter på Github.  


```yaml

# Docs for the Azure Web Apps Deploy action: https://github.com/Azure/webapps-deploy
# More GitHub Actions for Azure: https://github.com/Azure/actions

name: Build and deploy JAR app to Azure Web App - messageapp

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read #This is required for actions/checkout

    steps:
      - uses: actions/checkout@v4

      - name: Set up Java version
        uses: actions/setup-java@v4
        with:
          java-version: '21'
          distribution: 'microsoft'

      - name: Build with Maven
        run: mvn clean install

      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v4
        with:
          name: java-app
          path: '${{ github.workspace }}/target/*.jar'

  deploy:
    runs-on: ubuntu-latest
    needs: build
    permissions:
      id-token: write #This is required for requesting the JWT
      contents: read #This is required for actions/checkout
  
    steps:
      - name: Download artifact from build job
        uses: actions/download-artifact@v4
        with:
          name: java-app
      
      - name: Login to Azure
        uses: azure/login@v2
        with:
          client-id: ${{ secrets.AZUREAPPSERVICE_CLIENTID_44C834E771524BACA6DAFC4156423165 }}
          tenant-id: ${{ secrets.AZUREAPPSERVICE_TENANTID_6B37D42488B144458CF86343FF034A53 }}
          subscription-id: ${{ secrets.AZUREAPPSERVICE_SUBSCRIPTIONID_4C74A272CE3B43F786F4F7B150A1191D }}

      - name: Deploy to Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v3
        with:
          app-name: 'messageapp'
          slot-name: 'Production'
          package: '*.jar'
          

```
<img src="assets/azure14.png" alt="Alt Text" width="700">  

messageapp kan nu tilgås på Azure:  

<img src="assets/azure16.png" alt="Alt Text" width="500">  
Det genererede workflow indeholder også build jobbet. Vi behøver således ikke 
vores oprindelige workflow. 
Vi kan derfor disable det:   
<img src="assets/azure17.png" alt="Alt Text" width="1000">  
Alternativt kan man angive at Azure skal flette deploy jobbet ind i et eksisterende workflow.




## Aktiviteter
Idriftsæt Turistguide 2 på Azure
