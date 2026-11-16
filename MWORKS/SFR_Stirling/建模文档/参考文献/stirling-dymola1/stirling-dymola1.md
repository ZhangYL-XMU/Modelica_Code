Memòria

![](images/59deb84c4b106c5d295cedc0bb94c4b8013b569309b060df9d6f983b7fe3e172.jpg)

Barcelona, 10 de Juny de 2013

![](images/b87c28d78a67a16a7d07d44625f84fd9a4da2333fca93c041d9b0723035a4934.jpg)

# ÍNDEX MEMÒRIA

Capítol 1: Introducció..   
Capítol 2: Dymola.. 5   
2.1. Modelatge. 6   
2.2. Simulació. . .8   
Capítol 3: Motor Stirling 11   
3.1. Tipus de configuracions de motors Stirling. .. 11   
3.1.1. Configuració Alfa:. 11   
3.1.2. Configuració Beta:. .12   
3.1.3. Configuració Gamma: 12   
3.2. Cicle termodinàmic. 13   
3.3. Funcionament. . .14   
3.4. Models. 16   
3.4.1. Model Mecànic. .16   
3.4.2. Model Termodinàmic. 27   
3.4.3. Incorporació d’un regenerador al Model Termodinàmic. ..55   
Capítol 4: Principals paràmetres de disseny... ..61   
Capítol 5: Futures millores. ..71   
5.1. Dimensionament del coeficient globals de transferència de calor....... 71   
5.2. Dimensionament dels sistemes de refredament i d’escalfament. ....... 75   
5.3. Facilitació de la interacció usuari/programa.. .75   
Capítol 6: CONCLUSIÓ.. .76   
Capítol 7: BIBLIOGRAFIA. .77

# RESUM

Es presenta un estudi a partir del qual una persona interessada pot dissenyar i estudiar, mitjançant simulació, un motor Stirling amb la finalitat de tenir prou informació per decidir si es procedeix a la construcció d’un prototip real o no. Aquesta eina està desenvolupada amb el software Dymola, com que l’anàlisi de les equacions que intervenen en el sistema és el mateix, es podrien programar aquestes en un altre entorn.

# RESUMEN

Se presenta un estudio a través del cual una persona interesada puede diseñar y estudiar, mediante su simulación, un motor Stirling con la finalidad de tener suficiente información para decidir si se procede con la construcción de un prototipo real o no. Esta herramienta está desarrollada con el software Dymola, puesto que el análisis de las ecuaciones que intervienen en el sistema es el mismo, se podrían programas estas en cualquier otro entorno.

# ABSTRACT

A study is presented by which a person who is interested can design and study, by simulation, a Stirling engine with the idea of getting enough information by which one can decide if to carry through the construction of a real prototype or not. This tool is developed on Dymola software, as the analysis of the equations that intervene in the system is the same, they could be programmed in any other environment.

"Sistema autònom de generació

elèctrica basat en motor Stirling"

"Agraeixo la possibilitat de haver realitzat el treball final de grau sobre una temàtica que jo he escollit, els mitjans que m’ha facilitat la Universitat Politècnica de Catalunya per a la seva realització i l’assessorament, disponibilitat i recolzament del tutor del treball.

També agrair a familiars i amics el suport en els moments d’il·lusió i de frustració durant la investigació".

# CAPÍTOL 1: INTRODUCCIÓ

En el present treball final de grau, l’objectiu és investigar sobre la construcció d’un sistema de generació elèctrica basat amb motor Stirling.

Per poder realitzar la construcció del sistema, s’investigarà aquest implementantlo en un software de simulació computacional anomenat Dymola, aquest software resol equacions de sistemes a través de l’aplicació de mètodes numèrics assegurant així una alta fiabilitat en el seus resultats. L' utilització d’aquest software ens dona la possibilitat de realitzar un estudi molt més extens i precís que els que s'han utilitzat fins ara. Un cop programat el funcionament del motor partirem d’uns resultats obtinguts amb un d’aquests estudis ja coneguts que utilitzarem com a referència per començar les simulacions amb Dymola.

El motor Stirling pot funcionar amb un gran nombre de fonts de calor, prescindirem inicialment de l’estudi d’aquestes i centrem la investigació en el disseny i construcció del motor pròpiament dit amb el software anteriorment esmentat, ja que un cop tinguem el disseny d’un motor amb un bon rendiment aquest es podrà acoblar a quasi qualsevol font de calor disponible.

Caldrà assolir uns coneixements previs sobre la utilització i programació amb Dymola, així com del funcionament termodinàmic i mecànic del motor.

Actualment la recerca del motor Stirling no està molt desenvolupada perquè estem molt adaptats als motors i combustibles convencionals, tot i que avui en dia comença a haver-hi una tendència a I’ utilització d’energies renovables i a l’estalvi energètic. Principalment s’està estudiant per la implementació en petites centrals de generació elèctrica en poblacions aïllades. Si la seva investigació avança favorablement pot haver-hi un mercat per la seva aplicació.

elèctrica basat en motor Stirling"

# CAPÍTOL 2: DYMOLA

Dymola, software desenvolupat per la companyia Sueca Dassault Systèmes AB, és una eina completa per el modelatge i la simulació de sistemes complexes. Ens permet simular el comportament dinàmic dels sistemes així com les interaccions entre ells per diversos camps de l’enginyeria com: la mecànica, l’electricitat, la termodinàmica, els sistemes de control, etc.

Dymola es basa en el llenguatge obert de Modelica, que significa que I' usuari disposa de llibreries de models, en els diferents àmbits de l’enginyeria ja esmentats, que pot modificar o utilitzar per a la creació dels seus nous sistemes a estudiar. A continuació descriurem com és l’entorn del modelatge per a la creació d’aquests models així com l’entorn de la simulació per l’estudi d’aquest.

Per tal de poder utilitzar tot el potencial de Dymola cal instal·lar també un compilador com és C++, Visual Studio, tant pot ser la versió 2008 com la 2010 que trobem gratuïtament en la pagina web de Microsoft Windows. I que permetra a Dymola, executar les simulacions a nivell de visualització 3D i aplicar la resolució matemàtica al sistema.

Aquestes simulacions es faran anar, en una versió de Dymola de llicencia educacional que es troba instal·lat en un ordinador, facilitat per la Universitat Politècnica de Catalunya, que ens ofereix uns recursos de simulació més elevats que els ordinadors convencionals ja que les seves prestacions o característiques tècniques són més elevades.

**Les característiques d’aquesta màquina anomenada PC186 són:**

PC186 SGI-H2106, amb una placa base que disposa de quatre cpu's (AMD OPTERON 6140) de 8 cores cada cpu . Consta d'un total de 64 GB de RAM. Hi en aquests moments hi ha un disc principal de 1 TB (amb RAID 1, mirall amb un disc de les mateixes característiques per qüestions de seguretat) i dos discs secundaris de 2 TB, donant-li una capacitat total d'emmagatzemament de 5 TB.

Te instal·lada la versió de linux Ubuntu 11.04

CPUs, related to AMD Opteron 6140
<table><tr><td rowspan=1 colspan=8>CPUs, related to AMD Opteron 6140</td></tr><tr><td rowspan=1 colspan=1>Model</td><td rowspan=1 colspan=1>Cores /Threads</td><td rowspan=1 colspan=1>Freq.</td><td rowspan=1 colspan=1>L3cache</td><td rowspan=1 colspan=1>Multi-processing</td><td rowspan=1 colspan=1>TDP</td><td rowspan=1 colspan=1>Features</td><td rowspan=1 colspan=1>Price</td></tr><tr><td rowspan=1 colspan=1>Opteron 6140</td><td rowspan=1 colspan=1>8/ 8</td><td rowspan=1 colspan=1>2.6 GHz</td><td rowspan=1 colspan=1>12 MB</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>115 Watt</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>$989</td></tr></table>

II-lustració 1 Característiques CPU del PC186.

## 2.1. Modelatge.

A part del modelatge a través de Dymola, aquest es pot enllaçar amb altres programes de creació de models com Simulink o programes de disseny CAD i exportar models o dissenys que vulguem implementar al nostre model.

Dymola té un entorn de modelatge molt dinàmic que permet la creació, modificació i interacció de models per diverses vies. Per tal d’entendre més fàcilment aquestes vies, dividirem l’entorn de modelatge en sis parts.

![](images/5c7904208a0f5d9fabbcd160701d148eb962c5b7154965f95a51947c2871a80b.jpg)  
Il-lustració 2 Entorn de modelatge Dymola.

elèctrica basat en motor Stirling"

**1. Arxiu (File).**

Apart de poder fer les coses bàsiques amb un arxiu, com guardar-lo, copiar-lo, etc. si anem a File->New->podem seleccionar quin arxiu o component del sistema volem crear: El model o sistema complex¹, un connector del sistema, una funció del sistema, una llibreria de models o components etc.

Packages 2. Packet de llibreries (Modelica)

Aquí trobem Ilibreries, sobre diversos camps de l’enginyeria, de components i models que Dymola té creats. L’usuari pot utilitzar-los per a la creació del seu sistema o modificar els existents per ajustar-los a les necessitats del seu.

**3. Àrea de disseny**

Com el seu nom indica aquí es on podem donar un format gràfic al component o model que estem creant. A través de la combinació dels elements de la barra d’eines que es troba al cantó de la icona, d’àrea de disseny, podem donar una imatge a l’arxiu o sistema complex que ajudi a identificar d’una manera visual quina potser la seva funció.

**4. Àrea d’interacció**

Anomenem àrea d’interacció a aquesta part del programa perquè es on visualment podem afegir els components d’un sistema (variables, funcions, connectors, etc.) o d’un sistema complex (models, condicions inicials, connectors, etc.) i crear les connexions entre aquests.

**5. Àrea de codi.**

Part del software que recull, en llenguatge Modelica, tot el que es fa en l’àrea de disseny i d’interacció sobre el component o model que s'està creant. També permet afegir de manera manual, és a dir, introduint codi, les característiques del component o del model i que ajuden a descriure millor el comportament d’aquest com poden ser variables, equacions, connexions, condicions inicials, etc.

Per tal de poder entendre bé els conceptes explicats durant la memòria cal definir correctament els següents conceptes:

Paràmetre: Variable que Dymola interpretara com a constant durant la simulació per lo tant Dymola ja sabrà que les derivades d’aquesta variable respecte del temps seran zero.

Variable: Com el seu nom indica és refereix a un valor que canviarà de magnitud segons les situacions o evolució del sistema. On caldrà especificar a Dymola com són les seves derivades respecte del temps per tal de que aquest pugui anar definint la seva nova magnitud.

Condició inicial: Característica que podem definir sobre una variable no constant en el temps, per tal de donar-li a Dymola informació de com es troba inicialment aquesta variable i per tal de que tant nosaltres com Dymola puguem interpretar si l’evolució del sistema es correcta o no. Aquestes condicions inicials es lo que trobem definit com "start=" al canto de una variable. A més a més, podem especificar-li a Dymola si inicialment la variable a la que li hem definit la condició inicial ha d’assolir aquest valor indispensablement o si el valor es nomes una magnitud orientativa del valor que aquesta hauria de prendre al iniciar-se el sistema. Això es fa marcant la condició incial com a certa (=True) o com a orientativa (=Inherited).

**6. Components (Unnamed).**

Aquí podem accedir i veure, ràpida i estructuradament, els models d’un sistema complex així com als components de cada model que el composen.

Una eina que no s'ha esmentat i que és molt útil de la part de modelatge, és la icona d'informació( que podem consultar per veure la descripció del funcionament del component que haguem seleccionat així com la definició de les seves variables i corresponents unitats. Això ens ha servit de gran ajuda alhora d’entendre els components del model mecànic reutilitzats que vorem més endavant.

## 2.2. Simulació.

Aquesta part del software també suporta els models exportats d’altres programes a la part de modelatge, podent executar així animacions CAD no només fetes en Dymola. Aquest entorn també ens ofereix la possibilitat d’exportar els resultats del sistema o si ho preferim de les variables que ens interessin estudiar d’aquest, a altres programes de tractament o interpretació de dades.

L'entorn de simulació de Dymola ofereix diverses maneres de visualitzar els resultats de la evolució dels sistemes així com ofereix diversos mètodes numèrics per a la resolució d’aquests. Per entendre com fer la visualització desitjada i com seleccionar el mètode numèric a aplicar així com el temps d’estudi del sistema, dividirem l’entorn de simulació en sis parts.

![](images/e3b2252269f2d329a15e77364a52b28e4db42c571ce26ed226bb2880dbf52c76.jpg)  
Il-lustració 3 Entorn de simulació Dymola

• Menú de Simulació (1simulation).

A l’interior d’aquest menú trobem varies opcions de funcions per aplicar al sistema i la seva lectura, però ens centrarem en les del nostre interès que són dues:

a) Simulate ( Simulate ): Funció de simular el sistema i resoldre'l segons el métode numéric que Dymola detecti per defecte si no li hem especificat que utilitzi un altre.

b) Setup (, Setup.. ): Funció que obrirà un submenú on podem fer eleccions com: el mètode numèric pel que resoldre el sistema (Simualte->Setup->General->Integration->Algorithm-> Ilistat de mètodes que Dymola pot aplicar.), els intervals de temps d’estudi de la funció (Simualte->Setup->General->Simulation interval-> trobem el temps d’inici o start time i el temps final o stop time) o demanar a Dymola que ens envií informació sobre els missatges d’error de la simulació per identificar el perquè aquesta falla (Simualte->Setup->Debug-> Diverses opcions d’informació).

**• Menú Gràfiques (Plot)**

Tal i com el seu nom indica, aquest menú ens permet gràficar les solucions de les variables del sistema que vulguem estudiar. Aquest

menú ens ofereix un seguit de recursos per manipular les gràfiques i poder realitzar el nostre estudi d’una manera més detallada.

**• Menú Animació (Animation).**

Aquest és l’altre tipus de representació de la solució que Dymola ens ofereix. Aquesta representació consisteix en una visualització 3D del model que tant pot estar feta amb el mateix Dymola com amb algun programa de disseny CAD amb el que Dymola sigui compatible (com per exemple Solidworks). La finalitat d’aquesta representació es ajudar a l’usuari a entendre millor la funcionalitat del sistema així com comprovar si aquest realment realitza la seva funció correctament.

**• Variables**

Espai en l’entorn de simulació en el que trobem tots els components o models que intervenen en el sistema i dels quals podem seleccionar les variables que volem representar en les gràfiques o el model que volem veure l’animació (si aquesta ha estat dissenyada i programada). A més a més podem modificar valors de les variables definides com a paràmetres directament des d’aquí, sense necessitat de retornar a l’entorn de modelatge, i tornar a simular per observar els canvis en el sistema.

