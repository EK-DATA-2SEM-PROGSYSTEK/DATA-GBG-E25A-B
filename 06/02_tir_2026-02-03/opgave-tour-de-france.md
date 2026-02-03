## Opgave: Tour de France

### Læringsmål:
- At kunne vælge og bruge passende kollektionstyper fra Java Collections Framework
- At kunne bruge interfaces og deres implementeringer
- At kunne implementere unit testing

### Krav:
Der skal implementeres funktionalitet, der opfylder følgende user stories:

US1 Afsluttende Hold: Som cykelanalytiker ønsker jeg en liste over hold, som havde cyklister, der afsluttede, 
så jeg kan rådgive potentielle sponsorer.”

US2 Hold og Medlemmer: Som cykelanalytiker ønsker jeg en liste over hold og deres afsluttende medlemmer, 
så jeg kan rådgive potentielle sponsorer.

US3 Holdmedlemmer: Som cykelanalytiker ønsker jeg en liste over holdmedlemmer for et bestemt hold, 
så jeg kan rådgive potentielle sponsorer.

Et brugerinterface skal ikke implementeres. De implementerede klasser skal testes ved at implementere unit tests.



Data til øvelsen findes i csv-filen [tdffinishers2025.csv](tdffinishers2025.csv), 
som indeholder en liste over alle afsluttende cyklister fra Tour de France-løbet 2025.

File formattet er: ```rank;rider;rider no;team;time;gap```

Et eksempel vises her:
```
1;TADEJ POGACAR;1;UAE TEAM EMIRATES XRG;76h 00' 32'';-
2;JONAS VINGEGAARD HANSEN;11;TEAM VISMA | LEASE A BIKE;76h 04' 56'';+ 00h 04' 24''
3;FLORIAN LIPOWITZ;72;RED BULL - BORA - HANSGROHE;76h 11' 32'';+ 00h 11' 00''
```

### Implementering:
En klasse ```Cyclist``` skal implementeres, som repræsenterer en linje data i filen. Kun navn og hold er nødvendigt.

En klasse ```TDFFileReader``` skal implementeres, som har følgende metoder:
```
public TDFFileReader(String fileName)
public List<Cyclist> readFile()
```

En klasse ```Statistics``` skal implementeres, som har følgende offentlige metoder:

```getTeams()```
- som returnerer en samling af hold (en ```ArrayList``` skal ikke anvendes).
     
```getTeamsWithMembers()```
- som returnerer en samling af alle hold sammen parrede med deres medlemmer.

```getTeamMembers(String team)```
- som returnerer en samling af navnene på cyklisterne på holdet (en ```ArrayList``` skal ikke anvendes).

### Test data:

Der er 23 hold.

Der er 8 rytter i TEAM VISMA | LEASE A BIKE.

Team UNO-X MOBILITY består af TOBIAS HALLAND JOHANNESSEN, ANDREAS LEKNESSUND, MARKUS HOELGAARD,
JONAS ABRAHAMSEN, ANDERS HALLAND JOHANNESSEN, MAGNUS CORT NIELSEN og STIAN EDVARDSEN-FREDHEIM.


### Hints:

Der kan læses fra en tekstfil på flere forskellige måder. En måde er at bruge ```Scanner```:

```
public class TDFFileReader {
private final Scanner scanner;

    public TDFFileReader(String fileName) throws FileNotFoundException {
        File file = new File(fileName);
        scanner = new Scanner(file);
    }

    public List<Cyclist> readFile() {
        // code omitted
        // metode parseLine not shown
        
        while (scanner.hasNext()) {
            csvCyclist = scanner.nextLine();
            cyclists.add(parseLine(csvCyclist));
        }
        
        // code omitted
    }
```