**• Zona de representacions**

Aquí se'ns obriran les finestres de les visualitzacions que volem que Dymola ens representi. Per defecte, Dymola sempre ens obre una finestra de representació gràfica però accedint a qualsevol dels menús de representació esmentats i seleccionant new window, podrem obrir tants nous espais de representació com vulguem.

**• Zona de Missatges**

En aquest espai, Dymola ens ensenya e informa en temps real de la simulació així com dels possibles errors generals que trobi durant aquesta. Podem identificar després l’origen dels errors amb la funció Debug abans esmentada.

elèctrica basat en motor Stirling"

# CAPÍTOL 3: MOTOR STIRLING

El motor Stirling, inventat per Robert Stirling al 1816, és un motor tèrmic que basa el seu funcionament en l’aprofitament dels canvis volumètrics d’un fluid de treball com a resultant dels canvis de temperatura que aquest rep. Aquest canvis de temperatura són exercits sobre al fluid a conseqüència d’un desplaçament, entre una zona calenta i una freda, provocat per un pistó i un desplaçador dins d’un cilindre tancat.

## 3.1. Tipus de configuracions de motors Stirling.

Hi ha tres tipus de configuracions diferents per als motors Stirling amb diferents dissenys mecànics disponibles:

### 3.1.1. Configuració Alfa:

$$
C o n f i g u r a c i \acute { o } A I f a :
$$

Constituït per dos cilindres, desfasats 90º i connectats per un conducte, on en un trobem el desplaçador on s’aplicara l’escalfament i en l’altre trobem el pisto de potència que rebra el refrigerament. Per tal de millorar la refrigeració és poden dissenyar aletes al cilindre del pistó de potència.

![](images/8da0b61e8224819218fcf4accf46c65985077d29125929b7246350c8a5ef5def.jpg)  
Il-lustració 4 Motor Stirling de configuració alfa.

### 3.1.2. Configuració Beta:

En aquesta configuració el desplaçador i el pistó de potència comparteixen cilindre cossa que dificulta la seva fabricació ja que ha de ser precisa. El pas de l’aire es permet deixant una folgança entre el desplaçador i el cilindre.

![](images/f39ebf2d9cab59f825c89ca73621ebceedf7a030fbcdaa99f7533125d1d279c1.jpg)  
Il-lustració 5 Motor Stirling de configuració beta.

### 3.1.3. Configuració Gamma:

Aquesta configuració es molt semblant a la beta ja que l’orientació dels pistons es idèntica però aquests es troben un dos cilindres separats. La configuració al ser més senzilla de construir també ofereix menys potència ja que és tenim més volum mort.

![](images/b186efa26fc74ad77a3bd446cfb7fc55eb87efc58821f41e661a91d3b3be659d.jpg)  
Il-lustració 4 Motor Stirling de configuració gamma.

## 3.2. Cicle termodinàmic.

El cicle termodinàmic que segueix el motor Stirling és el cicle Stirling, aquest cicle en la teoria s’aproxima al rendiment màxim de Carnot, cosa que el fa en quan a motors tèrmics la millor opció. Tot i que teòricament aquest motor agafa rendiments alts cal esmentar que no valdria com a motor de cotxe ja que la seva potencia és baixa i aquest rendiments alts s’aconsegueixen a baixes velocitats.

Aquest cicle consta de 4 etapes, dos processos iscorics (un escalfament i un refredament a volum constant) i dos isotèrmics (una compressió i una expansió a temperatura constant).

![](images/bf0c96a359fbf18603bac29c8683748bca7f14e9380d7de4db17e879459fa625.jpg)  
Il-lustració 5 Cicle Stirling.

1-2 Compressió isotèrmica del gas a la temperatura inferior cedint calor a la font freda.

2-3 Escalfament a volum constant concedit per el regenerador que provoca un augment de la pressió.

3-4 Expansió isotèrmica del gas que es troba a la temperatura màxima on aquest absorbeix calor de la font d’escalfament.

4-1 Refredament a volum constant disminuint la temperatura del fluid cap a la temperatura mínima.

## 3.3. Funcionament.

En la primera posició el pistó de potència ens acaba d’entregar la força al eix degut a que la pressió al cicle es màxima. Per tal de reduir aquesta pressió necessitarem provocar el moviment del desplaçador, cap el seu punt mort superior, desplaçant així el aire cap a la zona freda del sistema i aconseguint la reducció de pressió. El volant d’inercia ens ajudarà a torna fer baixar el pistó de potència. Pms

![](images/be91bd728e706cbb2162b5cea9295c8e1269704f97b158889eabd4cfa29d0004.jpg)  
Il-lustració 6 . Començament de la reducció de pressió del sistem.

En la segona posició observem que el desplaçador ha arribat al seu punt màxim tenint tot el aire desplaçat cap a la zona freda aconseguint així haver reduït la pressió del sistema amb el refredament del gas.

![](images/8a651b39831a792d6a59c637273524bc60848d24bf9fe8478eec36cbc46304d2.jpg)  
Il-lustració 7 . Refredament màxim del aire.

En la tercera posició el pistó ja arribat al seu punt mort inferior i el desplaçador comença el seu descens cap al punt mort inferior tornant a introduir al aire cap a la zona d’escalfament del sistema.

![](images/913a00cded48a1e6c727ea4d967af6418c9817ffebdf192719ba8766a32c55b5.jpg)  
Il-lustració 8 . Començament del escalfament del gas.

Finalment en la quarta posició tindrem tot el gas en la zona calenta, portant novament al gas cap a la seva pressió màxima. Al tornat augmentar la pressió la diferència de pressions amb l’exterior provocarà l’ascensió del pistó de potència i entregarà la força al sistema.

![](images/6343b0aac3b3fbe27d0e209bb6a83d4bb3477906b1da030914b7059ed6089e28.jpg)  
Il-lustració 9 . Escalfament màxim del aire.

Com que en la realitat no s’aconsegueixen valors ideals per a la transferència de calor i que els moviments també compten amb altres factors, que en la teoria no es consideren com per exemple pèrdues de calor per fregament o altres, fa que és perdi potència i rendiment i per tant el cicle quedi descrit per una forma el·líptica.

![](images/75e66c2a13eafd8c13e63e4385012fa2082784e850595d5e78af789b8b7514b1.jpg)  
Il-lustració 10 Cicle Stirling real.

## 3.4. Models.

Ara que ja hem entès com funciona el motor i que coneixem el programa, podem passar al disseny o implementació d’aquest en Dymola. Per tal de simplificar tant la creació com l’explicació del sistema, hem dividit aquest en dos models o subsistemes més senzills anomenats: model mecànic i model termodinàmic.

### 3.4.1. Model Mecànic.

Com el seu nom indica és el model que s’encarrega de descriure la part mecànica del sistema. Per al modelatge d’aquest sistema no s'ha creat cap nou component ni model, sinó que s'han reutilitzat models i components de llibreries existents de Dymola (exactament les de Modelica->Mechanics).

La funció del model mecànic és la de transformar l’energia tèrmica, en energia mecànica de la qual posteriorment en farem energia elèctrica.

El model mecànic, està principalment format per quatre components: El pistó de compressió, el pistó d’expansió o desplaçador, el cigonyal i el cilindre o carcassa.

**• Pistó de compressió.**

És l’element encarregat de rebre la pressió interior del cilindre, que es tradueix en una força sobre el pistó, i que provoca el moviment de tot el sistema. Es troba situat en la part freda del motor. Els elements que el composen són els següents:

![](images/f8788594b589194b654517534ce6fa74d61e65420149b8e7148beb19c362f3a5.jpg)  
Il-lustració 11 Ensamblatge d’un pistó.

elèctrica basat en motor Stirling"

a) Cap del pistó: És la part més pesada i amb més secció del pistó . Hi trobem els anells i el buló. Els anells serveixen per pressuritzar la cambra entre pistó i cilindre. El buló és l’element que ens permetrà unir el cap amb la biela.

![](images/9a916c2c7181c71589360af91be6abe475dc2d71d7209116e8bfa5bd87aa2785.jpg)  
Il-lustració 12 Cap del pistó.

b) Biela: Element que uneix el cap del pistó amb el colze de cigonyal o manivela i que traspassa el moviment lineal del cap al cigonyal, per tant trobarem que aquest element ha de ser capaç de suportar esforços de compressió i flexió. Un factor important a I'hora de dissenyar la biela és que la longitud d’aquesta, ha de ser dos cops el diàmetre de gir descrit per la manivela.

![](images/86917d4a2fa24d3897ec3ae3b8b3b6bf30d04845c2d7e85581566611834b55d9.jpg)  
Il-lustració 13 Biela.

c) Rodaments: Elements d’unió que redueix la fricció entre un eix i la peça connectada a ell per mitjà d’una rodadora. Serveix de suport i facilita el desplaçament d’un envers de l’altre. Els trobem entre buló - biela i entre biela - cigonyal.

![](images/c9923ca523921bfc2fc921d8bc6a93465ccbbaae8a14857eacfa42b2748df79f.jpg)  
Il-lustració 14 Vista seccionada d’un rodament.

**• Pistó d'expansió o desplaçador.**

Element del model mecànic que s’encarrega de desplaçar l’aire de una zona a l’altre. Com que el pistó de compressió dona un moviment al cigonyal, aquest el transmet anàlogament al desplaçador. Aquest moviment tindrà el mateix període que el de compressió però desfasat 90º tal i com les especificacions d’un motor beta ens indica.

Els components que formen el desplaçador són els mateixos que el del pistó de potència.

**• Cigonyal**

Part del motor que connecta als dos pistons. Rep la força d’explosió del pistó de compressió i el transforma en moviment rotatiu. Aquest moviment rotatiu es transfereix com a moviment lineal al desplaçador quedant lligades així les posicions d’un pistó en funció de l’altre.

![](images/41520b1cf8e2c93175ce20f1f6dd7d0d1b279032f2777ec75ba7625af3a02092.jpg)  
Il-lustració 15 Cigonyal del motor Stirling.

**• Cilindre.**

Definim com a cilindre, la carcassa o element protector del motor que s’encarregarà de protegir-lo dels afers exteriors, de acabar de definir la geometria del motor i de transferir les calors de l’exterior al gas del interior.

Un cop identificades les diferents parts del motor podem entendre I' interacció del conjunt.

![](images/424c3bcbacbeb47e0a01cffa7da4aeb831953e38aeb8d0b0f8bd7707b8e4c26a.jpg)  
Il-lustració 16 Vista en planta de la configuració mecànica.

![](images/a9156875aa50b076f0e5cfa24549a7145e929f208ebd9dd871bd704758433663.jpg)  
Il-lustració 17 Vistadeperfil de la configuració mecànica.

Anàlisis del funcionament del model mecànic:

La força exercida per la pressió provoca un moviment lineal del cap del pistó de compressió, des de un punt inferior (PMI) a un superior (PMS) que es tradueix en el cigonyal com un moviment circular

![](images/dc770c695682511a4c7cfe58e7b78b2efa5c46691e671e68d6197d05727336ab.jpg)  
Il-lustració 18 Descripció del moviment del pistó de potència del motor Stirling

El cap del pistó rep la força que és:

$$
F = P 2 ^ { * } A 2
$$

On:

P2= Pressió en la zona del pistó.

A2= Area pistó compressió.

Fent un anàlisis de les forces que actuen veiem que podem descriure la força que actua en el cap del pistó de compressió, com el producte de aquesta mateixa força per l’ angle entre l’eix longitudinal del cap del pistó de compressió i la seva biela:

elèctrica basat en motor Stirling"

![](images/7c3536b144a3a267ec17aa7fd6efbd9de2c83cd89f7a89af178387b9a6005618.jpg)  
Il-lustració 19 Detall de les seccions d’anàlisis.

Aplicant el trigonometria trobem que podem descriure l’eix longitudinal del cap del pistó en funció de la longitud de la biela i del cigonyal:

$$
\begin{array} { c } { { x = \sqrt { l ^ { \wedge } 2 - B ^ { \wedge } 2 ^ { * } s e n ^ { \wedge } 2 \theta } } } \\ { { { } } } \\ { { x = l ^ { * } \cos \alpha } } \end{array}
$$

Finalment sabent que el parell entregat a l’eix, és el producte de la força que aquest rep per la distància, trobem que el parell entregat al cigonyal és:

$$
T = P 2 ^ { * } A 2 ^ { * } \frac { B } { \sqrt { l ^ { \setminus } 2 - B ^ { \setminus } 2 ^ { * } s e n ^ { \setminus } 2 { \theta } } } { * ( \frac { B ^ { * } s e n ^ { \setminus } 2 { \theta } } { 2 } + s e n { \theta } ^ { * } \sqrt { l ^ { \setminus } 2 - B ^ { \setminus } 2 ^ { * } s e n ^ { \setminus } 2 { \theta } } ) }
$$

Fixant, per geometria del cilindre i dels pistons, un Pms i Pmi. Juntament amb la fórmula anterior podríem descriure la nova posició del pistó de compressió en funció de la força que actua i la nova posició del desplaçador en funció de la posició del pistó de compressió.

Implementació del model mecànic en Dymola.

Dymola conté una llibreria on té exemples de modelatges de motors d’on podem reaprofitar components d’aquests per incloure al nostre motor Stirling. Evitant així tenir que programar les variables, les equacions, els connectors i demés elements que descriuen el funcionament e interacció d’aquestes parts mecàniques.

Si anem a Modelica->Mechanics->MultiBody->Examples->Loops->EngineV6. Trobem un motor V6 del qual podem agafar el model d’un dels seus pistons ja fets i realitzar petits canvis per ajustar-lo al pistó de potència i al desplaçador del nostre motor.

Partint del pistó V6 de la llibreria, identifiquem les parts que ens interessa estudiar i ajustar.

![](images/b368690a7f37aba10f0c171552066f7e6540085334fddcc8b9971a69a56e2f6f.jpg)  
Il-lustració 20 Components d’un pistó modelats en Dymola.

De totes les parts anomenades només ens cal modificar el gas per tal de ajustar el pistó del V6 als pistons del nostre interès. Per al pistó de potència cal substituir el model termodinàmic del motor V6, per el corresponent model termodinàmic del motor Stirling. Per al desplaçador cal eliminar aquest model ja que no rep cap força deguda a la pressió, sinó que només ens mou els volums d’una zona a l’altre (el moviment dels volums provocat pel desplaçador ho definirem dins del model termodinàmic que descriurem en la secció 3.4.2. ).

Agafem el model de l’actual gas que porta el pistó V6 i el copiem en un nou Model que anomenarem ModelConnectors\_Forces. On esborrarem tot el codi actual i introduirem una nova entrada, (Modelica->Blocks->Interfaces->Real Input), que serà la força que el cicle Stirling ens proporcionarà i que igualarem a la força que aquest gas entrega. Ho fem així per tal d’aprofitar els connectors del model gas que ja estan programats per enllaçar-se amb els demés components del model mecànic.

```matlab
model ModelConnectors Forces
import SI = Modelica.SIunits;
extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
Modelica.Blocks.Interfaces.RealInput f_mt
a ;
equation
f = f_mt;
△ a ;
end ModelConnectors Forces;
```  
Il-lustració 21 Codi del Model\_Connectors\_Forces.

**On:**

f\_mt = Força d’entrada al model mecànic entregada per el model termodinàmic.

f = Força resultant en el pistó de potència en el model mecànic.

Un cop tenim el ModelConnectors\_Forces, podem anar a crear el ModelMecanic\_Stirling. On copiem dos pistons V6, a l’àrea d'interacció del nou model, i realitzem les modificacions ja esmentades. Substituir el model del gas actual en el pistó de potència per el ModelConnectors\_Forces creat i eliminar el model gas en el desplaçador.. On de moment, per tal de poder fer una simulació i comprovar que el nou sistema mecànic es mou, equiparem la entrada de la força, que ens entregarà el model termodinàmic Stirling, a l’entrada d'una força sinusoïdal. Això s'aconsegueix connectant una funció sinusoïdal (Modelica->Blocks->Sources->Sine) a l’entrada que hem creat. Quedant el ModelMecanic\_Stirling (provisional) de la següent manera.

![](images/fa27d1ef66f3a1a3fb7b3b3ba5e45771a1e43ff4264e1bbd70328214c3eb4db6.jpg)  
Il-lustració 22 Vista de l’àrea d’interacció del Model\_Mecànic provisional.

Un petit canvi que tambe cal ter es moure l’orientacio deis pistons a l’orientació desitjada (90º de desfasament entre un pistó i l’altre). Això s’aconsegueix canviant el valor del paràmetre de I’ inclinació del cilindre del desplaçador a 90º respecte l’orientació del pistó de potència elegida. Podem realitzar aquet canvi anant al codi del ModelMecanic\_Stirling. Ajustem el valor de CylinderInclination a l’angle desitjat i desprès ajustem CylinderInclination1 al angle de CylinderInclination+90º.

model ModelMecanic Stirling   
import SI = Modelica.SIunits;   
parameter Boolean animation=true "= true, s'activa 1'animació 3D";   
parameter SI.Length cylinderTopPosition=0.42   
"Longitud desde l'eix del cigonyal al final del cilindre del pistó de potència";   
parameter SI.Length pistonLength=0.1   
"Longitud del cap del pistó de potència";   
parameter SI.Length rodLength=0.2 "Longitud de la biela";   
parameter SI.Length crankLength=0.2 "Longitud del cigonyal en la direcció x";   
parameter SI.Length crankPinOffset=0.1 "Offset of crank pin from center axis";   
parameter SI.Length crankPinLength=0.1 "Offset of crank pin from center axis";   
parameter SI.Angle cylinderInclination=0   
"Inclinació del cilindre del pistó de potència";   
parameter SI.Angle crankAngleOffset=-90   
"Inclinació del colze del cigonyal en el pistó de potència";   
parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +   
rodLength - crankPinOffset)   
"Longitud màxima en el cilindre del pistó de potència";   
parameter SI.Length cylinderTopPosition1=0.42   
"Longitud desde 1'eix del cigonyal al final del cilindre del desplaçador";   
parameter SI.Length pistonLength1=0.1 "Longitud del cap del desplaçador";   
parameter SI.Length rodLength1=0.2 "Longitud de la biela";   
parameter SI.Length crankLength1=0.2   
"Longitud del cigonyal en la direcció x";   
parameter SI.Length crankPinOffset1=0.1   
"Offset of crank pin from center axis";   
parameter SI.Length crankPinLength1=0.1   
"Offset of crank pin from center axis";   
parameter SI.Angle cylinderInclination1=90   
"Inclinació del cilindre del desplaçador";   
parameter SI.Angle crankAngleOffset1=-90   
"Inclinació del colze del cigonyal en el desplaçador";   
parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +   
rodLength1 - crankPinOffset1)   
"Longitud màxima en el cilindre del desplaçador";  
Il-lustració 23 Codi del Model\_Mecànic provisional.

Un cop tenim el ModelMecanic\_Stirling podem testejar-lo per comprovar el seu funcionament. Creem un nou ModelMecanic\_Test i incorporem el model mecànic acabat de crear, el món (Modelica->Mechanics->MultiBody->World), un rodament (Modelica->Mechanics->MultiBody->Joints->Revolute) i un volant d'inèrcia al cigonyal (Modelica->Mechanics->Rotational->Components->Inertia). El món ens donarà la gravetat i els eixos de referència del sistema, que coordinaran el moviment, i el rodament permetrà la rotació del cigonyal on el volant d' inèrcia estabilitzarà la rotació d’aquest.

Ho connectem de la següent manera:

![](images/dc3b6de84ebfa4abe07822dfed2524b9ea3df49421f7cc2c93e867613f879a8b.jpg)  
Il-lustració 24 Area d’interacció del ModelMecànic\_Test.

Quan simulem el model mecànic podem comprovar visualment tant per animació com per gràfics que els pistons es mouen, per l’acció d’una força sinusoïdal (li donem una amplitud de dotze mil i una freqüència de trenta herzs), amb un desfasament de 90º entre ells. Les variables que ens permeten veure aquest moviment gràficament són "s", dins de Cilindre\_pistó\_potencia, i "s", dins de Cilindre\_Desplaçador, que corresponent a la posició relativa del pistó de potència i del desplaçador respectivament. Entenen per posició relativa la llargada del volum disponible següent aquest la diferència entre el volum del cilindre i el volum del pistó en moviment de la mateixa zona.

Obtindríem els següents resultats:  
![](images/8bbb0491fd77336eeb3c48451fdbf08d644a542ff1890c045393519536c3e35e.jpg)  
Il-lustració 27 Gràfica de les posicions relatives dels pistons.

![](images/db10b7b19b552ffcc159d28cef14be38cfaa134ade6cc52a52b03744ccc5b75c.jpg)  
Il-lustració 28 Força exercida sobre el pistó de potència.

![](images/45fb29526754a2ca2317310b41335c51a63bd50195f30832327c263af4af0be3.jpg)  
Il-lustració 29 Animació 3D del model mecànic.

El model termodinàmic és la part més important del motor ja que és la que ens donarà la força així com les temperatures de treball. Aquesta part s'ha modelat des de zero, ja que Dymola no disposa de cap model que s’assimili al cicle Stirling amb el qual treballa el gas.

Per a I’ implementació d’aquest model s’han diferenciat dues parts. La primera on només modelem un moviment de masses, en funció dels volums que el moviment del desplaçador ens atorgarà a cada zona, a temperatura constant. I una segona on modelarem l’escalfament i el refredament, de les masses de les respectives zones, en funció dels volums disponibles en cada una d’elles.

**• Primera part, moviment masses:**

Partint de la construcció del model mecànic anterior sabem que necessitarem relacionar les posicions dels pistons que aquest té amb les posicions dels pistons en el model tèrmic que ens donarà els volums disponibles en cada zona i ens retornarà una força resultant. Per tant necessitarem un primer model que anomenarem ModelConnector\_Posicions\_Force que ens relacioni l’entrada de aquestes posicions al model termodinàmic i la sortida de la força d’aquest model cap al mecànic.

![](images/e7f24622976379d88e975bf179c101e19a749712f354193eb5d806c3fc05bab7.jpg)  
Il-lustració 30 Codi del ModelConnectors\_Posicions\_Forces.

On:

u = Entrada posició relativa del pistó de potència .

u1 = Entrada posició relativa desplaçador.

fo = Sortida força entregada per el model termodinàmic.

Un cop tenim relacionades les entrades i sortides del model passem a modelar el moviment dels volums creant un nou model anomenat ModelVolums. Observant les gràfiques resultants de l’estudi del model mecànic veiem que aquestes posicions descriuen un moviment sinusoïdal desfasat 90º entre un i l’altre, on el desplaçador es troba a la seva posició màxima i el pistó de potència a la meitat de la seva posició màxima. Com que de moment estudiem els models per separat ajustarem l’entrada d’aquestes posicions com una constant, multiplicada pel temps, que transformarem en una sinusoide i a una de les dos la desfasarem 90º (pi mitjos) respecte de l’altre.

Quedant descrit aquest moviments de la següent manera:

![](images/8d02a4ea47dd54c1ce450c2f37c541e620742d0efe28714a6af9c9a8784873d8.jpg)  
Il-lustració 31 Codi entrada de posicions del ModelVolums.

Se li suma 1 al valor del sinusoide per tal de fer-la tota positiva i es divideix el valor de les dues entrades per 10 per ajustar la magnitud del valor a un valor més real. Conseqüentment, un cop sabem com es descriuen aquestes posicions relatives i observant la geometria inicial del model mecànic, podrem saber quins paràmetres constants tenim i com es relacionen aquestes entre un model i l’altre.

![](images/75df380b09799514770107d7fd12dcaf50c1ae95851847a69467b8b7966dfeac.jpg)  
Il-lustració 32 Esquema de la configuració del model.

Així podrem marcar també unes condicions inicials que ajudin a iniciar la simulació del model termodinàmic i a identificar si aquest s'està ajustant-se correctament o no a la funció desitjada que ha de desenvolupar. Aquestes condicions inicials són la pressió i temperatura inicial del sistema que serà igual en tot ell. Els volums inicials en cada zona, que depenen de les posicions relatives inicials que coneixem ja que les hem marcat el model mecànic, la suma dels quals ens donarà el volum total del sistema. I el nombre de mols en cada zona, així com en el total del sistema, que podem treure a partir de l’equació dels gasos ideals ja que el gas de treball és aire. També caldrà incloure òbviament certs paràmetres d’aquest gas ideal.

**A partir de l’imatge anterior podem definir:**

Paràmetres geomètrics:

model ModelVolums\_Only   
extends ModelConnectors Posicions Forces;   
//Sub model que intercanvia 1'entreda de les posicions i la sortida de la força"   
import SI = Modelica.SIunits;   
//Parametres de valor constants en 1'estudi del sistema.   
parameter .Real d1 "Diametre del desplaçador";   
parameter .Real 1 d "Longitud del desplaçador";   
parameter .Real d2 "Diametre del pistó de potència";   
parameter .Real dc "Diametre del cilindre";   
constant .Real pi=3.141592 "Constant número pi";   
parameter .Real A1=pi\*d1^2/4 "Area superior desplaçador";   
parameter .Real A2=pi\*d2^2/4 "Area superior pistó de potència";   
parameter .Real V\_l=A\_an\*l\_d "Volum en el lateral del cilindre";   
parameter SI.Volume VT=V1o+V2o+V\_1 "Volum total del sistema";   
parameter .Real A an=pi\*(dc^2-d1^2)/4   
"Area anul-lar disponible entre la zona 1 i el cilindre";   
parameter .Real Vm1 "Volum mort en el del desplaçador";   
parameter .Real Vm2 "Volum mort en el pistó de potència";

**Paràmetres geomètrics i condicions inicials:**

parameter SI.ThermodynamicTemperature To = 293.15   
"Temperatura inicial al sistema (Temperatura ambient)";   
parameter SI.Pressure Po = 100000 "Pressio inicial del sistema";   
parameter .Real n1 o=(Po\*V1o)/(R\*To)   
"Nombre de mols que inicialment es troben a la zona 1 (deplaçador)";   
parameter .Real n2 o=(Po\*V2o)/(R\*To)   
"Nombre de mols que inicialment es troben a la zona 2 (Pistó de potència)";   
parameter .Real nt o=(Po\*VT)/(R\*To)   
"Nombre total de mols que inicialment es troben al sistema";   
parameter .Real V1o= Vm1 + A1\*(1+sin(3.1514/2))/10;   
parameter .Real V2o = Vm2 + A2\*(1/10) - A1\*(1+sin(3.1514/2))/10 + 2\*1 d\*A1   
"Volum inicial pistó de potència";

Paràmetres gas ideal:   
parameter .Real M=29 "Pes molecular substancia interna (aire)";   
parameter .Real R=8314.472 "Constant gasos ideals";   
parameter .Real cv=717 "Calor especific a volum constant";   
parameter .Real mu=1.33e-5 "Viscositat cinemàtica del gas internt (aire)";

Per acabar de identificar la resta de variables, no constants i que intervenen en l’estudi analitzem les diferents zones del sistema o volums de control.

![](images/8e9144d387e7b519b4786984f50b880aa5fb07f2d1f9dc1172d109f537ee7663.jpg)  
Il-lustració 33 Esquema de la zona calenta.

![](images/66e7b561f48e5d36dc472195451a069ed03cb022b0c4e04b29bb27b031118995.jpg)  
Il-lustració 34 Esquema de la zona lateral.

![](images/d664eb42b4a4ca6b0c6ebd66b012b9608f3a112062cf69915639ba3f96169a29.jpg)  
Il-lustració 35 Esquema de la zona freda.

.Real nt(start=nt\_o) "Nombre total de mols en el sistema";   
.Real V1 "Volum en el desplaçador";   
.Real V2 "Volum en el pistó de potència";   
.Real P1(start=Po) "Pressio en el desplaçador";   
.Real P2(start=Po) "Pressio en el pistó de potència";   
.Real n2(start=n2 o) "Nombre de mols en el pistó de potència";   
.Real n1(start=n1\_o) "Nombre de mols en el desplaçador";   
.Real n\_1(start=nt\_o-n1\_o-n2\_o) "Nombre de mols en el lateral";   
.Real m2 "Massa en el pistó de potència";   
.Real m\_1 "Massa en el lateral";   
.Real m1 " Massa en el desplaçador";   
.Real mt "Massa total del sistema";   
.Real T1(start=To) "Temperatura del gas (aire) en el desplaçador";   
.Real T2(start=To) "Temperatura del gas (aire) en el pistó de potència";   
.Real T 1(start=To) "Temperatura del gas (aire)en el lateral del sistema";   
.Real sp "Posició relativa del pistó de potència";   
.Real sd "Posició relativa del desplaçador";   
.Real ro1 "Densitat relativa del gas (aire) en la zona 1 o desplaçador";   
.Real ro2   
"Densitat relativa del gas (aire) en la zona 2 o pistó de potència";   
.Real A 1 "Area lateral disponible en el cilindre";   
.Real P\_1 "Pressio en el latreal del sistema";   
.Real c "Velocitat dels pistons";   
.Real mp2 "Massa que rep 1'intercanvi energètic en la zona 2";   
.Real mp1 "Massa querep 1'intercanvi energètic en la zona 1";   
.Real Rp "Constant gassos ideals (Unitats de massa)";   
.Real ro\_1 "Densitat relativa del gas (aire) en la zona lateral";

On en el conjunt del sistema tindrem un nombre de mols totals (nt) que dona una massa total (mt). Cal esmentar que les variables Rp i A\_l no caldrien que estiguessin definides aquí ja que són paràmetres constants en l’estudi del sistema i es podrien haver definit en l’apartat anterior.

A continuació descriurem les equacions que governen el sistema i l’evolució de les variables durant l’estudi o funcionament d’aquest.

**equation**

//Entrada de les posicions.

$$
{ \begin{array} { l } { \displaystyle { \mathfrak { s d } } = { \frac { 1 + \sin { \left( { \mathrm { u l } } \cdot { \mathrm { t i m e } } + { \frac { 3 . 1 5 1 4 } { 2 } } \right) } } { 1 0 } } } \\ { \displaystyle { \mathfrak { s p } } = { \frac { 1 + \sin { \left( { \mathrm { u l } } \cdot { \mathrm { t i m e } } \right) } } { 1 0 } } } \end{array} }
$$

//Volums disponibles en les diferentes zones en funció de la posició del pisto de la respectiva zona.

$$
\mathrm { W 1 } = \mathrm { V i n 1 } + \mathrm { A 1 } - \mathrm { s d }
$$

$$
\mathrm { V 2 } = \mathrm { V a } 2 + \mathrm { A } 2 \cdot \mathrm { s p } - \mathrm { A } 1 \cdot \mathrm { s d } + 2 l a \cdot \mathrm { A } 1
$$

//Càlcul de l'area lateral disponible.

$$
\sqrt { 2 } 1 = \pi \cdot [ - 1 ] { 1 } - 1 =
$$

//Canvi unitats de mols a massa de la constant dels gassos ideals.

$$
E _ { \mathrm { F } } = { \frac { R } { M } }
$$

//Càlcul de les densitats relatives en les diferentes zones del sistema.

$$
\bf { r o l } = \frac { P l } { R p \cdot T i }
$$

$$
\mathrm { f o z = \frac { P 2 } { R p \cdot I 2 } }
$$

$$
\mathrm { { f } } \bar { \mathbf { u } } _ { i } = \frac { P _ { i } } { \mathbb { R } \mathbf { p } \cdot \bar { T } _ { i } }
$$

/Equació dels gassos ideals aplicada a les dues zones.

$$
\mathbb { V } 1 - \mathbb { P } 1 = \pmb { \mathrm { n } } \mathbb { 1 } - \mathbb { P } - \mathbb { T } 1
$$

$$
\mathbb { V } _ { 2 } ^ { 2 } - \mathbb { P } _ { 2 } ^ { 2 } = { \bf { \sigma } } _ { 1 2 } - \mathbb { P } _ { 2 } ^ { * } - \mathbb { T } _ { 2 } ^ { 2 }
$$

//Càlcul de la pressio en la zona lateral.

$$
\begin{array} { r } { P _ { l } = { \frac { \mathbb { P } 1 + \mathbb { P } 2 } { 2 } } } \end{array}
$$

elèctrica basat en motor Stirling"

//Càlcul del les masses en les diferentes zones del sistema en funció dels mols respectius de cada zona.

$$
M \cdot \mathbf { n } 2 = \mathbf { m } 2
$$

$$
M \cdot \mathbf { n } 1 = \mathbf { m } 1
$$

$$
M \cdot n _ { i } = m _ { i }
$$

//Càlcul de la massa total del sistema.

Fins aquí, la deducció de les equacions no presenta complexitats però ara analitzem de manera més detallada l’equació de la continuïtat que descriurà el moviment de les masses en cada zona. Les equacions es descriuen per dos zones i Dymola anàlogament amb les equacions anteriors que relacionen totes les masses del sistema dedueix l’evolució de la restant. Les masses de les zones varien degut al moviment dels pistons que poden tenir dos moviments per cada zona, el de pujada (del Pmi a Pms) o el de baixada (viceversa) i que es donen de manera simultània o contraria a cada pistó ja que estan connectats pel cigonyal i desfasats 90º. El valor que determina si el sentit del moviment per cada pistó és de pujada o baixada és el valor de la velocitat (c). I aquestes masses es transfereixen de la zona 1 a la 2 passant per la zona lateral.

Demostració:

Eq. Continuitat;

$$
\frac { \mathrm { d } \mathrm { m } } { \mathrm { d t } } = m e - m s ;
$$

Caudal màssic:

$$
m = c ^ { * } A ^ { * } r o ;
$$

Si la c<0

Per la zona 1 tenim-> me=mq1 i ms=0;

$$
\frac { \mathrm { d } { \mathrm { m } } 1 } { \mathrm { d t } } = m e = m q 1 ;
$$

![](images/729571f78b7cc981b144feaac72f18358d3cced080506d9b55fec48baeeb1826.jpg)  
Il-lustració 36 Moviment de masses en zona calenta durant el descens.

El caudal màssic que entra (mq1) tal i com observem a la imatge prové del lateral per tant serà el resultat de:

$$
m q 1 = c ^ { * } A \_ a n ^ { * } r o \_ l ;
$$

Per la zona 2 tenim-> me=0 i ms=mq2;

![](images/e45351b232c6c88aa1bf3b2b5a49cce325de5250ba59922ef01b117f13bbd99c.jpg)  
Il-lustració 37 Moviment de masses en zona freda durant l’ascens.

El caudal màssic que surt (mq2) tal i com observem a la imatge prové de la mateixa zona 2 per tant serà el resultat de:

$$
m q 2 = c ^ { * } A \_ a n ^ { * } r o 2 ;
$$

"Sistema autònom de generació

elèctrica basat en motor Stirling"

Si la c>0

Per la zona 1 tenim $\scriptstyle \cdot > \ m e = 0 \ i \ m s = \ m q 1$

$$
\frac { \mathrm { d } { \mathrm { m } } { \mathrm { 1 } } } { \mathrm { d t } } = - m s = - m q { \mathrm { 1 } } ;
$$

Zona 1 (Desplaçador)  
![](images/ed16886ae853e22d81ec3bd762d2f3cec3b0bc09345783edd32cb1827ec7156b.jpg)  
Il-lustració 38 Moviment de masses en zona calenta durant l’ascens.

El caudal màssic que surt (mq1) tal i com observem a la imatge prové del la mateixa zona 1 per tant serà el resultat de:

$$
m q 1 = c ^ { * } A \_ a n ^ { * } r o 1 ;
$$

Per la zona 2 tenim $\scriptstyle \cdot > { \mathrm { ~ m e = m q } } 2 { \mathrm { ~ i ~ } } \ m s = 0$

$$
\frac { \mathrm { d } { \mathrm { m } } 2 } { \mathrm { d t } } { \mathrm { = } } m e = m q 2 ;
$$

![](images/cb0b550dad48b4aad04f7e863763f5903df8db433cdff970ee78dc38758267f5.jpg)  
Il-lustració 39 Moviment de masses en zona freda durant el descens.

El caudal màssic que entra (mq1) tal i com observem a la imatge prové del lateral per tant serà el resultat de:

$$
m q 2 = c ^ { * } A \_ a n ^ { * } r o \_ l ;
$$

Que en Dymola hem escrit com:

//Equació de la continuitat.   
//Describim els caudals massics en funció del moviment del sistema.   
if c<0 then   
mp1=c\*A\_an\*ro\_1;   
mp2=c\*A\_an\*ro2;   
else   
mp1=c\*A\_an\*ro1;   
mp2=c\*A\_an\*ro\_1;   
end if;

Un cop sabem com seran els caudals podem escriure l’evolució d’aquest respecte del temps com:

$$
\begin{array} { l } { { \exists \in \mathbb { r } \left( \mathrm { m } \mathbb { 1 } \right) = - \mathrm { m } \mathbb { E } ^ { 1 } \bar { r } } } \\ { { \mathrm { d } \in \mathbb { r } \left( \mathrm { m } \mathbb { 1 } \right) = \mathrm { m } \mathbb { E } \mathbb { 1 } - \mathrm { m } \mathbb { E } \bar { z } \bar { r } } } \end{array}
$$

Els signes estan ficats en funció de la velocitat. Comprovem que són correctes.

$$
\frac { \mathrm { d } { \mathrm { m } } { \mathrm { 1 } } } { \mathrm { d t } } { = } - m q { \mathrm { l } } ;
$$

{ Si c<0 (-) -> = + mq1 = La zona 1 s'està omplint.

{Si c>0 (+) -> = -mq1 = La zona 1 s'està buidant.

$$
\frac { \mathrm { d } { \mathrm { m } } \mathrm { ~ l } } { \mathrm { d t } } { = } m q 1 - m q 2 ;
$$

{ Si c<0 (-) -> = - mq1

{ Si c<0 (-) -> = + mq2 = La zona lateral s'està omplint de massa 2 i en marxa cap a la zona 1.

{Si c>0 (+) -> = +mq1

{ Si c>0 (+) -> = - mq2= La zona lateral s'està omplint de massa 1 i en marxa cap a la zona 2

Quan es vol estudiar la força que actua sobre un sistema es planteja l'equació de quantitat de moviment ja que les forces que actuen sobre un sistema provoquen canvis en la quantitat de moviment.

En aquesta equació tenim per una banda la suma de les forces externes que actuen sobre el fluid i per l'altra banda la variació de la quantitat de moviment

$$
\sum F = { \frac { d e r ( m c ) } { d t } } ;
$$

Les forces que actuen sobre el fluid lateral són:

\- Forces de pressió, tant a l'entrada com a la sortida. Es fa servir la pressió relativa, en el teu cas, com que les àrees d'entrada i sortida són iguals, el que interessa és tot just la diferència de pressions.

\- La força de fregament del fluid amb les parets deguda a la viscositat.

\- El pes del propi fluid, en aquest cas no es té en compte ja que els moviments son horitzontals i el pes afecta al moviment vertical.

Quedant les forces que actuen en el sistema relacionades de la següent manera:

$$
\sum F = - ( P 1 - P 2 ) ^ { * } A _ { - } a n - A _ { - } l ^ { * } \mu ^ { * } ( \frac { \frac { d e r ( s d ) } { d t } } { \frac { ( d c - d 1 ) } { 2 } } ) ;
$$

El terme de variació de quantitat de moviment es pot expressar com:

$$
\frac { d e r ( m c ) } { d t } = c \ast \frac { d e r ( m ) } { d t } + m \ast \frac { d e r ( c ) } { d t } ;
$$

També es podria aplicar el teorema del trasnport de Reynolds i quedaria:

$$
\frac { d \big ( m c \big ) } { d t } = \frac { \hat { o } } { \hat { o } t } \int _ { v } \rho c d V + \int _ { s } c \cdot c \rho d S
$$

$$
\frac { d \left( m c \right) } { d t } = \frac { \hat { \sigma } \left( m c \right) } { \hat { \sigma } t } + \dot { m } _ { s } c _ { s } - \dot { m } _ { e } c _ { e }
$$

$$
\frac { d ( m c ) } { d t } = \frac { \hat { o } ( m c ) } { \hat { o } t } + c _ { s } A _ { s } \rho _ { l a t } c _ { s } - c _ { e } A _ { e } \rho _ { 1 } c _ { e } \qquad 0 = \frac { \hat { o } m } { \hat { o } t } + \dot { m } _ { s } - \dot { m } _ { e }
$$

Prenent la primera expressió com a funció del temps però a la vegada de la posició, podem posar:

$$
{ \frac { { \hat { \sigma } } ( m c ) } { { \hat { \sigma } } t } } = c { \frac { { \hat { \sigma } } m } { { \hat { \sigma } } t } } + m { \frac { { \hat { \sigma } } c } { { \hat { \sigma } } t } }
$$

Es pot ficar l’expressió final

$$
\frac { d \big ( m c \big ) } { d t } = c \frac { \hat { \sigma } m } { \hat { \sigma } t } + m \frac { \hat { \sigma } c } { \hat { \sigma } t } + c _ { s } A _ { s } \rho _ { l a t } c _ { s } - c _ { e } A _ { e } \rho _ { 1 } c _ { e }
$$

Afegint les forces del sistema queda:

$$
\sum F = c \frac {  { \partial } m } {  { \partial } t } + m \frac {  { \partial } c } {  { \partial } t } + c _ { s } A _ { s } \rho _ { { l a t } } c _ { s } - c _ { e } A _ { e } \rho _ { 1 } c _ { e }
$$

En el programa no s'han modelat els dos últims dos termes de l’expressió per tal de simplificar-la.

$$
- ( P 1 - P 2 ) ^ { * } { \cal A } _ { - } a n - { \cal A } _ { - } l ^ { * } \mu ^ { * } ( \frac { \frac { d e r ( s d ) } { d t } } { \frac { ( d c - d 1 ) } { 2 } } ) = c ^ { * } \frac { d e r ( m ) } { d t } + m ^ { * } \frac { d e r ( c ) } { d t } ;
$$

elèctrica basat en motor Stirling"

Programat en Dymola com:

$$
/ / ( \mathbb { P } 1 . \mathbb { P } 2 ) ^ { * } \mathbb { A } \underset { = } { \Vec { \mathbf { a } } } \mathbb { n } \mathbb { - } \mathbb { A } \_ { - } \left| ^ { * } \mathbb { n } \mathrm { u } ^ { * } ( \mathrm { d e r } ( \{ \mathrm { s d } \} / ( ( \mathrm { d c - d l } ) / 2 ) ) ) = \mathbb { c } ^ { * } \mathrm { d e r } ( \{ \mathrm { n } \} \rvert ) + \mathrm { m } \_ { - } \left| ^ { * } \mathrm { d e r } ( \{ \mathrm { c } \} ; \mathrm { n } \right) \right| ^ { * } ,
$$

$$
\left| \mathbb { P } 1 - \mathbb { P } 2 \right| \mathcal { A } _ { \sf 3 / 1 } - \mathcal { A } _ { l } - \mu \left| \frac { \mathrm { ~ d ~ s d ~ } } { \mathrm { ~ d ~ } t } \right| = m _ { l } - \frac { \mathrm { ~ d ~ } c } { \mathrm { ~ d ~ } t }
$$

//Al no tenir escalfament les temperatures es mantenen constants.

$$
\frac { \mathrm { ~ d ~ T ~ 1 ~ } } { \mathrm { ~ d ~ } t } = 0
$$

$$
\frac { \mathrm { ~ d ~ T ~ Z ~ } } { \mathrm { ~ d ~ } t } = 0
$$

$$
\frac { \mathrm { d } T _ { l } } { \mathrm { d } t } = 0
$$

I la força que es realitza en el pistó de potència $\textsf { e s }$ la pressió d’aquesta zona menys la pressió atmosfèrica multiplicada per l’àrea en la que s’està aplicant.

$$
\begin{array} { r l } & { \mathrm { / / F o r g e ~ g u s e ~ \underline { { \Sigma } } e g e ~ \in \mathbb { Z } ^ \nu ~ \ p i . e t o ~ \underline { { \Sigma } } e g e ~ \underline { { \Sigma } } e g e t e ~ f i n c i . e . } } \\ & { \mathrm { ~ \underline { { \Sigma } } ~ = ~ \Gamma ( \mathbb { E } / \hat { z } - \mathbb { E } o ) \mapsto \hat { \underline { { \Sigma } } } e ~ \hat { z } ~ ; } } \end{array}
$$

Un cop tenim tot el ModelVolums definit passem a testejar-lo. Creem un nou model anomenat ModelVolums\_Test, on només cal afegir la constant que fa d’equivalent dels valors de les posicions relatives i el ModelVolums que acabem de modelar.

![](images/763f2e42d463a846889a93be1236e54b15a185a8cb469f3407bd9a199d522815.jpg)  
I-lustració 40 Àrea d’interacció del ModelVolums\_Test

Abans de simular, hem d’introduir els següents valors i activar les condicions inicials següents (P1, n1, n2, nt) com a fixes.

```matlab
model ModelVolums Test
Modelica.Blocks.Sources.Constant const(k=1)
a ;
ModelVolums
modelVolums (
d1= 0.15,
1_d=0.1,
d2= 0.12,
dc=0.18,
P1 (fixed=true),
n1 (fixed=true),
n2 (fixed=true),
nt (fixed=true))
a ;
equation
connect(const.y, modelVolums_Bo.u1) a;
connect(const.y, modelVolums_Bo.u) a;
a;
end ModelVolums_Test_Only;
```

**Il·lustració 41. Codi del ModelVolums\_Test amb paràmetres i condicions inicials.**

Amb el test podem comprovar gràficament com els volums estan variant en funció de les posicions, com les masses varien en funció d’aquests volums i que el model ens entrega una força resultant.

elèctrica basat en motor Stirling"  
![](images/ce6df2ad92c9924574796c7a4c48d1a9b8e0093754e7dc19cc533be6405e8509.jpg)

![](images/591182a5bd6b945d1ff53ea138d4cbbeb2ffaa861f3409c8e469078c272db036.jpg)  
Il-lustració 42 Variacions de volums en funció de les posicions.

![](images/0d242b12717a5733c0084b4f4189a8e2c61249838d530c75958bebfe5de405aa.jpg)

![](images/96a8223409049190dcb76c739bdc0e084c73fe4b2aa24716e58062ffaa908e11.jpg)  
Il-lustració 43 Variacions de les masses en funció dels volums disponibles.

![](images/072c4d43da2283838f142d5ddb2cfec8c9fac5515027dd75f305cdafa2e8a386.jpg)  
Il-lustració 44 Força exercida sobre el pistó de potència.

**• Segona part, escalfament:**

Ara afegim al ModelVolums, l’escalfament i refredament del sistema. Tornem a analitzar el sistema afegint aquests nous processos per veure quins nous paràmetres i variables tenim.

![](images/b1013ef502812d4784e055a0b07815d16547cb67b2058c8304f60973715615d1.jpg)  
Il-lustració 45 Escalfament i refredament que participen en el sistema.

Observant la figura, podem veure que tenim dos nous paràmetres i nou noves variables que afegirem al ModelVolums, però en un nou model, que anomenem ModelTermodinamic.

Les programem de la següent manera:

parameter .Real Uc   
"Coeficient global de transferencia (zona calenta o zona 1)";   
parameter .Real Uf "Coeficient global de tranferencia (zona freda o zona 2)";   
.Real Ac "Area transferencia de calor en el desplaçador";   
.Real Af "Area tranferencia de calor en el pistó de potència";   
.Real Qc( start=n1 o\*M\*cv\*To)   
"Calor intercanviada en el desplaçador (escalfament)";   
.Real Qf( start=n2 o\*M\*cv\*To)   
"Calor intercanviada en el pistó de potència (refredament)";   
.Real Q 1( start=(nt o-n1 o-n2 o)\*M\*cv\*To)   
"Calor intercanviada en el lateral";   
.Real Qpc "Calor amb la que s'escalfa la paret de la zona 1";   
.Real Qpf "Calor amb la que es refreda la paret de la zona 2";

Cal esmentar que Ac i Af també podrien haver-se definit com a paràmetres ja que són constants. Els calors en cada zona necessiten condicions inicials ja que aquests es troben a una temperatura inicial i tenen unes masses inicials. Per últim veiem que aquí tenim nou de les onzè noves variables, falten les temperatures d’escalfament i refredament, aquestes es modelen com entrades al nou ModelTermodinàmic per tal de poder-les ajustar posteriorment al tipus d’escalfament i refredament que tinguem en el sistema.

Al tenir dues noves entrades també haurem de substituir el ModelConnectors\_Posicions\_Forces per un nou model que incorpori aquestes entrades i que anomenarem ModelConnectors\_Posicions\_Temperatures\_Forces.

partial model ModelConnectors\_Posicions\_Temperatures\_Forces   
Modelica.Blocks.Interfaces.RealInput u   
"Posició del pisto de potència en el cilindre"   
a;   
Modelica.Blocks.Interfaces.RealInput u1   
"Posició del deplaçador en el cilindre"   
a ;   
Modelica.Blocks.Interfaces.RealOutput fo   
"Força entregada per el gas al pisto de potència"   
Modelica.Blocks.Interfaces.RealInput u2   
"Temperatura d'escalfament del desplaçador"   
Modelica.Blocks.Interfaces.RealInput u3   
"Temperatura de refredament del pistó de potència"   
a ;   
Modelica.SIunits.Force f "La unitat de la força entregada (Newtons)";   
equation   
fo = f;   
a ;   
end ModelConnectors\_Posicions\_Temperatures\_Forces;

Il-lustració 46 Codi del ModelConnectors\_Posicions\_Temperatures\_Forces.

Un cop tenim les noves variables i entrades definides, passem a escriure les equacions que descriuran l’escalfament i refredament del sistema així com l’evolució dels intercanvis energètics en cada zona. Respecte de les equacions del ModelVolums cal eliminar que les derivades de les temperatures són igual a zero i introduir les següents.

Partint de:

Transferència de calor (paret):

$$
Q = U ^ { * } A ^ { * } \Delta T ;
$$

Transferència de calor (massa):

$$
Q = m ^ { * } c \nu ^ { * } T ;
$$

Per a la zona 1 tenim:

```javascript
//Transferència de calor entre 1'entorn exeterior i 1'interior de la zona 1.
Opc = Uc*Ac* (Tc-T1) ;
Ac = A1;
//Calor absorvit per la massa en la zona 1.
Qc = m1*cv*T1;
```

Per la zona 2 tenim:

```javascript
//Transferència de calor entre 1'entorn exeterior i 1'interior de la zona 2.
Qpf = - Uf*Af*(T2-Tf); //Signe negatiu ja que la calor surt del sistema.
Af = A2;
//Calor absorvit per la massa en la zona 2.
Qf = m2*cv*T2;
```

Per la zona lateral tenim:

```javascript
//Calor absorvit per la massa lateral.
Q_1 = m_1*cv*T_1;
```

On l’evolució del calor de cada zona depèn del calor que està entrant o sortint per la paret i de les masses que hi circulen (on ja sabem que aquestes varien segons el moviment dels pistons). Veiem com és aquesta evolució del calor en les respectives zones del sistema.

elèctrica basat en motor Stirling"

Partint de:

$$
\frac { \mathrm { d } \mathrm { Q } } { \mathrm { d t } } { = } Q e - \mathcal { Q } s ;
$$

Per la zona 1:

$$
\mathsf { S i } \mathsf { c } < 0 \mathsf { t e n i m } \to \mathsf { Q e } \mathsf { = } \mathsf { Q p c } + \mathsf { m q 1 } ^ { \ast } \mathsf { c v } ^ { \ast } \mathsf { T \_ l } \mid \mathsf { i } \mathrm { \ Q s } = 0
$$

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e ;
$$

![](images/b9a176345dd434ca432692d664eff49caf398e402d6b05af0f89cbc471e228c2.jpg)  
Il-lustració 47 Variació del calor en la zona 1 durant el descens del desplaçador.

On tenint en compte el signe de la velocitat i sabent que mq1 prové de la zona lateral, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e = Q p c - m p { \ a } ^ { * } c \nu ^ { * } T \_ l ;
$$

Si $\mathtt { C } { > } 0$ tenim $\scriptstyle - > \mathrm { Q e } = \mathrm { Q p c ~ i } \mathrm { Q } s = \mathsf { m q 1 } ^ { * } \mathrm { c v } ^ { * } \mathsf { T 1 }$

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e - Q s ;
$$

![](images/d1ad2825f13304253e2c23c38b3e6c0f0b29df1e4fb01e3d198944a81275b7ff.jpg)  
Il-lustració 48 Variació del calor en la zona 1 durant el ascens del desplaçador.

On tenint en compte el signe de la velocitat i sabent que mq1 prové de la zona 1, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e - Q s = Q p c - m q 1 ^ { \ast } c \nu ^ { \ast } T 1 ;
$$

Tot això es programa en Dymola de la següent manera:

//Variació del calor en la zona 1 en funció del moviment del sistema.   
if c<0 then   
der(Qc)=Qpc-mp1\*cv\*T\_1;   
else   
der(Qc)=Qpc-mp1\*cv\*T1;   
end if;

Per la zona 2:

$$
\mathsf { S i } \mathsf { c } < 0 \mathsf { t e n i m } \to \mathsf { Q e } = 0 \mathsf { i } \mathsf { Q } \mathsf { s } = \mathsf { Q p f } + \mathsf { m q } 2 ^ { * } \mathsf { c v } ^ { * } \mathsf { T } _ { - } \mathsf { I }
$$

$$
\frac { \mathrm { d Q f } } { \mathrm { d t } } = - Q s ;
$$

"Sistema autònom de generació

elèctrica basat en motor Stirling"

![](images/39feaf598b478195ce9a30fe527b3000028c4baf69ef912e167021d7edb8dceb.jpg)  
Il-lustració 49 Variació del calor en la zona 2 durant el ascens del pistó.

On tenint en compte el signe de la velocitat, el signe de la transferència de calor per la paret i sabent que mq2 prové de la zona $2 .$ ,finalment ens queda:

$$
\frac { \mathrm { d Q f } } { \mathrm { d t } } = - Q s = Q p f + m q 2 ^ { * } c \nu ^ { * } T 2 ;
$$

Si c>0 tenim $\ b { \Sigma } > \mathrm { Q e } = \boldsymbol { \Pi } \ b { \mathrm { q } } \ b { 2 } ^ { * } \ b { \mathrm { C V } } ^ { * } \ b { \mathrm { T } } \_ { \mathrm { l } } \mathrm { ~ i ~ } \ b { \mathrm { Q } } \ b { \mathrm { s } } = \ b { \mathrm { Q p f } }$

$$
\frac { \mathrm { d } { \mathrm { Q f } } } { \mathrm { d t } } = Q e - Q s ;
$$

![](images/e8146218a9edf95df6711264ca9ab048f4927d69dd39741e33cb1f98df5cb95f.jpg)  
Il-lustració 50 Variació del calor en la zona 2 durant el descens del pistó.

On tenint en compte el signe de la velocitat, el signe de la transferència de calor per la paret i sabent que mq2 prové de la zona lateral, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q f } } { \mathrm { d t } } { = } Q e - Q s = Q p f + m q 2 ^ { * } c \nu ^ { * } T \_ l ;
$$

Quedant programat en Dymola:

```c
//Variació del calor en la zona 2 en funció del moviment del sistema.
if c<0 then
der(Qf)=Qpf+mp2*cv*T2;
else
der(Qf)=Qpf+mp2*cv*T_1;
end if;
```

Per la zona lateral:

$$
\mathrm { S i ~ c < 0 ~ t e n i m ~  ~ Q e = m q 2 ^ { * } c v ^ { * } T 2 ~ i ~ Q s = \ m q 1 ^ { * } c v ^ { * } T \_ l }
$$

$$
\frac { \mathrm { d } \mathrm { Q } \mathrm { ~ l ~ } } { \mathrm { d t } } = { Q } e - { Q } s ;
$$

![](images/84351291793d53cc85e8bf3e5f56295c0591c566fd91d57a059a76fdf7a1335e.jpg)  
Il-lustració 51 Variació del calor en la zona lateral durant el descens del desplaçador.

On tenint en compte el signe negatiu de la velocitat ens queda:

$$
\frac { \mathrm { d } \mathrm { Q } \_ { } } { \mathrm { d t } } = Q e - Q s = - m q 2 ^ { * } c { \nu } ^ { * } T 2 + m q 1 ^ { * } c { \nu } ^ { * } T \_ l ;
$$

![](images/3d5123da5d6e08acc0aabf898f371e4250b1b037e779399b7f3ef8e614d1563e.jpg)  
Il-lustració 52 Variació del calor en la zona lateral durant el ascens del desplaçador.

Considerant novament el conveni de signes elegit tenim que:

$$
\frac { \mathrm { d } \mathrm { Q } \_ } { \mathrm { d t } } = Q e - Q s = - m q 2 ^ { * } c \nu ^ { * } T \_ l + m q 1 ^ { * } c \nu ^ { * } T 1 ;
$$

Resultant la programació en Dymola:

//Variació del calor en la zona lateral en funció del moviment del sistema   
if c<0 then   
der(0 1)=-mp2\*cv\*T2+mp1\*cv\*T 1;   
else   
der(Q\_1)=-mp2\*cv\*T\_1+mp1\*cv\*T1;   
end if;

Ara que ja tenim tot el model termodinàmic definit, podem comprovar que tenim intercanvis energètics en les diferents zones del sistema. Per això cal crear un nou model, que anomenem ModelTermodinamic\_Test, i afegir, a part del propi ModelTermodinamic que volem testejar, els models que faran d’equivalent al sistema de escalfament i de refredament que ens donaran les temperatures d’escalfament i de refredament respectivament.

El model que ens dona la temperatura calenta és una rampa (Modelica->Blocks->Sources->Ramp), que començarà a temperatura ambient (offset=293.73) i que augmentarà doscents graus respecta d’aquesta en deu segons (height=200; duration=10). La temperatura de refredament l’equivaldrem a una constant que sempre ens donarà la temperatura ambient.

![](images/067a3d50ebfeaa9e5fcea1524a0499e0d9b0403bb0913b1a82632bbb4b46818f.jpg)  
Il-lustració 53 Àrea d’interacció del ModelTermodinamic\_Test.

Abans de simular cal ajustar els següents valors i condicions inicials.

```matlab
model ModelTermodinamic_Test
Modelica.Blocks.Sources.Ramp TC( duration=10,
offset=293.73,
height=200)
a ;
Modelica.Blocks.Sources.Constant TF(k=293.73)
a;
Modelica.Blocks.Sources.Constant const(k=1)
a ;
ModelTermodinamic_ Only modelTermodinamic_Only(
d1=0.15,
1_d=0.1,
d2=0.12,
dc=0.18,
P1 (fixed=true),
nt(fixed=true),
n1(fixed=true),
n2 (fixed=true),
Uc=10,
Uf=100)
a ;
equation
a ;
end ModelTermodinamic
```

Il-lustració 54 Codi del ModelTermodinamic\_Test amb paràmetres i condicions inicials. Podem observar gràficament com les temperatures i calors de les zones del sistema van variant en funció del moviment de les masses d’una zona a l’altre durant la simulació del sistema.

![](images/c29272f13986e70fdb6b4d9bd6cea719db2d44a63d9bbdd309c2e8ddf92a9e0d.jpg)  
Il-lustració 55 Variacions de calors en el sistema.

Albert Garcia Prat  
![](images/530f45ca88f6657bb32366fff85a796d5552aa18b71825091673a7c2aa2a922a.jpg)  
Il-lustració 56 Variacions de calors en les parets del sistema.

![](images/cf50a28a39241e3448c091ad677987c7c5dd161e5f21a6990ee33f80fc908a81.jpg)  
Il-lustració 57 Variacions de les temperatures del sistema.

Ara que ja tenim els dos grans models que intervenen en el nostre sistema els podem acoblar per tal de veure com funciona el sistema complet o motor Stirling i podríem passar a dimensionar els principals paràmetres per dissenyar el motor que ens entregués la potència mecànica i posterior potència elèctrica desitjada.

Per acoblar els dos motors creem el un nou model, que es dirà Motor\_Stirling, on copiarem el ModelMecanic que havíem fet i farem un parell de modificacions:

• Primera modificació: Eliminar la funció sinusoïdal i en el seu lloc connectar el ModelTermodinamic.

• Segona modificació: Col·locar un sensor de posició (Modelica->Mechanics->Translational->Sensors->PositionSensor) a cada cilindre que ens donarà la "s" o posició relativa del pistó de potència o desplaçador envers el seu cilindre respectiu. Aquest sensors es connecten des d’el connector del cilindre a l’entrada corresponent del ModelTermodinamic (La posició del pistó de potència a l’entrada "u" m'entres que la posició del desplaçador va a l’entrada "u1").

![](images/b19d991a50f774e2fddcf33a06676d9cc4f072cbe1ac5c11723ebecacccff835.jpg)  
Il-lustració 58 Àrea d’interacció del Motor\_Stirling creat.

Un cop tenim el Motor\_Stirling definitiu modelat podem crear el model per testejar-lo on apart d’incluir els mateixos recursos que ja hem esmentat per el model mecànic (món,rodament i volant d’inercia) nem d’afegir alguns més per ajudar al motor a arrancar incialment. Veiem quins components més cal afegir i com s'han de connectar aquests.

Aquest sistema d’arrancada esta format per una acceleració (Modelica->Mechanics->Rotational->Sources->Accelerate) que se li entrega a un embrague i que s’activara a través d’una rampa (Modelica->Blocks->Sources->Ramp) aquesta rampa s’activa al cap de trenta segons despres d'haver començat la simulació, per tal de que el sistema s'hagi escalfat bé, i té una durada de deu segons. L'embrague (Modelica->Mechanics->Rotational->Components->Clutch) esta embragat des de el principi de la simulació al cigonyal i s’encarregarà de transmetre l’acceleració durant els deu segons que aquesta dura i desprès es desembraga del cigonyal per l’acció d’un escalor unitari (Modelica->Blocks->Sources->Step) que el fara passar de un estat d’activat a un de desactiva (d’un offset de valor 1 a una alçada de valor -1 respecte l’offset que és igual a zero al cap de quarante segons).

Per poder mesurar la potència que aquest motor ens està entregant afegirem al test un sensor de potència (Modelica->Mechanics->Rotationa->Sensors->PowerSensor) que mesurara la potència resultant entre l’entregada al cigonyal i un fregament (Modelica->Mechanics->Rotational->Components->Damper) que l'imposssem a aquest. La posició d’aquest fregament és fixa (Modelica->Mechanics->Rotational->Components-Fixed). Per obtenir una bona potència s’estipula que el fregament a de tenir un valor aproximat d’un seixanta per cent respecte de la velocitat màxima del cigonyal.

![](images/fd0684db8f716de25237ce6e7122b1217a0b8e7d0f05a6c92621c30b00dc7a2c.jpg)  
Il-lustració 59 Exemple dels components per el test del Motor\_Stirling.

### 3.4.3. Incorporació d’un regenerador al Model Termodinàmic.

El regenerador és un component molt important per als cicles termodinàmics ja que s’encarrega d’absorbir i entregar calors al fluid compensant una part de les calors perdudes en el motor. Aquesta compensació fa que el fluid tingui que absorbir menys calor en cada cicle provocant que el temps de realització dels cicles s’escurcin i que la potència i la velocitat del motor augmentin.

Per tal de treure-li al regenerador el màxim partit cal que tinguem presents dues característiques d’aquest molt importants en el seu funcionament.

La primera és la capacitat d’emmagatzemar energia tèrmica on aquesta capacitat volumètricament és mesura com el producte de la densitat del fluid per la calor especifica a pressió constant (pxCp) on a major valor d’aquesta capacitat, major calor absorbeix el regenerador.

![](images/611f50219d186c95fe7c746b405ccd67b02ef0bc06a79d300a4e67f923877672.jpg)  
Il-lustració 60 Capacitat tèrmica volumètrica per a diferents materials.

La segona és la difusió tèrmica, que mesura la capacitat d’un material per conduir energia tèrmica en relació amb la seva capacitat d’emmagatzemar energia. Per al bon rendiment del regenerador busquem que aquest paràmetre sigui petit. 12F-04

![](images/dd5fd039190bf5ff3bfa190685de2e2507a96a336fefd005a63e75404d54ce2e.jpg)  
Il-lustració 61 Difusivitat tèrmica volumètrica per a diferents materials.

A continuació descriurem el seu funcionament i la corresponent programació.

Considerant el regenerador com un nou sistema situat en el lateral del desplaçador.

![](images/edcb574bc5532743073165862198c1b9afe2acf153c18479d20eca6f39d4e801.jpg)

Il-lustració 62 Incorporació del regenerador al sistema.

Observem que tenim noves variables que incloure al model termodinàmic.

parameter .Real m\_reg = 0.001 "Massa del regenerador";   
parameter .Real cp\_reg = 890 "Calor especific regenerador";   
parameter .Real U\_reg= 150 "Coeficient de dimensionament   
del regenerador (L-A-K) ";   
.Real T\_reg(start=To) "Temperatura del regenerador";   
.Real Q\_reg( start=m\_reg\*cp\_reg\*To) "Calor acomulada en el regenerador";   
.Real Qp\_reg "Calor en el regenerador";

Partint de:

Transferència de calor (paret):

$$
Q = U ^ { * } A ^ { * } \Delta T ;
$$

Transferència de calor (massa):

$$
Q = m ^ { * } c \nu ^ { * } T ;
$$

//Transferència de calor entre el regenerador i la paret del desplaçador.   
Qp\_reg= U\_reg\*(T\_reg-T\_1);

//Calor absorvit per el regenerador.   
Q\_reg = m\_reg\*cp\_reg\*(T\_reg) ;

On la calor del regenerador nomes varia per la transferència de calor de la paret.

//Variació del calor en el regenerador.   
der(Q\_reg)=-Qp\_reg;

El signe bé en funció de si la T\_I és mes gran que la del regenerador o no. El comprovem:

{ Si T\_I<T\_reg (+) -> = +Qp\_reg = Aquest entrega calor a la zona lateral. I per tant perd calor. La derivada queda negativa.

{Si T\_I>T\_reg (-) -> = -Qp\_reg = Aquest absorbeix calor de la zona lateral. I per tant la derivada queda positiva.

Analitzant la transferència de calor en el lateral amb la influencia del regenerador.

$$
\frac { \mathrm { d } \mathrm { Q } \mathrm { ~ l ~ } } { \mathrm { d t } } = { Q } e - { Q } s ;
$$

$$
\mathrm { S i ~ c < 0 ~ t e n i m ~  ~ Q e = m q ^ { 2 * } c v ^ { * } T 2 ~ + ~ Q p \_ r e g ~ i ~ Q s = m q 1 ^ { * } c v ^ { * } T \_ l ~ }
$$

![](images/efad63c62ddd26fcda8d466b560c89ed276a680a0d32fd20e4f13b43ba3ae3d1.jpg)  
Il-lustració 63 Variació del calor en la zona lateral, durant el descens del desplaçador, amb regeneració.

On tenint en compte el signe negatiu de la velocitat i que la T\_l prové de la zona de refredament i es trobarà a una temperatura inferior a la del regenerador.

$$
\frac { \mathrm { d } \mathrm { Q } _ { \_ } } { \mathrm { d t } } = Q e - Q s = - m q 2 ^ { * } c \nu ^ { * } T 2 + m q 1 ^ { * } c \nu ^ { * } T \_ l + Q p \_ r e g ;
$$

$$
\mathrm { S i ~ c < 0 ~ t e n i m ~ - > ~ Q e = \ m q 1 ^ { * } c v ^ { * } T 1 ~ i ~ Q s = \ m q 2 ^ { * } c v ^ { * } T \_ l + \ Q p \_ r e g }
$$

![](images/5bae96bb6372c68bccb9833724b454847e5ff4a82d813acfb3766bfaae27e81c.jpg)  
Il-lustració 64 Variació del calor en la zona lateral, durant el descens del desplaçador, amb regeneració.

Considerant novament el signe negatiu de la velocitat i que la T\_I prové de la zona d’escalfament i es trobarà a una temperatura superior a la del regenerador.

$$
\frac { \mathrm { d } \mathrm { Q } _ { \_ } } { \mathrm { d t } } = Q e - Q s = - m q 2 ^ { * } c \nu ^ { * } T _ { \_ } l + m q 1 ^ { * } c \nu ^ { * } T 1 + Q p _ { \_ } r e g ;
$$

Quedant programat en Dymola com:

//Variació del calor en la zona lateral en funció del moviment del sistema.   
//Sistema dotat amb regenerador.   
if c<0 then   
der(Q\_1)=-mp2\*cv\*T2+mp1\*cv\*T\_1+Qp\_reg;   
else   
der(Q\_1)=-mp2\*cv\*T\_1+mp1\*cv\*T1+Qp\_reg;   
end if;

Observem l’influencia del regenerador sobre certs paràmetres importants del cicle comparant-los amb els valors del motor Stirling sense regenerador.  
![](images/bc89feb14d9259d89a7ed50d1e9d214abbecd26a0d91b8694c4cf99edbdc4839.jpg)

![](images/761b95218f57cca72e96df9f0f3cd717be07bd3f1d72ecb0e6c3ff954665ecb7.jpg)  
Il-lustració 65 Forces sobre els pistons de potència dels respectius sistemes.

![](images/e18bf7e42093d04c4c0e835d917e95a67e8fae2acd9eee34cd2b42f343c4831d.jpg)

![](images/b65690c4bdd0008bda6f3cfc533adb6f44e605efd7bb485fff752f0cfa65313f.jpg)  
Il-lustració 66 Variació del calor en el lateral dels respectius motors analitzats.

![](images/5a4bd6193155b46b5c24d67eed00926fada0e075678304e0fac51590cc8c6f9f.jpg)

![](images/034e6ca4f480bb4ad024f9abab5b9a5abdf222fb62be170c6f468afafeac7d6f.jpg)  
Il-lustració 67 Variació de les temperatures en les diferents zones dels motors estudiats.

# CAPÍTOL 4: PRINCIPALS PARÀMETRES DE DISSENY

Els principals paràmetres de disseny d’un motor Stirling són quatre: la relació de temperatures entre la zona calenta i la freda, la relació de volums entre aquestes zones, l’angle de desfasament del mecanisme i la relació de volum mort dins del motor.

L'angle del desfasament en el nostre cas només pot ser 90º degut a la configuració del motor elegida.

$$
t a u = \frac { \mathrm { T f } } { \mathrm { T c } } ; \qquad K p = \frac { \mathrm { V P } } { \mathrm { V D } } ; \qquad &  a l p = 9 0 ^ { \circ } ; \qquad K s = \frac { \mathrm { V S m i } } { \mathrm { V D } } ;
$$

On:

Tf = Temperatura de la zona freda (ºK).

Tc = Temperatura zona calenta (ºK).

VP = Volum pistó de potència (m^3).

alp = Desfasament entre pistons (º).

VSmi = Volum mort zona i (m^3).

VD = Volum desplaçador (m^3).

Els valors òptims d’aquests paràmetres varien segons el disseny del motor elegit en cada cas per el que no existeix una combinació ideal d’aquest. Lo que si ens permetran és obtenir uns valors orientatius, sobre els que haurien de basar els valors del disseny del nostre motor, segons els valors de potència que volem obtenir i les temperatures que tinguem en el sistema. Amb l’ajuda de les gràfiques següents, que relacionen l’influencia entre paràmetres, podem orientant-se sobre els valors que aquests poden oscil·lar.

![](images/5183c436f06cd101d561e1f0916702623f23db13cd848cfaf2dc7a8b151641de.jpg)  
Il-lustració 68 Efecte de tau sobre la potència (amb $K p = 0 . 8 ,$ X=1 i $a / p = 9 0 )$

![](images/4fca00f387b524f5f1df3df149f33a6514665c76b4948f59057a8a360e88473a.jpg)  
Il-lustració 69 Efecte de Kp sobre la potència (amb $t a u { = } O . 2 5 ,$ X=1 i alp=90).

elèctrica basat en motor Stirling"

![](images/d892608440fde77434748943f546e288bdd616e0d4acaff57a587adf1effe5c2.jpg)  
Il-lustració 70 Efecte de X sobre la potència (amb Kp=0.8, tau=0.25 i alp=90).

![](images/4ad188bef64f8ad36a4fcf6a8b2651ce3f6d70b67193325f1978ae82a3a41822.jpg)  
Il-lustració 71 Efecte de alp sobre la potència (amb $K p = 0 . 8 ,$ X=1 i tau=0.25).

Per poder realitzar l’estudi d’aquests valors d’una manera més eficient, s'ha programat un petit codi en MATLAB on seguint la teoria d' Schmidt ,que va relacionar els anteriors paràmetres en una equació, calcularem la potència neta entregada per cicle a l’eix. Posteriorment amb aquests paràmetres de disseny i sabent les relacions geomètriques del sistema (quins volum màxim i mínim tenim segons la configuració elegida) podrem trobar els calors extrets i absorbits en el sistema.

Equacions de la teoria d'Schmidt:

$$
P S c h m i d t = \pi ^ { * } ( 1 - t a u ) ^ { * } p \operatorname* { m a x } ^ { * } V D ^ { * } { \frac { \mathrm { K p } ^ { * } \mathrm { s e n } ( \mathrm { a l p } ) } { \mathrm { Y } + { \sqrt { \mathrm { Y } ^ { 2 } - X ^ { 2 } } } } } * { \sqrt { \frac { Y - X } { Y + X } } } ;
$$

$$
X = \sqrt { ( 1 - t a u ) ^ { 2 } - 2 ^ { * } ( 1 - t a u ) ^ { * } K p ^ { * } \cos ( a l p ) + K p ^ { 2 } } ;
$$

$$
Y = 1 + t a u + \frac { 4 ^ { * } K s ^ { * } t a u } { 1 + t a u } + K p ;
$$

$$
p \operatorname* { m a x } = p m ^ { * } { \sqrt { \frac { Y + X } { Y - X } } } ;
$$

$$
P i = F ^ { * } P s c h m i d t \ ^ { * } f ;
$$

On:

PSchmidt = Parell per cicle $( \mathsf { N } ^ { * } \mathsf { m } )$

Pmax = Pressió màxima que s’assoleix durant el cicle (N/m^2).

Pm = Pressió mitja durant el cicle.

F = Paràmetre de correcció del Disseny (adimensional) (0.1 = mal disseny;   
0.8=disseny excel·lent).

f = Freqüència (Hz).

Sabent que segons la configuració elegida (90ª) el volum màxim i mínim que tindrem en el cicle es pot aproximar com:

$$
V m a = V D + ( 0 . 5 ^ { * } V P ) ;
$$

$$
V m i = 0 . 5 ^ { * } V P ;
$$

Un cop coneixem els volums juntament amb les temperatures de treball elegides trobem les calors absorbides i extretes en el cicle (per unitat de massa) i el rendiment d’aquest.

$$
Q a b s = x ^ { * } C \nu ^ { * } ( T h - T l ) + R ^ { * } T h ^ { * } \log ( V \operatorname* { m a x } / V \operatorname* { m i n } ) ;
$$

$$
Q e x t r = x ^ { * } C \nu ^ { * } ( T l - T h ) + R ^ { * } T l ^ { * } \log ( V \operatorname* { m i n } / V \operatorname* { m a x } ) ;
$$

$$
\eta = \frac { ( T h - T l ) ^ { * } R ^ { * } \log ( V \operatorname* { m a x } / V \operatorname* { m i n } ) } { Q a b s } ;
$$

Finalment la potència real serà:

$$
\mathrm { P r } e a l = P i ^ { * } \eta ;
$$

Veiem com queda la seva programació en MATLAB:

```matlab
sDefinim la funció on primer trobem els valors que volem que aquesta funció
%ens retorni i despres el nom de la funció.
function [Qabs, Qext, Ks, rnd, Preal, DP, DD, VSmi, VD, VP, LD, LP, Vma, Vmi]= PreStirling
%Paràmetres d'entrada amb lesseves respectives unitats unitats.
disp ('VP (m^3), f (Hz), Th (°K), T1 (°K), Pmit (PA) ') ;
VP=input('introdueix el valor del volum del pistó de potència VP= ');
f=input('introdueix el valor de la freqüència f=');
Th=input('introdueix el valor de la temperatura escalfament Th=');
Tl=input('introdueix el valor de la temperatura de refredament Tl=');
Pmit=input('introdueix el valor de la pressió mitja durant el cicle Pmit=')
Kp=input('introdueix el valor de la relació de compressió (VD/VP) Kp=');
F=input('introdueix el valor del factor de correcció del disseny F=');
%Definim les constants del gas que intervenen en el càlcul.
R2 = 287; %Constant gasos ideals (especific per 1'aire).
Cv = 717; %Calor especific a volum constant de 1'aire
sDefinim les constants geometriques que participen en el càlcul.
alp = 90; %Fixe per configuració.
emi = 0.01; sSuposem que el espessor del volum mort és de 1cm.
%Si incoporem un regenerador al càlcul 1'eficiència d'aquest es recull en
%el paràmetre x (si la regeneració es perfecte x=0 si no tenim regeneració
%x=1) .
x=1;
%A partir de el volum que volem que tingui el pistó de potència i de la
%relació de compressió elegida (observant la gràfica podem trobar quin
%valor de Kp ens dona millor rendiment)comença a calcular les demes
%geometries del motor
VD = VP*Kp;
%De VP = AP* LP i sabent que per un rendiment màxim la LP=2DP ->
%VP= (pi*DP^2/4) *2DP trèiem que -> DP=3√(2VP/pi) amb MATLAB donem a x1
%el valor de dintre de l’arrel 3 i despres utilitzem el comando
%nthroot(x,n) per fer l’arrel tercera n=3 del valor x=x1. Fent el mateix
%anàlisis trobem el DD i LD.
x1 = (VP*2)/pi;
x2 = (VD*2)/pi;
DP = nthroot (x1,3);
DD = nthroot (x2,3);
LP = 2*DP;
```

```matlab
LD = 2*DD;
AD = pi* (DD^2)/4;
AP = pi* (DP^2)/4;
VSmi = AD*emin;
tau = T1/Th;
Ks = VSmi/VD;
sApliquem les equacions de Schmitd (S'han calculat les
%equacions a trams per simplificar la seva codificació)
Y = 1+Kt+(4*Ks*Kt/(1+tau))+Kp;
iii = (1-Kt) ^2-2* (1−tau) *Kp*cos (alp) +Kp^2;
X = sqrt(iii);
i = (Y+X) / (Y–X) ;
Pmax2 = Pmit*sqrt (i) ;
ii = (Y−X) / (Y+X) ;
ix = Y^2-X^2;
PSchmit = pi* (1-tau) *Pmax2*VD* (Kp*sin (alp)/ (Y+sqrt (ix))) *sqrt (ii) ;
%La potència resultant entregada al eix és:
Pi = PSchmit *F*f;
%Un cop tenim els volums del sistema i segons les temperatures de treball
%elegides podem calcular la calor absorbida i extreta en el cicle (per unitat de massa).
Qabs = x*Cv* (Th-T1) +R2*Th*1og (Vma/Vmi);
Qext = x*Cv* (T1−Th) +R2*T1*1og (Vmi/Vma) ;
rnd = ((Th−T1) *R2*1og (Vma/Vmi))/ (x*Cv* (Th−T1) +R2*Th*1og (Vma/Vmi)) ;
```

Observem com seria una execució del codi per realitzar el preestudi del disseny del motor.

Command Window   
①New to MATLAB? Watch this Video, see Demos, or read Getting Started.   
>> [Qabs, Qext, Ks, rnd, Preal, DP, DD, VSmi, VD, VP, LD, LP, Vma, Vmi] = PreStirling   
VP(m^3),f(Hz),Th(°K),Tl(°K),Pmit(PA)   
introdueix el valor del volum del pistó de potència Vp= 0.003   
introdueix el valor de la fregüència f=1   
introdueix el valor de la temperatura escalfament Th=520   
introdueix el valor de la temperatura de refredament Tl=293.73   
introdueix el valor de la pressió mitja durant el cicle Pmit=1e+05   
introdueix el valor de la relació de compressió (VD/VP) Kp=1.3   
introdueix el valor del factor de correcció del disseny F=0.35  
Il-lustració 72 Finestra de comandes de Matlab.

En primer lloc es fa la crida de la funció i desprès anem introduint els valors que ens demana.

elèctrica basat en motor Stirling"

Obtenim els següents resultats.

<table><tr><td>Workspace</td><td>+1 □ 7 X</td></tr><tr><td>陶 韻 田</td><td>M Select</td></tr><tr><td>Name</td><td>Value</td></tr><tr><td>DD DP</td><td>0.1354 0.1241</td></tr><tr><td>Ks</td><td>0.0369</td></tr><tr><td>LD</td><td>0.2708</td></tr><tr><td>LP</td><td>0.2481</td></tr><tr><td>Preal</td><td>9.4633</td></tr><tr><td>Qabs</td><td>3.5340e+05</td></tr><tr><td>Qext</td><td>-2.7022e+05</td></tr><tr><td>VD</td><td>0.0039</td></tr><tr><td>VP</td><td>0.0030</td></tr><tr><td>VSmi</td><td>1.4401e-04</td></tr><tr><td>Vma</td><td>0.0054</td></tr><tr><td>Vmi</td><td>0.0015</td></tr><tr><td></td><td></td></tr><tr><td>rnd</td><td>0.2354</td></tr></table>

Il-lustració 73 Resultats de la funció PreStirling.

Si els resultats obtinguts compleixen els requisits que li volem exigir al motor sobre rendiment, calors absorbides i extretes, relació de volums morts etc. Extraiem els paràmetres de disseny que necessitem i els introduïm a Dymola per fer-lo s'hi un anàlisis del rendiment mes acurat. Les dades que agafarem són: DD, DP, VSmi, LD i LP.

Les introduïm a Dymola accedint a la part de codi del Motor\_Stirling i en l’àrea d’interacció d’aquest fent doble clic sobre del ModelTermodinàmic. Cal esmentar que per tal de respectar les CI cal augmentar la posició màxima del cilindre la mateixa quantitat que augmentem la longitud del pistó del propi cilindre respecte els valors per defecte. Sinó caldria canviar les CI a las noves.

parameter SI.Length pistonLength=0.25   
"Longitud del cap del pistó de potència";   
parameter SI.Length pistonLengthl=0.28 "Longitud del cap del desplaçador";   
Modelica.Mechanics.MultiBody.Parts.BodyCylinder Piston\_ potencia(   
diameter=0.125,   
Modelica.Mechanics.MultiBody.Parts.BodyCylinder Desplacador(   
diameter=0.14,  
Il-lustració 71 Introducció de les longituds i diàmetres a Dymola.

<table><tr><td rowspan="2">Vm1</td><td>0.00015</td><td rowspan="2">Volum mort en el del desplaçador</td></tr><tr><td></td></tr><tr><td>Vm2</td><td>0.00015</td><td>Volum mort en el pistó de potència</td></tr></table>

Il-lustració 72 Introducció dels volums morts a Dymola.

Cal esmentar que a Dymola també li hem d’introduir el diàmetre del cilindre que es aproximadament cal que sigui un 1.03 vegades més gran que el diàmetre del desplaçador

![](images/479e7f195a7f8456769d909f639b0029e5ac2c5ef7684896240cd50f1eacc23c.jpg)  
Il-lustració 74 Introducció del diàmetre del cilindre a Dymola.

Ajustem les temperatures en l’area d’interacció del Motor\_Stirling:

![](images/18570676ac36062cbea9b22443b80ad3efd14dac3d6eb02aabc7eb4e723dae99.jpg)  
Il-lustració 75 Introducció de les temperatures de treball a Dymola.

Ara ja podem simular per comparar resultats. S'ha de tenir present que en Matlab hem calculat les calors per unitat de massa i cicle, i la potència per cicle, així que caldra convertir les calors i la potència de Dymola a aquestes unitats (dividint el calor per el producte de la massa per la freqüència del cicle i dividint la potencia per la freqüència del cicle).

Observem els resultats obtinguts en Dymola:  
![](images/ba6860bc1e0621125e38ac896fcdcb6f7fba2c73bc0f1b2607acb7a5ea165778.jpg)  
Il-lustració 76 Calors i masses del sistema.

![](images/173a7ed33faa9dea9246daff2c25b6e0896ec6115ff77fc2a484830a5129fd39.jpg)  
Il-lustració 77Volums del sistema.

![](images/07c0866dd0afb289be82b0ee933036a0b322566b97b629106603ad4653a70bee.jpg)  
Il-lustració 78 Velocitat de gir del sistema i la seva potència generada.  
Per els càlculs s’agafen els valors promitjos resultants de les gràfiques.

Taula 1 Comparativa de resultats entre l’anàlisi Matlab i l’anàlisi Dymola.
<table><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>Matlab</td><td rowspan=1 colspan=1>Dymola</td></tr><tr><td rowspan=1 colspan=1>Parametres</td><td rowspan=1 colspan=1>■</td><td rowspan=1 colspan=1>–</td></tr><tr><td rowspan=1 colspan=1>DD</td><td rowspan=1 colspan=1>0,135</td><td rowspan=1 colspan=1>0,14</td></tr><tr><td rowspan=1 colspan=1>DP</td><td rowspan=1 colspan=1>0,125</td><td rowspan=1 colspan=1>0,125</td></tr><tr><td rowspan=1 colspan=1>Vsmi</td><td rowspan=1 colspan=1>1,40E-05</td><td rowspan=1 colspan=1>1,50E-04</td></tr><tr><td rowspan=1 colspan=1>LD</td><td rowspan=1 colspan=1>0,27</td><td rowspan=1 colspan=1>0,28</td></tr><tr><td rowspan=1 colspan=1>LP</td><td rowspan=1 colspan=1>0,25</td><td rowspan=1 colspan=1>0,25</td></tr><tr><td rowspan=1 colspan=1>f</td><td rowspan=1 colspan=1>1</td><td rowspan=1 colspan=1>0,36605637</td></tr><tr><td rowspan=1 colspan=1>Valorpromitjos</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td></tr><tr><td rowspan=1 colspan=1>m1p</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>0,002</td></tr><tr><td rowspan=1 colspan=1>m2p</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>0,01</td></tr><tr><td rowspan=1 colspan=1>wp</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>2,3</td></tr><tr><td rowspan=1 colspan=1>Pp</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>0,5</td></tr><tr><td rowspan=1 colspan=1>Qcp</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>560</td></tr><tr><td rowspan=1 colspan=1>Qfp</td><td rowspan=1 colspan=1>-</td><td rowspan=1 colspan=1>2200</td></tr><tr><td rowspan=1 colspan=1>Resultats</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td></tr><tr><td rowspan=1 colspan=1>VD</td><td rowspan=1 colspan=1>0,0039</td><td rowspan=1 colspan=1>0,0035</td></tr><tr><td rowspan=1 colspan=1>VP</td><td rowspan=1 colspan=1>0,003</td><td rowspan=1 colspan=1>0,0035</td></tr><tr><td rowspan=1 colspan=1>Vma</td><td rowspan=1 colspan=1>0,0054</td><td rowspan=1 colspan=1>0,005</td></tr><tr><td rowspan=1 colspan=1>Vmi</td><td rowspan=1 colspan=1>0,0015</td><td rowspan=1 colspan=1>0,002</td></tr><tr><td rowspan=1 colspan=1>Preal</td><td rowspan=1 colspan=1>9,46</td><td rowspan=1 colspan=1>1,36590985</td></tr><tr><td rowspan=1 colspan=1>Qabs</td><td rowspan=1 colspan=1>3,53E+05</td><td rowspan=1 colspan=1>7,65E+05</td></tr><tr><td rowspan=1 colspan=1>Qext</td><td rowspan=1 colspan=1>2,70E+05</td><td rowspan=1 colspan=1>6,01E+05</td></tr></table>

Veiem que els resultats varien de un estudi a l’altre però no de manera exagerada. Els resultat que Dymola ens entrega són més ajustats a la realitat. Podríem realitzar aquest estudi varies vegades fins a trobar uns valors de disseny del motor que complissin amb les expectatives desitjades, però per tal de trobar aquests valors i estar segur de poder construir un prototip amb garanties d’un bon funcionament s’aconsella modelar abans les futures millores. Ja que aquestes ens oferiran una simulació més ajustada a la realitat.

# CAPÍTOL 5: FUTURES MILLORES

## 5.1. Dimensionament del coeficient globals de transferència de calor.

El dimensionament d’aquests coeficient segons els paràmetres geomètrics del nostre motor ens oferiria uns resultats de les simulacions encara més properes a la realitat així com una descripció del disseny del motor més específica.

A continuació es representa els anàlisis de la zona calenta i freda per tal de saber quins element i com intervenen en el dimensionament d’aquest paràmetres.

![](images/dfd4f1df39da09e724e68095ff85a4c196d628ac92e7b3accaf028d869e14b04.jpg)  
Il-lustració 79 Anàlisis tèrmic zona 1.

Analitzant la zona d’escalfament observem que tindrem una convecció exterior, dues conduccions(una per la tapa del cilindre i l’altre per el lateral d’aquest) i una convecció interior amb el fluid del sistema. La resistència equivalent total es pot calcular com la suma en paral·lel de les conduccions i el resultat d’aquesta sumada en sèrie amb les dues conveccions on caldria determinar els coeficients de convecció de cada zona (interior i exterior).

![](images/5e53f05a0d93f2e05083eab9ff88c50b9617b28c2b84d53e02a5d622f2549a00.jpg)  
Il-lustració 80 Circuit equivalent de la resistència.

Partint de:

$$
U = { \frac { 1 } { R T e q } }
$$

i segons lo esmentat anteriorment sabem que:

$$
R T e q = R c o n v . e x t + ( \frac { 1 } { R c o n d . t a p a } + \frac { 1 } { R . c o n d . c i l i n d } ) + R c o n v . \operatorname * { i n t }
$$

On:

$$
R c o n v . e x t = \frac { 1 } { h e ^ { * } 2 \pi ^ { * } r ^ { * } s p }
$$

$$
R c o n d . t a p a = \frac { e } { k m a t ^ { * } A t a p }
$$

$$
R c o n \nu . \operatorname* { i n t } = \frac { 1 } { h i ^ { * } 2 \pi ^ { * } r ^ { * } s p }
$$

$$
R c o n d . c i l i n d = \frac { \ln ( \frac { r e x t } { r _ { \mathrm { i n t } } } ) } { 2 \pi ^ { * } k m a t ^ { * } s p }
$$

On:

he = coeficient de convecció en la paret exterior.

hi = coeficient convecció paret interior.

kmat = conductivitat tèrmica del material.

elèctrica basat en motor Stirling"

rext = radi enteerior cilindre.

rint = radi interior cilindre.

e = espessor.

sp = Longitud disponible per a la transferència de calor.

Zona freda:

![](images/e92866c3b7d7436cb92747f2bc561acef18abb0b79fbc2effaa69a47cfefc0c1.jpg)  
Il-lustració 81 Anàlisis tèrmic zona 2.

Abans de començar l’anàlisi, de la part freda, cal esmentar que aquest és fa per el dimensionament de un coeficient global de transferència de un sistema de refrigeració amb aletes, ja que aquestes optimitzen el disseny afavorint el refredament. Per lo tant si és vulgues modelar aquesta part seria aconsellable utilitzar aquest disseny.

Observant la zona de refredament veiem que tindrem dues conveccions exteriors, una per les aletes i l’altre per la base sense aletes, dues conduccions (una per la tapa del cilindre i l’altre per el lateral d’aquest) i una convecció interior amb el fluid del sistema. La resistència equivalent total es pot calcular com la suma en paral·lel de les conduccions i el resultat d’aquesta sumada en sèrie amb les tres conveccions on caldria determinar els coeficients de convecció de cada zona (interior i exterior).

![](images/6c2fe6d254a53c9431362c677ee9d00d5352d7013c6b6d2de3b5ab4b326c72a7.jpg)  
Il-lustració 82 Circuit equivalent de la resistència.

Albert Garcia Prat

Partint de:

$$
U = { \frac { 1 } { R T e q } }
$$

i segons lo esmentat anteriorment sabem que:

$$
R T e q = R c o n v . e x t + R . c o n v . a l e t e s ( \frac { 1 } { R c o n d . t a p a } + \frac { 1 } { R . c o n d . c i l i n d } ) + R c o n v . \operatorname { i n t }
$$

On:

$$
R c o n v . e x t = \frac { 1 } { h e ^ { * } ( 2 \pi ^ { * } r 1 - N ^ { * } t ) ^ { * } H } R c o n d . t a p a = \frac { e } { k m a t ^ { * } A t a p }
$$

$$
R c o n \nu . \operatorname { i n t } = \frac { 1 } { h i ^ { * } 2 r o ^ { * } \pi ^ { * } H }
$$

$$
R c o n d . c i l i n d = \frac { \ln ( \frac { r 1 } { r o } ) } { 2 \pi ^ { * } k m a t ^ { * } H }
$$

$$
R c o n \nu . a l e t e s = \frac { 1 } { N ^ { * } \eta f ^ { * } h e ^ { * } A f }
$$

On:

he = coeficient de convecció en la paret exterior.

hi = coeficient convecció paret interior.

kmat = conductivitat tèrmica del material.

r0 = radi interior cilindre.

r1 = radi exterior inicial aletes.

r2 = radi exterior final aletes.

t = espessor aletes.

H = Longitud cilindre.

ηf = eficiència aletes.

N = número de aletes.

## 5.2. Dimensionament dels sistemes de refredament i d’escalfament.

Posat que el motor Stirling pot funcionar amb un gran nombre de fonts de calor i de fonts de refredament, aquestes no s'han dimensionat però si es disposes del temps es podrien modelar i coordinar amb els models existents per descriure el funcionament d'una manera més real. A més a més, podríem fer un estudi energètic i fins i tot crear sistemes de control per optimitzar aquest processos d’intercanvis de calors i augmentar encara més el rendiment del sistema.

Algunes fonts de calor poden ser: geotèrmica, calderes de pellets, concentradors solars parabòlics, etc.

Alguns sistemes de refrigeració poden ser: convecció natural o forçada amb aire i conducció forçada o natural amb aigua.

## 5.3. Facilitació de la interacció usuari/programa.

Posat que el ModelMecànic del motor no ha estat modelat al cent per cent per nosaltres, fa que aquest no tingui una interacció senzilla per el usuari. A més alguns valors geomètrics importants dels pistons del nostre motor no són fàcils de modificar perquè han estat programats per al ús en un motor V6. Si es disposes de temps estaria ver fer una reestructuració de certs paràmetres d’aquest model per facilitar la modificació d’aquest paràmetres que si que són importants per el motor Stirling i que ara per ara requereixen uns coneixements de programació i del model mecànic en si per poder ser modificats amb exactitud.

# CAPÍTOL 6: CONCLUSIÓ

En el camí de l’objectiu plantejat inicialment, investigació sobre la construcció d'un sistema de generació autònom basat en motor Stirling, les fites aconseguides són les següents.

• S'ha compres a fons el funcionament mecànic i termodinàmic del motor.

• S'han assolit coneixement de programació amb l’eina Dymola.

• S'ha arribat a la modelització total del motor en Dymola a través de l’aprofitament de models ja existents i la construcció de nous.

• S'ha dissenyat un dels prestudis del motor Stirling ja coneguts amb el software Matlab.

Seguint les recomanacions de l’apartat de futures millores s’arribaria a modelar un motor amb un rendiment més alt i més ajustat a un funcionament real. A més a més també es facilitaria la interacció entre l’usuari i el programa posant a l’abast de més persones l’ús d’aquest model presentat en aquesta memòria.

Personalment valoro molt positivament la realització d’aquest treball final de grau que m'ha apropat més a l’entorn dels mètodes numèrics i per consolidar molts altres coneixements prèviament adquirits.

# CAPÍTOL 7: BIBLIOGRAFIA

Revilla Vázquez, Maurici. Sistema de generación d’energia basado en un motor stirling aprovechando energías renovables. PFC, Universitat Politècnica de Catalunya, 2009.

Asensio Bueno, David. Evolución del rendimiento de un motor de combustión interna. Aplicación a pistones. PFC , Universitat Politècnica de Catalunya, 2010.

Moldenhauer, Stefan, and Thess, André. Modelica based simulation model of a Pulse Tube Engine. Ilmenau University of Technology (Germany). http://www.sft.asso.fr(accessed March 2013).

Beltrán Chacón, R. ; Velázquez Limón, N; Sauceda Carvajal, D. "Análisis y diseño de un sistema de generación eléctrica termosolar con concentrador de disco parabólico y motor Stirling de 2.7 kW enfriado por aire". Ingeniería. Investigación y Tecnología, vol XIII, núm.1, 2012, pp.43-53. Universidad NacionalAutónoma de México. DistritoFederal, México. http://www.redalyc.org/src/inicio/ArtPdfRed.jsp?iCve=40423210005 (accessed February 2013)

Agüero Zamora, Víctor. Diseño y construcción de un motor Stirling para la generación de energía eléctrica. PFC. Universidad Nacional de Ingeniería. Facultad de Ingeniería Mecánica. Lima, 2006. http://cybertesis.uni.edu.pe/uni/2006/aquero zv/pdf/aquero zv.pdf (acessed December 2012).

Shell and Tube Water Oil Cooler. Olaer SWO. http://www.olaer.fr (accessed March 2013)

Bachmann, Bernhard. Modelica Tutorial for Beginners. Exercises with Dymola. University of Applied Sciences. Bielefeld (Germany). http://www.isa.uma.es/C15/SeminarioModellica/Document%20Library/Ejercic ios modelica.pdf (accessed March 2013).

Ramos González, J.C. Fórmulas, Tablas y Figuras de transferencia de calor. Tecnum. Universidad de Navarra. Escuela de Ingenieros. 2010. http://www.unav.es/adi/UserFiles/File/80980099/Formulas1011.pdf (accessed March 2013).

Moran, M.J. and Shapiro, H. Fundamentos de Termodinàmica Técnica. Editorial Reverté. Barcelona. 2005.

Dymola. Dynamic Modeling Laboratory. Getting started with Dymola. Chapter 2 from "Dymola User Manual Volume 1. Dessault Systèmes AB. Ideon Science Park. Lund, Sweden, 2011 http://www.3ds.com/fileadmin/PRODUCTS/CATIA/DYMOLA/PDF/Getting-Started.pdf (accessed March 2013)

Benejam Bagur, J.L. Aprofitament de l’energia solar mitjançant motor Stirling. Memòria. Escola Politècnica Superior d'Enginyeria de Vilanova i la Geltrú. Universitat Politècnica de Catalunya. 2013.

Gual Esteve, Jordi. Disseny d'un captador solar de temperatura, amb motor Stirling i disc parabòlic. PFC. Escola Tècnica Superior d’Enginyeries Industrial i Aeronàutica de Terrassa. Universitat Politècnica de Catalunya. 2010.

Motor de combustión interna. PDF http://80.32.206.136/Tecnologia LCP/Documentos/MOTOR%20DE%20COMB USTION%20INTERNA.pdf(accessed March 2013)

Navarrete, R. Ignacio. Diseño de un motor Stirling para generación eléctrica con fuentes geotérmicas. Memoria. Facultad de Ciencias Físicas y Matemáticas . Departamento de Ingenieria Mecánica. Universidad de Chile. Santiago de Chile, 2008.

Losada San José, J. Análisis de un sistema de disco parabólico con motor Stirling. PFC. Escuela Técnica Superior. Universidad Carlos III . Madrid, 2009.

Sánchez, J.; Román, R.; Frederik, R. Modelación un Motor Stirling tipo gama para bajas entalpías. IV Conferencia Latino Americana de Energia Solar y XVII Simposio Peruano de Energia Solar . Cusco, noviembre 2010.

Maier, C.; Gil, A. Aguilera, R.; Shuang, L., YU, X. Stirling Engine. University of Gävle. Sweden, 2007.

Concepción Sánchez, Sergio. El motor Stirling y su implantación en buques mercantes. Facultat Nàutica de Barcelona. Universitat Politècnica de Catalunya. Barcelona, 2010.

Organ, Allan. Stirling Cycle Machine Analysis. University Ohio, 2010 http://www.ohio.edu/mechanical/stirling/me422.html(accessed February 2013)

Franco García, Angel. Curso interactivo de Física en Internet. http://www.sc.ehu.es/sbweb/fisica//estadistica/termodinamica/stirling/stirlin g.html