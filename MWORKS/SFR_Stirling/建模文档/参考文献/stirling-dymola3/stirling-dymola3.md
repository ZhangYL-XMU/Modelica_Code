TREBALL DE FI DE GRAU

![](images/74c96f56a17239616f9d009afe50ec6ad933b84895f07a8db3cb338488c0f0a6.jpg)

Barcelona, 05 de Maig de 2015

# ÍNDEX DE LA MEMÓRIA

Resum   
Resumen   
Abstract...   
Agraïments   
Glosari ...   
Índex de la memória   
Índex de figures   
Índex de taules   
CAPÍTOL 1: Prefaci..   
1.1. Origen del projecte   
1.2. Motivació   
CAPÍTOL 2: Objectius del projecte   
2.1. Objectiu general   
2.2. Objectius específics   
CAPÍTOL 3: Introducció   
CAPÍTOL 4: Dymola..   
4.1. Modelització   
4.1.1. Menú superior   
4.1.2. Menú disseny..   
4.1.3. Àrees de treball   
4.1.4. Navegador de Paquets (Package Browser)   
4.1.5. Navegador de Components (Component Browser)   
4.2. Simulació..   
4.2.1. Menú simulació (Simulation   
4.2.2. Menú Gràfics (Plot)   
4.2.3. Menú Animació (Animation   
4.2.4. Navegador de Variables (Variable Browser)   
4.2.5. Avançat (Advanced   
4.2.6. Comandes (Commands)   
CAPÍTOL 5: Motor stirling   
5.1. Descripció   
5.1.1. Descripció general   
5.1.2. Avantatges.   
5.1.3. Inconvenients   
5.2. Configuracions...   
5.2.1. Configuració Alpha   
5.2.2. Configuració Beta ..   
5.2.3. Configuració Gamma   
5.2. Cicle Stirling..   
5.3. Funcionament..   
CAPÍTOL 6: Modelització del motor stirling.   
6.1. Estat previ ..   
6.1.1. Model mecànic..   
6.1.2. Model termodinàmic   
6.1.3. Acoblament..   
6.1.3. Desenvolupament d’un prototip   
6.2. Parametrització i optimització.   
6.2.1.Parametrització.   
6.2.2. Optimització ..   
CAPÍTOL 7: Conclusions   
CAPÍTOL 8: Futures millores   
CAPÍTOL 9: Bibliografia..   
8.1. Referències bibliogràfiques   
8.2. Bibliografia complementària.

# ÍNDEX DEL PRESSUPOST

Índex del pressupost...   
CAPÍTOL 1: Pressupost del projecte...   
CAPÍTOL 2: Bibliografia...   
2.1. Bibliografia de consulta...

# ÍNDEX ANNEXOS

Índex annexos...   
CAPÍTOL 1: Annex 1. Resum projecte Albert Garcia.   
1.1. Annex 1.1. Model mecànic .   
1.2. Annex 1.2. Model Termodinàmic ...   
CAPÍTOL 2: Annex 2. Resum projecte Antía Varela .   
2.1. Annex 2.1. Verificació...   
2.2. Annex 2.2. Desenvolupament d’un prototip ..

![](images/4a9809b0ed97f766f6200e0dbb816e349877b5f776532fb1b1c2f3c8ac87910a.jpg)

Barcelona, 05 de Maig de 2015

# RESUM

L'objectiu d’aquest projecte es l’estudi, disseny ,simulació i optimització d’un motor Stirling utilitzant el software Dymola. Aquest software permet infinitat d’opcions de treball: disseny, implementació del model, desenvolupament, validació, comprovació i simulació tant gràfica, com numèrica, com dinàmica, entre moltes altres funcions. Aquest projecte està pensat amb l’objectiu de que alguna persona interessada en el motor Stirling pugui fer-se una idea de tot el que és i avarca aquest motor, a més a més de poder utilitzar-lo com a avantprojecte o font fiable i funcional d’informació per poder dur-lo a terme físicament parlant, al món real.

El present estudi no comença des de zero ja que ve de dos projecte anteriors, aquesta és la seva continuació, la tercera part. En la primera part es va aconseguir un model semi - funcional del motor Stirling. En la segona part es va millorar aquest primer model i es va arribar a un model funcional però no portable al món real, funcional dins el que entra en aquesta definició, tot hi així no seria útil per cap aplicació real degut a les seves característiques limitades. L'objectiu d’aquesta actual tercera part és seguir amb un model funcional i útil per algunes aplicacions reals. Això es durà a terme fent un estudi paramètric que permetrà millorar l’àrea de treball del Dymola en tots els seus nivells, les característiques bàsiques del motor i del cicle termodinàmic, a més a més de portar a terme les simulacions necessàries per aconseguir un model final òptim.

# RESUMEN

El objetivo de este proyecto es el estudio, diseño, simulación y optimización de un motor Stirling utilizando el software Dymola. Dicho software permite infinidad de opciones de trabajo: diseño, implementación del modelo, desarrollo, calibración, comprobación y simulación gráfica, numérica y dinámica del comportamiento de todos sus elementos y sistemas, entre muchas otras funciones. Éste proyecto está pensados con el objetivo de que alguien interesado en el motor Stirling pueda hacerse una idea de todo lo que es y abarca dicho motor, además de poder utilizarlo como anteproyecto o fuente fiable y funcional para poder llevarlo a cabo físicamente, al mundo real.

El presente estudio no empieza de cero ya que viene de dos proyectos anteriores, esta es su continuación, la tercera parte. En la primera parte se consiguió un modelo semi-funcional del motor Stirling. En la segunda parte se mejoró dicho modelo y se llegó a un modelo funcional pero no portable al mundo real, funcional dentro lo que cabe en la definición, sin embargo no serviría para utilizarlo en ninguna aplicación real debido a sus características limitadas. El objetivo de esta actual tercera parte es seguir con un modelo funcional y útil para algunas aplicaciones reales. Esto se llevará a cabo haciendo un estudio paramétrico que permitirá mejorar el área de trabajo de Dymola en todos sus niveles, las características básicas del motor y del ciclo termodinámico, además de llevar a cabo las simulaciones necesarias para conseguir un modelo final óptimo.

# ABSTRACT

The aim of this project is the study, design, simulation and optimization of a Stirling engine using the software Dymola. This software allows infinity of work possibilities: design, implementation of the model, development, calibration, check, and graphic, numerical and dynamic simulation of all of the elements, among many other functions. This project is thought with the goal that someone interested in Stirling engine could make an idea about all is and everything involved in this engine, moreover can use the project as a draft or reliable source and functional to bring this engine to the reality.

The present study does not start from zero, it comes from two previous projects, and this is their continuation, the third part. In the first part was achieved a semi-functional model of Stirling engine. In the second part was improved the semi-functional model and a functional one was achieved, but, it does not work for real applications because of his limited characteristics. The aim of this third part is to continue working with the functional model and make it useful for real applications. It will be done doing a parametric study which will allow to improve the area of work on Dymola in all of his levels, the basic characteristics of the engine and thermodynamic cycle, in addition to carry on the necessary simulations to get the final optimal model.

# AGRAÍMENTS

En primer lloc donar les gracies als meus pares i germà, Teresa, Xavier i Samuel, i a la meva parella, Coral, per tot el suport que m'han donat durant aquesta etapa de la meva vida que he estat realitzant el projecte.

En segon lloc, al meu tutor Joan Grau, per tota la col-laboració i assessorament rebut durant la realització d’aquest projecte, sense ell no hagués sigut possible.

En tercer lloc, agrair als dos anteriors enginyers, Albert Garcia i Antía Vaela, que van realitzar les parts primera i segona respectivament, a partir de les quals jo he pogut continuar i realitzar aquesta tercera part.

I finalment mencionar la EUETIB, que ha posat a la meva disposició les eines necessàries per poder dur a terme aquest projecte.

# GLOSARI

<table><tr><td>Terme en Anglès</td><td>Terme en Català</td></tr><tr><td>Acceleration</td><td>Acceleració</td></tr><tr><td>Blocks</td><td>Blocs</td></tr><tr><td>Clutch</td><td>Embragatge</td></tr><tr><td>Damper</td><td>Fregament</td></tr><tr><td>Dish-Stirling</td><td>Disc-Striling</td></tr><tr><td>Engine</td><td>Motor</td></tr><tr><td>Examples</td><td>Exemples</td></tr><tr><td>Height</td><td>Altura</td></tr><tr><td>Inertia</td><td>Inèrcia</td></tr><tr><td>Loops</td><td>Bucles</td></tr><tr><td>Mechanics</td><td>Mecànica</td></tr><tr><td>Ramp</td><td>Rampa</td></tr><tr><td>Revolute</td><td>Revolució</td></tr><tr><td>Sensor</td><td>Sensor</td></tr><tr><td>Sources</td><td>Recursos</td></tr></table>

# ÍNDEX DE LA MEMÓRIA

Resum   
Resumen   
Abstract.   
Agraïments.   
Glosari .   
Índex de la memória.   
Índex de figures ...   
Índex de taules... 16   
CAPÍTOL 1: Prefaci.. 17   
1.1. Origen del projecte 17   
1.2. Motivació 17   
CAPÍTOL 2: Objectius del projecte 18   
2.1. Objectiu general 18   
2.2. Objectius específics 18   
CAPÍTOL 3: Introducció 20   
CAPÍTOL 4: Dymola..... 22   
4.1. Modelització 24   
4.1.1. Menú superior .25   
4.1.2. Menú disseny. .25   
4.1.3. Àrees de treball. .26   
4.1.4. Navegador de Paquets (Package Browser) .27   
4.1.5. Navegador de Components (Component Browser) ..27   
4.2. Simulació .28   
4.2.1. Menú simulació (Simulation .29   
4.2.2. Menú Gràfics (Plot ..30   
4.2.3. Menú Animació (Animation .30   
4.2.4. Navegador de Variables (Variable Browser) ..30   
4.2.5. Avançat (Advanced .31   
4.2.6. Comandes (Commands) .31   
CAPÍTOL 5: Motor stirling ... 32   
5.1. Descripció .32   
5.1.1. Descripció general .32   
5.1.2. Avantatges... .34   
5.1.3. Inconvenients . .35   
5.2.Configuracions .36   
5.2.1. Configuració Alpha .36   
5.2.2. Configuració Beta. .37   
5.2.3. Configuració Gamma .38   
5.2. Cicle Stirling.. .39   
5.3. Funcionament. 41   
CAPÍTOL 6: Modelització del motor stirling .. 45   
6.1. Estat previ .45   
6.1.1. Model mecànic. .46   
6.1.2. Model termodinàmic . 48   
6.1.3. Acoblament .. 51   
6.1.3. Desenvolupament d’un prototip...... .54   
6.2. Parametrització i optimització.. .60   
6.2.1. Parametrització.. .60   
6.2.2. Optimització .. .70   
CAPÍTOL 7: Conclusions. .98   
CAPÍTOL 8: Futures millores . 100   
CAPÍTOL 9: Bibliografia.. 101   
8.1. Referències bibliogràfiques .101   
8.2. Bibliografia complementària. .101

# ÍNDEX DE FIGURES

Figura 1: "Dish-Stirling", concentrador cilíndric - parabòlic amb motor   
Stirling 21   
Figura 2: Entorn de modelització .. 24   
Figura 3: Menú superior modelització.. 25   
Figura 4: Menú disseny. .25   
Figura 5: Àrees de treball 26   
Figura 6: Navegador de Paquets (Package Browser).... 27   
Figura 7: Navegador de Components (Component Browser). . 27   
Figura 8: Entorn de simulació. 28   
Figura 9: Menú simulació. 29   
Figura 10: Menú Gràfics 30   
Figura 11: Navegador de Variables (Variable Browser) . 30   
Figura 12: Comandes (Commands) 31   
Figura 13: Configuració Alpha motor Stirling... 36   
Figura 14: Configuració Beta motor Stirling... 37   
Figura 15: Configuració Gamma motor Stirling. .. 38   
Figura 16: Cicle Stirling, diagrames P-V i T-S.. 39   
Figura 17: Esquema principi funcionament motor Stirling. ... .. 41   
Figura 18: Posicions dels pistons en cada etapa. ... ... 44   
Figura 19: Components dels pistons. .. 47   
Figura 20: Diagrama ModelVolums\_Test... .. 49   
Figura 21: Diagrama ModelTermodinamic\_Test... 50   
Figura 22: Diagrama ModelMecanic\_Stirling... 51   
Figura 23: Diagrama Model\_Final\_Stirling 53   
Figura 24: Diagrama Model\_Final\_Stirling de dos blocs amb   
temperatures 55   
Figura 25: Diagrama Model\_Final\_Stirling de quatre blocs. 56   
Figura 26: Representació 3D de la màquina de quatre blocs. 57   
Figura 27: Gràfic de la velocitat de gir [rad/s] en funció del temps [s] 58   
Figura 28: Gràfic de l’evolució de les temperatures freda i calenta [k] en   
funció del temps [s]. 58   
Figura 29: Corba característica de potència de la màquina de quatre   
blocs. 59   
Figura 30: Inici reducció pressió del sistema. 61   
Figura 31: Refredament màxim de l’aire. 62   
Figura 32: Inici escalfament del gas. 62   
Figura 33: Escalfament màxim de l’aire 63   
Figura 34: Creació de paràmetres/variables en el Model\_Final\_Stirling.   
66   
Figura 35: Transmissió de paràmetres/variables del Model\_Final\_Stirling   
al ModelMecanic\_Stirling pel bloc stirling. 66   
Figura 36: Transmissió de paràmetres/variables del   
ModelMecanic\_Stirling al Model\_Temordinàmic\_Stirling pel bloc stirling.   
67   
Figura 37: Gràfic velocitat de gir [rad/s] - temps [s] del model   
parametritzat sense canvis 69   
Figura 38: Gràfic velocitat de gir [rad/s] - temps [s] del model previ   
sense parametritzar 69   
Figura 39: Gràfic temperatures calenta i freda [k] – temps [s] del model   
sense parametritzar 69   
Figura 40: Gràfic temperatures calenta i freda [k] – temps [s] del model   
parametritzat sense canvis 70   
Figura 41: Gràfic potència [W] - temps [s] del model parametritzat   
sense canvis 70   
Figura 42: Script per les 8 simulacions Damper. ... 71   
Figura 43: Potència entregada en el cas Damper=0.5.. .72   
Figura 44: Velocitat angular en el cas Damper=0.5 ... ... 72   
Figura 45: Potència entregada en el cas Damper=1.0. .... 73   
Figura 46: Velocitat angular en el cas Damper=1.0 .... 73   
Figura 47: Potència entregada en el cas Damper=1.5. 74   
Figura 48: Velocitat angular en el cas Damper=1.5 ....   
Figura 49: Potència entregada en el cas Damper=2.0.... 75   
Figura 50: Velocitat angular en el cas Damper=2.0 ....   
Figura 51: Potència entregada en el cas Damper=2.5..   
Figura 52: Velocitat angular en el cas Damper=2.5 .....   
Figura 53: Potència entregada en el cas Damper=3.0..................... 77   
Figura 54: Velocitat angular en el cas Damper=3.0   
Figura 55: Potència entregada en el cas Damper=3.5...   
Figura 56: Velocitat angular en el cas Damper=3.5 .... 78   
Figura 57: Potència entregada en el cas Damper=4.0... .... 79   
Figura 58: Velocitat angular en el cas Damper=4.0 .. .... 79   
Figura 59: Comparativa corbes característiques de potència ............ 81   
Figura 60: Codi Scrip simulació +-20% del paràmetre D\_pisto........... 82   
Figura 61: Potència entregada en el cas D\_pisto =0.13 m ... 83   
Figura 62: Potència entregada en el cas D\_pisto =0.09 m ... ... 83   
Figura 63: Velocitat angular en el cas D\_pisto =0.13 m... .... 83   
Figura 64: Velocitat angular en el cas D\_pisto =0.09 m.. ... 83   
Figura 65: Potència entregada en el cas D\_pisto =0.13 m a partir segon   
36 84   
Figura 66: Potència entregada en el cas D\_pisto =0.09 m a partir segon   
36 84   
Figura 67: Velocitat angular en el cas D\_pisto =0.13 m a partir segon 36   
.. 85   
Figura 68: Velocitat angular en el cas D\_pisto =0.09 m a partir segon 36   
... 85   
Figura 69: Potència entregada pel cas D\_desp = 0,12 m. .......... .... 86   
Figura 70: Velocitat angular pel cas D\_desp = 0,12 m..... .. 86   
Figura 71: Potència entregada pel cas D\_desp = 0,17 m. ... 87   
Figura 72: Potència entregada estabilitzada pel cas D\_desp = 0,17 m . 87   
Figura 73: Velocitat angular pel cas D\_desp = 0,17 m. .. 88   
Figura 74: Velocitat angular estabilitzada pel cas D\_desp = 0,17 m .... 88   
Figura 75: Potència entregada pel cas crank\_pin\_offset\_desp = 0,12 m   
.. 90   
Figura 76: Potència entregada pel cas crank\_pin\_offset\_pisto = 0,12 m   
90   
Figura 77: Velocitat angular pel cas crank\_pin\_offset\_desp = 0,12 m.. 91   
Figura 78: Velocitat angular pel cas crank\_pin\_offset\_pisto = 0,12 m . 91   
Figura 79: Potència entregada simulació múltiples paràmetres cas 1... 92   
Figura 80: Potència entregada estabilitzada simulació múltiples   
paràmetres cas 1 .93   
Figura 81: Velocitat angular simulació múltiples paràmetres cas 1 ...... 93   
Figura 88: Velocitat angular estabilitzada simulació múltiples   
paràmetres cas 1 94   
Figura 89: Potència entregada simulació múltiples paràmetres cas 2... 95   
Figura 90: Potència entregada estabilitzada simulació múltiples   
paràmetres cas 2 . 96   
Figura 91: Velocitat angular simulació múltiples paràmetres cas 2 ...... 96   
Figura 92: Velocitat angular estabilitzada simulació múltiples   
paràmetres cas 2. .. 97

# ÍNDEX DE TAULES

Taula 6.1: Pistó de potència.. 63   
Taula 6.2: Desplaçador .. .64   
Taula 6.3: Resultats promitjos simulacions Damper .. ..80   
Taula 6.4: Resultats promitjos simulacions +-20% D\_pisto ... ... 82   
Taula 6.5: Resultats promitjos simulacions +-20% D\_pisto a partir segon   
36 de simulació.. .84

# CAPÍTOL 1: PREFACI

## 1.1. Origen del projecte

Aquest projecte final de grau surt de l’iniciativa i interès que ha sorgit en aquests últims anys pel desenvolupament i millora del motor Stirling. Això combinat amb I' interès per la simulació de sistemes fluidotèrmics que existeix en el departament de mecànica de fluids (MF) de l’EUETIB fa que s’arribi a aquest projecte.

Tot hi això, el projecte és llarg i laboriós, igual que el software de simulació Dymola, que és complex i amb moltes possibilitats. Per tot això, es va decidir ja des de un principi dividir el projecte en diferents parts, aquesta és la tercera. D’aquesta manera es pot aprofundir més en cada part, fer-les més bé i així obtenir un resultat final òptim i competent.

## 1.2. Motivació

Com a estudiant d’enginyeria de la energia i com a persona sensible amb el medi ambient, l’eficiència i l’estalvi tant energètic com econòmic, em vaig sentir atret per aquest projecte des de un bon principi ja que el motor Stirling pot utilitzar energia solar per funcionar, energia gratuïta, amb molt potencial i pràcticament sense emissions i que per tant pot tenir un bon rendiment. A més a més, aquest tipus de motor té un rendiment molt elevat i si s’aconsegueix desenvolupar de forma eficient i competent té un gran futur per endavant en moltes aplicacions.

Per un altre costat, durant els estudis d’aquest grau en enginyeria de l’energia he cursat varies assignatures de simulació, assignatures que he trobat molt interessants ja que esta clar que la simulació és el futur, que es pot fer servir en infinitat de camps diferents, aconseguir resultats molt similars a la realitat i per tant fiables, i provocar un estalvi econòmic molt important degut a la gran quantitat de proves o comprovacions que la simulació et pot estalviar realitzar.

# CAPÍTOL 2: OBJECTIUS DEL PROJECTE

En aquest apartat dividim els objectius en dos grups, l’objectiu general, que fa referència al la totalitat del projecte, i els objectius específics, que fan referència més concretament a aquesta tercera part.

## 2.1. Objectiu general

L'objectiu general en aquest projecte final de grau és, a través del software Dymola i tot el seu entorn de treball i simulació, obtenir un model totalment funcional, factible i competent del motor Stirling. Partim d’un model funcional però limitat, no és factible ni competent, i estudiant-lo i optimitzant-lo arribarem a l’objectiu final desitjat.

## 2.2. Objectius específics

Durant tot el procés de realització d’aquest projecte trobem objectius específics, que tots junts han de servir per arribar a l’objectiu final:

• Conèixer i aprendre a utilitzar el software Dymola en els entorns de disseny, programació i simulació.

• Estudiar, analitzar i comprendre perfectament el funcionament tant mecànic com termodinàmic del motor i cicle Stirling.

• Analitzar l’estat previ del projecte, comprendre'l a fons, buscar i implementar com seguir treballant i millorar-lo.

Parametritzar tota la programació i entorn de treball en el Dymola per aconseguir un comportament més harmònic, que afecti a tots els nivells del programa i faciliti la interpretació i utilització del programa i del projecte.

• Aconseguir l’estudi de simulació necessari i fer un anàlisis exhaustiu dels resultats.

• Arribar a un prototip de motor amb un millor comportament, una velocitat de gir més alta i una augment en generació de potència.

# CAPÍTOL 3: INTRODUCCIÓ

Definim màquina Stirling com aquell dispositiu que converteix la calor en treball, o vic eversa, a través d’un cicle termodinàmic regeneratiu, amb compressió i expansió cícliques del fluid de treball, aquest fluid treballa entre dos temperatures, la del focus calent i la del focus fred.

Quan la màquina opera de manera volumètrica rep el nom de màquina Stirling, mentre que si opera mitjançant flux permanent i continu s'anomena màquina Ericsson.

Al llarg de la història han rebut diferents noms, el primer va ser motors d’aire calent, degut a que només utilitzaven aire com a fluid de treball. Posteriorment, al utilitzar altres gasos com a fluids, se'ls va denominar motors de gas calent. Finalment el nom que va quedar va ser el de motors Stirling en honor al seu creador Robert Stirling.

Els motors Stirling van anar sent perfeccionats amb el temps i durant l’època d’esplendor de les màquines de vapor els motors Stirling s'utilitzaven en gran quantitat pel bombeig d’aigua i altres aplicacions de menor potència com per exemple ventiladors degut a que eren molt més segurs que les màquines de vapor, que sovint explotaven per les altres pressions, ja que aquets motors treballen amb aire a pressió ambient. Això va durar fins el gran desenvolupament dels motors de combustió interna i posteriorment els elèctrics que va provocar que els motors Stirling quedessin desplaçats. Tot hi això, a partir del segle XX, apareix un renovat interès pels motors Stirling per a noves aplicacions. Refrigeració, calefacció i generació elèctrica a partir de fonts de calor alternatives als combustibles fòssils d’alta qualitat, son els nous camps on els motors Stirling poder ser competitius respecte altres sistemes. Multitud d’empreses, particulars i departaments universitaris estan treballant en programes de disseny i experimentació amb màquines Stirling suficientment eficients per competir contra les solucions actuals.

Actualment existeixen diversos prototips fets però encara son molt poques les aplicacions que es poden trobar al mercat. La principal aplicació és la de generació d’energia elèctrica a partir de concentradors solars, ja que aquets motors son els que tenen un rendiment més alt en la conversió d’energia solar a electricitat.

![](images/667a6a2a92bccfce07806466055037ed34a5350081c773b3e3cb2545e9ce51cf.jpg)  
Figura 1: "Dish-Stirling”, concentrador cilíndric - parabòlic amb motor Stirling

A més a més, s’utilitzen com a motors de submarins, ja que són molt silenciosos i permeten recarregar les bateries a altes profunditats. Igualment també existeix un tipus de motor Stirling dissenyat especialment per iots. Algunes altres aplicacions serien com a cogenerador, ja que genera electricitat i aporta aigua per refrigerar, o simplement com a refrigerador.

# CAPÍTOL 4: DYMOLA

El nom Dymola surt de la unió de les dues primeres lletres de: DYNAMIC MODELING LABORATORY i ha sigut desenvolupat per la companyia sueca Dassault Systèmes AB. Es una eina molt complexa i amb capacitat per treballar en molts camps, permet la modelització i la simulació de sistemes molt complexes com per exemple en els camps de l’automoció, l’aeroespacial, la robòtica i tot tipus de processos, entre d’altres.

Diem que el Dymola és un software complex ja que les capacitats úniques de sistemes d’enginyeria que el formen presenten solucions noves i revolucionàries per modelitzar i simular, ja que es possible simular comportaments dinàmics i complexes iteracions entre sistemes de diferents camps. Així doncs, els usuaris de Dymola poden dissenyar o construir models més integrats i aconseguir els resultats de simulació que millor representen la realitat.

L'entorn Dymola utilitza el llenguatge de modelització obert Modelica (Modelica modeling language). Això permet als usuaris tenir la Ilibertat per crear les seves pròpies Ilibreries model o modificar les Ilibreries model ja existents per tal d’adaptar-les totalment a les necessitats de modelització i simulació del seu model personal. Aquesta flexibilitat fa que el Dymola sigui un software molt versàtil tal que és perfecte per modelitzar i simular nous i alternatius dissenys i tecnologies.

Els creadors del Dymola el defineixen com un software de modelització i simulació en multitud d’enginyeries (Multi-Engineering Modeling and Simulation) ja que compleix les següents característiques:

• Potent, fàcil d’utilitzar, modelitza i simula multidisciplinaris sistemes.

• Validar els sistemes de control en els models 'vegetals' integrats.

Reduir la necessitat de prototips físics mitjançant l’ús d’especificacions executables.

Millorar la qualitat del disseny final del producte a través de l’assaig de més alternatives de disseny.

• Comunicar i intercanviar fàcilment els models entres diferents equips de treball dins el mateix projecte.

Per poder utilitzar tot el potencial que ofereix Dymola s'ha d’instal·lar un compilador, en el nostre cas el C++ Visual Studio, que permet executar les simulacions a nivell de visualització 3D i aplica la resolució matemàtica al sistema.

Per poder realitzar aquest treball utilitzant el Dymola s'ha utilitzat una versió educativa que està instal·lada en un ordinador propietat de la Universitat Politècnica de Catalunya i que ens permet tenir accés a uns recursos de simulació superiors als oferts per ordinadors convencionals ja que les seves característiques tècniques tenen unes prestacions més elevades.

Al igual que en les dues parts anteriors a aquest projecte hem utilitzat la màquina que porta per nom PC186 i que dóna lloc a les següents característiques:

PC186 SGI-H2106, amb una placa base que disposa de quatre cpu's (AMD OPTERON 6140) de 8 nuclis (cores) cada cpu. Consta d’un total de 64 GB de RAM. Conté un disc principal de 1 TB (con RAID 1, mirall amb un disc de les mateixes característiques per qüestions de seguretat) i dos discs secundaris de 2 TB, que sumen una capacitat total d’emmagatzematge de 5 TB.

Com hem anat repetint durant tota aquest introducció, podem dividir el software Dymola en dos apartats o dos entorns de treball clarament diferenciats:

• Entorn de Modelització: serveix per buscar, dissenyar i composar models i components del model.

• Entorn de Simulació: serveix per fer experiments amb el model i representar els resultats i l’animació.

En la part inferior dreta de la pantalla del Dymola trobem la següent icona que ens permet canviar d’un entorn a l’altre.

<table><tr><td>Modeling</td><td>VSimulation</td></tr></table>

## 4.1. Modelització

Com he dit anteriorment, aquest entorn serveix per dissenyar i composar models i components d’aquest. Per tal de fer-ho existeixen varies opcions, es poden utilitzar Ilibreries ja existents que ofereix el mateix programa, es poden utilitzar les eines que ofereix per a crear-lo de nou, o bé es poden exportar models i components des d’altres programes de creació de models, com per exemple el Simulink o programes de disseny de CAD, ja que Dymola està preparat per suportar-los.

En la figura 2 es pot veure l’entorn de modelització en el nostre projecte amb totes les seves icones i apartats de treball. Fen ús de les eines i opcions que ens ofereix el software es pot no només dissenyar, sinó modificar i crear interaccions entre els diferents models o components. A continuació s'explica més detalladament aquests apartats de treball i eines.

![](images/019501b6afeea5ee7a06f3159f67baf9d764e38b7547e639716e2335ef15b437.jpg)  
Figura 2: Entorn de modelització

### 4.1.1. Menú superior

Com en molts programes en el menú superior hi trobem diferents pestanyes desplegables, les que ens seran útils en l’apartat de modelització són les següents (figura 3): Arxiu (File), Editar (Edit), Comandes (Commands), Finestra (Window), Ajuda (Help) i Anàlisis lineal (Linear analysis). La resta estan inhabilitades i només s’activen quan canvies a l’entorn de simulació.

File Edit Simulation Plot Animation Commands Window Help Linear analysis

Figura 3: Menú superior modelització.

La pestanya més rellevant i l’única que detallaré aquí es la d’Arxiu (File). Com en la majoria de softwares, serveix per obrir, carregar, guardar, importar, exportar, imprimir, etc. També conté les llibreries que ofereix Dymola. Mitjançant l’opció Nou (New) dins el desplegable t’ofereix l’opció de crear, no només un nou model, sinó una part d’aquest com un connector, una funció del sistema o un component.

### 4.1.2. Menú disseny

Aquest menú (figura 4) I’he anomenat així perquè, al igual que en qualsevol altre programa de disseny, serveix per crear, dibuixar, dissenyar, donar forma, introduir text, donar color i unir els diferents components i model. La funció de cada icona s’intueix fàcilment.

![](images/f78dd94373c3b954759a0806f9b81872787569d89fcaca4d2ae1968467f2b769.jpg)  
Figura 4: Menú disseny.

![](images/121eab1b7e8d627e12bbcb1915bcae399da7c546a1e1d9f91f5a6e0422ad2554.jpg)

### 4.1.3. Àrees de treball

![](images/d998d3ddca6bf75e6737059ae4547b3cf7e768740919ae25c296d09873732fcd.jpg)

**Figura 5: Àrees de treball**

Mentre vas dissenyat i inclús un cop acabat pots treballar o veure el teu model des de diferents àrees de treball (figura 5). Les aniré explicant una a una, seguint l’ordre d’esquerra a dreta en la figura 5.

• Els dos requadres blaus units per dues fletxetes () serveixen per veure i tenir accés als últims models que has tingut oberts en el Dymola.

• Les dues fletxes següents (→) serveixen per moure't enrere o endavant respectivament en els diferents nivells del model.

La tercera icona, el requadre blau en solitari (), se l’anomena àrea de disseny. En aquest àrea és on es pot donar forma gràfica al component o model que s'està creant. Utilitzant les icones del menú disseny explicat anteriorment es crea i en aquesta àrea és on el podem veure en forma d’imatge o icona per fer-nos una idea de quina pot ser la seva funció.

La quarta icona, els dos requadres blaus units per connexions (), se l’anomena àrea d'interacció. És aquí on es pot modificar el model, afegint component d’algun sistema, ja siguin variables, connectors, funcions, etc. o d’algun sistema complex, com serien models, condicions inicials, etc.

La cinquena icona (), com es pot deduir per la forma, ens dona informació sobre el model, concretament ens informa sobre l’element que tinguem seleccionat i ens dóna informació sobre el funcionament, les variables o les unitats.

La sisena icona, requadre blau escrit (), se l’anomena àrea de codi. Aquí és on està recollit, escrit en forma de codi de Modelica, tot el que s'ha anat creant des de les àrees de disseny i interacció. Aquesta àrea permet modificar o incloure en el model per escrit qualsevol variable, equació, connexió, condició inicial etc. que sigui necessari utilitzant algun dels llenguatges suportats per Dymola.

### 4.1.4. Navegador de Paquets (Package Browser)

Navegador de Paquets (Package Browser)

![](images/00212dce64357a468032bb743b3c96309f20e56482e1edcf16a8167051c0c14c.jpg)  
Figura 6: Navegador de Paquets (Package Browser).

Aquesta part del software (figura 6) ens permet tenir classificades les diferents parts del model, podent amagar-les o desplegar-les utilitzant els + i -, i accedint a qualsevol d’elles simplement amb un doble clic a sobre del nom.

A més a més de tot el que hem anat creant, també hi podem trobar les diferents Ilibreries existents, utilitzant el desplegable Modelica. Aquestes Ilibreries permeten utilitzar els components ja creats per Dymola tal qual, o bé modificarlos sobre la seva base per adaptar-los al cas d’estudi adequat.

### 4.1.5. Navegador de Components (Component Browser)

Al igual que en el navegador de paquets, es pot consultar amagant o desplegant els diferents nivells amb les opcions + i -. Ens permet accedir i veure els diferents models d’un sistema complex així com els components de cada model que el componen.

![](images/661a4a4ec266a9fcc804110a25be9e41aca89a100318bc861a4acb1c507f5b79.jpg)  
Figura 7: Navegador de Components (Component Browser).

## 4.2. Simulació

D’igual manera que en l’entorn de modelització ens deixa introduir i treballar amb dissenys creats amb altres programes, també son acceptats per l’entorn de simulació i, a I'hora d’oferir els resultats de les simulacions, els ofereix suportables per altres programes i també ens ofereix la opció d’exportar-los, per exemple, amb format txt.

Aquest entorn ens permet visualitzar els resultats de diferents maneres utilitzant les eines apropiades i ens ofereix també diferents mètodes numèrics per la resolució d’aquests. A continuació explicaré una mica més detalladament les eines i opcions que ens ofereix en quant a simulació.

![](images/6e885d9344e5894a6c9dfe53bf000eda9905c804d703cf37d020c5ea358c48ce.jpg)  
Figura 8: Entorn de simulació.

### 4.2.1. Menú simulació (Simulation)

Aquest menú és exactament el mateix que trobem en la pestanya desplegable simulació (simulation) del menú superior que en l’entorn de modelització no estava habilitada i aquí, en l’entorn de simulació, si ho està.

![](images/ae0abb136c56d88d6aac3f1b77aaa497657bc1acab7012e71e20904ae5f25ade.jpg)  
Figura 9: Menú simulació

A continuació explico més detalladament cada icona seguint d’esquerra a dreta l’ordre de la figura 9:

La primera icona, requadre verd () s’anomena Córrer Scrip (Run Script) i serveix per afegir un script amb les comandes que facin falta per aplicar i tenir en compte abans de la simulació.

La segona icona ()s’anomena Interpretar (Translate) i serveix llegir el codi del model i comprovar que és correcte. En cas de no ser correcte salta un missatge amb els errors per corregir abans de començar la simulació. Si no li dius res ho farà normal, però ofereix les opcions de exportar i FMU.

• La tercer icona () s’anomena Simular (Simulate) i el que fa és simular i resoldre el model. Aquesta icona primer interpreta i si és correcte simula, l’anterior icona simplement interpretava, no simulava.

• La quarta icona () s'anomena Parada (Stop), serveix per parar la simulació i, lògicament, només està activa quan hi ha una simulació en procés.

• Per últim, la cinquena icona (), s'anomena Configuració (Setup). Al pitjar en la icona es desplega un menú amb tota la configuració de la simulació on es poden fer modificacions segons convingui de, per exemple, els intervals de temps d’estudi, el temps d’inici o el temps final.

### 4.2.2. Menú Gràfics (Plot)

Igual que amb l’anterior menú simulació, és exactament el mateix fer servir aquest barra d’eines que utilitzar les comandes que es troben en el desplegable del menú superior Gràfics (Plot) que en aquest entorn si està activat, mentre que com he explicat en l’entorn de modelització estava inhabilitat.

![](images/0bf3f6c7e2961255d54acfe996ff85c47aabc5d97ce59275e54482bf4307f55b.jpg)

**Figura 10: Menú Gràfics**

Aquest menú serveix per treballar, crear, adaptar, modificar els gràfics de les diferents variables o evolucions al nostre gust o necessitat. Cada icona té la seva funció i es pot fer el típic que es pot fer en qualsevol software on es manipulin gràfiques, d’aquí que sigui molt intuïtiu i sobri l’explicació.

### 4.2.3. Menú Animació (Animation)

Aquest menú fa referència al desplegable Animació (Animation) que es trop en el menú superior i que, igual que els dos anteriors, en l’entorn de modelització el trobàvem inhabilitat. Com he dit, el Dymola ofereix diferents maneres de presentar els resultats de la simulació $\mathsf { i } ,$ una d’elles, és la versió animació 3D. Aquest resultats son exportables i suportables per altres programes. Serveix per donar una idea més clara del funcionament del model i poder comprovar si funciona correctament.

### 4.2.4. Navegador de Variables (Variable Browser)

Aquí $\mathsf { é s , }$ un cop acabada la simulació, on apareixen totes les variables amb el seu valor. És aquí on es seleccionen per representar-les en les gràfiques, i també s'hi poden modificar les variables declarades com a paràmetres.

![](images/05230ec3cfec59ae52c703e8081646f18c938a43656696c2a052ff6560a0c382.jpg)  
Figura 11: Navegador de Variables (Variable Browser)

### 4.2.5. Avançat (Advanced)

Amb aquest opció Dymola va detectant els possibles errors generals durant la simulació per desprès poder solucionar-los, a més a més d’informar sobre com evoluciona la simulació en temps real.

### 4.2.6. Comandes (Commands)

Aquest apartat serveix per introduir comandes o modificacions manualment des de l’entorn de simulació sense la necessitat d'haver de tornar a l’entorn de modelització. Té les seves corresponents icones que tots coneixem per adaptar el text a les necessitats.

![](images/79075f820fc096da58032c8dc43230cdab8238f30eca99b518ede3b55070c5e6.jpg)  
Figura 12: Comandes (Commands)

# CAPÍTOL 5: MOTOR STIRLING

L’explicació del motor Stirling es pot dividir en quatre parts ben diferenciades: Descripció, Configuració, Cicle termodinàmic Stirling i Funcionalment.

## 5.1. Descripció

### 5.1.1. Descripció general

El creador del motor Stirling, Robert Stirling, va inventar i patentar el motor que porta el seu nom l’any 1816. Era un religiós escocès que pensava que les màquines de vapor es podien millorar, fruit d’aquest pensament en va sortir el motor Stirling.

És un motor de combustió externa fen front als tradicionals motors de gasolina o diesel de combustió interna que mouen els vehicles. El motor treballa amb una font de calor externa com podria ser l’energia solar o nuclear. Un cop en el procés de conversió del calor en treball el motor Stirling aconsegueix un rendiment superior a qualsevol altre en el món real. Aproximant-se el màxim possible al rendiment ideal de Carnot. En la pràctica està limitat perquè no treballa amb gas ideal i es inevitable el fregament en els diferents components que es mouen.

El motor Stirling utilitza una font de calor fixa per escalfar l’aire de dins el cilindre. Se'l pot considerar de combustió externa i procés adiabàtic, ja que no requereix cremar combustible en el seu interior i al operar, no transfereix calor a l’entorn. El mecanisme central d’un Stirling consisteix en dos pistons/cilindres, un per dissipar calor i desplaçar l’aire calent cap a la secció freda i al revés.

El motor Stirling està format per dos pistons (pistó de potència i desplaçador), un/dos cilindres segons configuració, cigonyal i regenerador. Les diferents configuracions estan explicades en el seu corresponent apartat.

Pel que fa al regenerador. Actua com un sistema que emmagatzema energia en cada cicle. El calor es diposita en el regenerador quan el gas es desplaça des del focus calent cap al focus fred disminuint la temperatura. Quan el gas es desplaça des del focus fred al focus calent el regenerador subministra energia al gas augmentant la seva temperatura.

El regenerador o economitzador esta desenvolupat per augmentar l’eficiència de la màquina. Aquest sistema redueix tant la quantitat de calor que s'ha de proporcionar al gas a partir de la font externa com la quantitat de calor desaprofitat que ha d’eliminar el sistema de refrigeració. Per tant, es redueix el consum de combustible i es millora l’eficiència global del cicle de treball.

### 5.1.2. Avantatges

• L'aportació de calor es sempre externa i per tant les emissions de combustió són mínimes i flexibles.

• Funciona amb qualsevol font de calor, no només per combustió, sinó que es poden utilitzar fonts de calor com l’energia solar, la geotèrmica, nuclears, biològiques, etc.

• Es pot utilitzar un procés de combustió continua i, junt amb el fet de que el cicle és tancat, fa que es puguin reduir considerablement les emissions.

• El mecanismes són senzills, més que en altres màquines alternatives, ja que no necessiten vàlvules i el cremador es pot simplificar.

Una màquina Stirling utilitza el fluid de treball en una única fase, mantenint les pressions internes properes a la pressió de disseny i això fa que es redueixin els riscs d’explosió. A diferència de la màquina de vapor no treballa amb aigua en estat líquid i gas (vapor) i el risc d’explotar és mínim.

• Té un baix nivell de soroll i la falta de vibracions fan que sigui un motor molt silenciós.

• Té un rendiment molt alt ja que el motor Stirling pot aconseguir un rendiment molt proper al rendiment ideal de Carnot.

### 5.1.3. Inconvenients

Els motors Stirling requereixen intercanviadors de calor d’entrada i sortida, que tenen que mantenir el fluid de treball a alta temperatura, així com poder suportar els efectes corrosius de la font de calor i l’atmosfera. Això suposa un encariment del preu dels materials.

• La dissipació de calor en el focus fred és complicada ja que el refrigerant es manté a la temperatura més baix possible per augmentar l’eficiència tèrmica.

• Els motors Stirling no poden arrancar instantàniament, perquè primer s'han d’escalfar. Això és comú per tots els motors de combustió externa.

• El treball realitzat per un motor Stirling tendeix a ser constant i per ajustar-lo requereix un disseny acurat i mecanismes addicionals.

Dificultat en la construcció del motor per tancar el fluid de treball durant tota la vida útil, això eleva el cost del motor.

• Llarg període de temps per encendre i apagar el motor.

• A dia d’avui falta experiència encara en la construcció d’aquests motors.

## 5.2. Configuracions

Existeixen tres tipus de configuració: Alpha, Beta i Gamma. A més a més hi ha algunes configuracions especials que combinen dues de les anteriors configuracions.

### 5.2.1. Configuració Alpha

Amb dos pistons, aquest tipus de motor es una mica diferent però funciona amb el mateix principi termodinàmic. La diferència és que no utilitza desplaçador com la patent original de Robert Stirling. Consta de dos cilindres independents connectats per un tub on es situa el regenerador que acumula i cedeix el calor, en cada un del cilindre hi ha un pistó i es mouen desfasats 90 graus l’un de l’altre.

Un dels cilindres s’escalfa mitjançant un encenedor de gas o alcohol, i l’altre es refreda mitjançant aletes o aigua.

![](images/602c2fad7039a969db2f2d476edb76afa6e4567b4a0237e597021fb8d359589a.jpg)  
Figura 13: Configuració Alpha motor Stirling.

### 5.2.2. Configuració Beta

Amb el pistó i el desplaçador al mateix cilindre. El primer motor realitzat per l’inventor Robert Stirling va ser d’aquest tipus.

El desplaçador i el pistó de potència estan posats concèntricament. La missió del desplaçador es passar l’aire de la zona freda a la zona calenta, i al revés. Mitjançant un cigonyal especial el moviment del pistó i el desplaçador estan desfasats 90 graus, cosa que permet el funcionament.

Des del punt de vista termodinàmic és el motor més eficaç, però la seva construcció és la més complicada.

![](images/1d6181e79ae427fe12ee46eb9d968c6b1d8e72392c02cb29de042bfc0b30eefc.jpg)  
Figura 14: Configuració Beta motor Stirling.

### 5.2.3. Configuració Gamma

Amb el pistó i el desplaçador en cilindres diferents. És una configuració derivada de la Beta, però més senzill de construir mecànicament parlant. En aquesta configuració el pistó de potència es molt més senzill de construir ja que es similar al d’un motor de motocicleta. Igualment en aquest cas, el pistó i el desplaçador estan desfasats 90 graus, cosa que s'aconsegueix mitjançant el cigonyal adequat.

Consta de dos cilindres separats en un dels quals es situa el desplaçador i en l’altre el pistó de potència. Els sistemes per escalfar i refredar són els mateixos que la configuració Beta.

Termodinàmicament parlant, es menys eficaç que la configuració Beta degut a que l’expansió del treball es realitza a menor temperatura en la seva totalitat.

![](images/b305ab95b79b3f1ac8033b2268d655286528984ecf7f9886c1f5a2c207e57b13.jpg)  
Figura 15: Configuració Gamma motor Stirling.

## 5.2. Cicle Stirling

El motor Stirling funciona seguint el conegut Cicle Stirling. Aquest cicle busca el màxim rendiment i és semblant al rendiment de Carnot. El rendiment del cicle Stirling és sensible a la temperatura exterior i per tant tindrà una millor eficiència en climes freds que càlids.

Tots els motors que funcionen amb cicle Stirling son motors de cicle tancat. En aquests motors existeix una quantitat fixa d’aire en l’interior, sense variar-la ni per augmentar ni per disminuir. Així doncs, els processos de transferència de fluid (aire) des d’un focus a l’altre són a volum constant. El pistó i el desplaçador es mouen simultàniament i a velocitat idèntica, mantenint la distància entre ells. Si per qualsevol motiu es produís una variació, el circuit no funcionaria degut a la pèrdua de compressió i per tant d’energia.

Com es pot veure en la següent imatge, el cicle Stirling es pot dividit en 4 punts, i per tant 4 passos explicats a continuació.

![](images/89946b66434c43b027bf320941727fd836ef0476710574d8c4041dd746303758.jpg)

![](images/1357303e2677606e024f2726770d0bdbb5ee8de091cc5a1914c049c6970542ed.jpg)  
Figura 16: Cicle Stirling, diagrames P-V i T-S.

1-2: Compressió isoterma a temperatura baixa, la temperatura inferior, cedint el calor a la font freda.

2-3: Aportació de calor a volum constant, i com a conseqüència, augment de pressió.

3-4: Expansió isoterma a temperatura alta, la temperatura superior, absorbint el calor de la font calenta.

4-1: Extracció de calor a volum constant, disminuint a la temperatura mínima la temperatura del fluid.

En el cicle Stirling, si el regenerador te eficiència e = 1, té com a rendiment el de Carnot. Això es degut a que els processos a volum constant absorbeixen i cedeixen el mateix calor q1 (2-3) = q2 (4-1), és a dir, cobreixen àrees iguals en el diagrama TS.

A més a més, el cicle Stirling genera més treball per cicle que el corresponent de Carnot:

$$
\mathbb { 1 } \left( \mathbf { S t i r l i n g } \right) = \mathbb { 1 } ( \mathbf { C a r n o t } ) = \mathbf { 1 } - \frac { \mathbf { T m } \mathbf { \bar { i } n } } { \mathbf { T m } \hat { \mathbf { a } } \mathbf { x } }
$$

W cicle (Stirling) > W cicle (Carnot)

## 5.3. Funcionament

En aquest apartat s’explica el funcionament del motor en funció de les posicions dels pistons. Igual que en el cicle Stirling ho podem dividir en quatre passos.

Com ja hem comentat, en motor Stirling opera en un cicle tancat, obtenint el treball a partir de quatre processos cíclics consecutius: Aportació de calor, Expansió amb l’aportació de calor de la font de calor, Extracció de calor cap a un acumulador tèrmic regeneratiu (regenerador) i Compressió amb extracció de calor cap el focus fred.

Parlant de l’esquema conceptual del motor Stirling, el fluid es trop confinat dins d’un cilindre entre dos pistons oposats. Al mig, dividint l’espai hi ha el regenerador, que al ser travessat pel fluid l’acciona per adequar-lo a la temperatura de la càmera en que es trop. A un costat hi ha la càmera de compressió, a baixa temperatura, i en l’altre hi ha la càmera de expansió, a alta temperatura.

![](images/0753207721b59695bcca4da4e365c543a7642a13beb10d08ff83727ff9db1915.jpg)  
Figura 17: Esquema principi funcionament motor Stirling.

En l’anterior imatge (figura 17) es pot veure l’evolució d’un dels possibles esquemes del funcionament del motor Stirling i els quatre passos que el conformen. Es poden observar les diferents posicions que adopten el pistó de potència (1) i el desplaçador (2) i com evolucionen els volums de les càmeres freda (3) i calenta (4) en cadascun dels passos. També hi podem trobar el regenerador (6) que uneix les dues càmeres a través del conducte adaptat (7) on també hi trobem els elements necessaris (5) per absorbir i cedir el calor. A continuació es detallen pas per pas.

Posició I. El pistó de potència es troba en el punt mort inferior i el desplaçador es trop en el punt mort superior. Tot el fluid està en la càmera freda i per tant aquesta té volum màxim, mentre que com a conseqüència la càmera calenta té volum mínim, nul

Pas I-II. Es produeix un procés de compressió isotèrmica (mateixa temperatura i diferent volum) a la càmera freda, per consegüent s'ha d’extreure calor.

Posició II. El desplaçador es queda en el punt mort superior i el pistó de potència avança fins al punt mort superior comprimint el fluid a temperatura baixa, el fluid tindrà volum mínim però la càmera freda tindrà volum mig, mentre que la càmera calenta segueix a volum mínim.

Pas II-III. Es produeix el traspàs de fluid de la càmera freda a la càmera calenta de forma isocòrica (mateix volum i diferent temperatura). El fluid travessa el regenerador, que li aporta calor per arribar a la temperatura alta, d’aquesta manera, entra a la càmera calenta a la seva pròpia temperatura.

Posició III. El pistó de potència es manté al mateix punt (punt mort superior) i el desplaçador deixa entrar el fluid a la càmera calenta avançant cap al seu punt mort inferior (però no arriba, es queda a mig camí). El fluid segueix a volum mínim. El volum de la càmera calenta a augmentat al seu volum intermedi mentre que el de la càmera freda ha passat a ser nul.

Pas III-IV. Es produeix una expansió isotèrmica (mateixa temperatura i diferent volum) en la càmera calenta, per consegüent s'ha d’aportar calor.

Posició Iv. El fluid s’escalfa al passar per el regenerador i com a conseqüència fa una pressió sobre el desplaçador que l’obliga a avançar ara si fis al seu punt mort inferior, igual que el pistó de potència que també avança fins al seu punt mort inferior.

Pas IV-I. El desplaçador es desplaça cap al seu punt mort superior fent passar tot el fluid fins la càmera freda a través del regenerador. Quan el desplaçador ha arribat al seu punt mort superior tornem a tenir la mateix estructura que en I. Es produeix un traspàs de fluid de forma isocòrica (mateix volum i diferent temperatura). El fluid travessa el regenerador i el refreda, acumulant-se així el calor en el regenerador fins que torni a passar el fluid i tornar a entregar-li el calor.

El procés explicat anteriorment dependrà en certa manera de la configuració del motor però en totes les configuracions es respecta el mateix fonament i funcionament. En tots els casos el treball s’entrega en els passos 2-3 i 4-1 del cicle.

Un altre motiu que no afavoreix al rendiment del motor Stirling és la presència de volums morts. Existeix una part del volum de fluid que està demostrat que els pistons no aconsegueixen moure ja que se'ls escapa pels laterals i queda mort. Aquest volum no participa en el cicle i això contribueix doncs a una major ineficiència. Eliminar aquests volums morts és pràcticament impossible i per tant el que s'ha de fer és intentar minimitzar-los al màxim.

En el nostre model, quan la pressió es màxima és just quan el pistó ha acabat d’entregar la força a l’eix de potència. Tot seguit s'ha de treure pressió, i això es provoca amb el desplaçador avançant cap al seu punt mort superior i desplaçant el fluid cap a la càmera freda. Un cop el desplaçador ha arribat al seu punt mort superior tot el fluid es trop a la càmera freda i a pressió mínima. El següent pas és comprimir l’aire a temperatura freda i, a continuació, traspassar-lo altre vegada a la càmera calenta tornant a arribar a la pressió màxima amb el fluid a la temperatura calenta. La diferencia de pressions que hi ha en el fluid i el volant d’inèrcia i l’exterior de la màquina ajudaran a tots els moviments dels pistons i a fer que el pistó de potència pugi per crear la pressió màxima, cosa que entregarà la força al sistema.

En el nostre cas les posicions dels pistons en cada etapa quedarien com en la figura de la pàgina següent (figura 18), on el pas 1 correspon al moment de màxima pressió.

![](images/7a0a63202936935622c03d19a06a54a57cb379a612f4db526f2562a2f06aa706.jpg)  
Figura 18: Posicions dels pistons en cada etapa.

# CAPÍTOL 6: MODELITZACIÓ DEL MOTOR STIRLING

## 6.1. Estat previ

Un cop explicats en els anteriors apartats el motor Stirling i el software Dymola, ja només queda centrar-nos en el nostre model concret. L’actual projecte, al tractar-se d’una tercera part, ve d’una primera i una segona part. En aquest apartat s’explica a mode de resum l’estat previ del nostre model, és a dir, el punt base del qual partíem al començar aquest projecte.

Com he dit, s’explica a mode de resum, mentre que en els annexos 1 i 2 es poden consultar enters els dos projectes previs a aquest, el de l’enginyer Albert García Prat (García Prat 2013) i el de l’enginyera Antía Varela Souto (Varela Souto 2014) respectivament.

El total del nostre model es pot dividir en dos sub-models bàsics: el model mecànic i el model termodinàmic. A més a més d’aquests dos, trobem dos models més anomenats "Model Connectors Forces" i "Model Connectors Posicions Temperatura", que podem considerar complementaris al model termodinàmic i que serveixen, respectivament, per poder extreure la potència entregada i per poder controlar les temperatures des d’un model individual extern al mecànic i termodinàmic.

### 6.1.1. Model mecànic

El model mecànic, com es pot deduir, fa referència a la part mecànica del motor, és a dir, descriu tot el sistema mecànic d’aquest i el seu principal objectiu és el de transformar l’energia tèrmica provinent del cicle termodinàmic en energia mecànica que, posteriorment, podrà ser transformada en energia elèctrica.

Com s'ha explicat en l’apartat de descripció del software Dymola, aquest ofereix varies llibreries amb multitud de diferents elements ja creats i que poden ser utilitzats directament o bé modificats i utilitzats segons les necessitats de cada usuari. En el nostre cas, Dymola ofereix un tipus de motor V6 del qual se'n pot aprofitar el model d’un dels pistons i que amb unes petites modificacions es pot adaptar perfectament al nostre model. Aquest motor surt de la llibreria Modelica->Mechanics, més concretament: Modelica-> Mechanics -> MultiBody -> Examples -> Loops -> EngineV6.

Així doncs, el nostre model mecànic consisteix en la unió de dos pistons idèntics extrets del mencionat motor V6 per simular els dos pistons que tenim en el nostre motor Stirling (pistó de potència i desplaçador). A més a més se li afegeix un cigonyal i un cilindre o carcassa. En l’annex 1 estan explicats més detalladament cada un dels components, cada una de les parts que formen aquests components, la interacció entre ells i un anàlisi del funcionament del model mecànic.

En la següent imatge (figura 19) es pot veure l’esquema gràfic del pistó extret del motor V6. De totes les parts especificades l’únic que s'ha de modificar és el gas per ajustar aquest pistó al nostre model. En el cas del pistó de potència s'ha de substituir el model termodinàmic del motor V6 (gas) per el nostre model termodinàmic del motor Stirling, mentre que en el cas del desplaçador només s'ha d’eliminar ja que aquest pistó no rep cap força deguda a la pressió, sinó que només es mou degut als volums que es desplacen d’una zona a l’altre.

D'igual manera en l’annex 1 també s'hi poden consultar les modificacions aplicades al pistó V6 i la creació del model mecànic anomenat ModelMecanic\_Striling.

![](images/376be04ac36c3e3c5eddbff0013226a8e2c9b24e25179d84c0007b3dad0c80ec.jpg)  
Figura 19: Components dels pistons.

Cal recordar que els dos pistons dins el model mecànic incorporen un desfasament de 90ª.

### 6.1.2. Model termodinàmic

El model termodinàmic és l’encarregat de proporcionar la força i les temperatures de treball adequades. A diferencia del model mecànic, en les llibreries de Dymola no existeix cap model igual ni similar al cicle Stirling i és per això que s'ha hagut de modelar completament des de zero.

Dit model termodinàmic es pot separar en dos parts ben diferenciades segons ha sigut modelitzat. En una primera part s'ha fet una modelització del moviment de les masses d’aire en funció dels volums que el moviment del desplaçador genera en cada zona a temperatura constant. I en una segona part s'ha modelat l’escalfament i refredament de les masses d’aire en les respectives zones, en funció dels volums disponibles en cada una d’elles.

**a) Primera part:**

El primer pas es relacionar la posició dels pistons en el model mecànic amb les posicions dels pistons en el model termodinàmic. Això ens permetrà saber els volums disponibles en cada zona i la força resultant per cadascuna de les quatre posicions. Per dur-ho a terme, es crea un nou model anomenat ModelConnector\_Posicions\_Forces, on es relacionarà l’entrada d’aquestes mencionades posicions en el model termodinàmic amb la sortida de la força d’aquest cap al model mecànic.

Un cop aconseguit el primer pas, es crea un nou model anomenat ModelVolums on s'especificaran els moviments dels pistons, els paràmetres constants del motor i com es relacionen entre si els diferents models.

A més a més, també es defineixen unes condicions inicials indispensables que ajudaran a arrancar la simulació del model termodinàmic. Aquestes condicions són:

• Pressió i temperatura inicials del sistema.

• Volums inicials a cada zona que dependran de les posicions relatives inicials dels pistons.

• Número de mols en cada zona i en el total del sistema. S’obtenen a partir de l’equació dels gasos ideals ja que el gas de treball es aire.

Una vegada creat tot l’anterior, es comprova que funciona correctament mitjançant l’anomenat ModelVolums\_Test que segueix el diagrama de la figura 20:

![](images/e9a2cd8409feee494b247efff4e724b66b256b055422eaa068c0ea0a41531601.jpg)  
Figura 20: Diagrama ModelVolums\_Test

Respecte aquesta primera part dins el model termodinàmic, en l’annex 1 es poden consultar més detalladament les creacions i configuracions de tots els models utilitzats, la programació de tots els paràmetres constructius, les condicions inicials, paràmetres del gas ideal, totes les equacions que governen el sistema, l’evolució de les variables, l’especificació de l’equació de la continuitat que descriu el moviment, l’especificació de l’equació de la quantitat de moviment que descriu la força que actua sobre el sistema, etc.

**b) Segona part:**

Com he explicat anteriorment, en aquesta part s’afegeixen en el ModelVolums l’escalfament i el refredament de les masses d’aire en funció de les posicions.

Per dur-ho a terme, es crearà un nou model anomenat ModelTermodinamic\_Striling basat en el ModelVolums afegint els nous paràmetres i variables necessaris. Al afegir l’entrada de les dues temperatures es substitueix el ModelConnectors\_Posicions\_Forces per un nou i definitiu model anomenat ModelConnectors\_Posicions\_Temperatures\_Forces que incorporarà dites noves entrades.

El següent pas consisteix en definir les equacions de descriuran l’escalfament i refredament del sistema, així com l’evolució dels intercanvis energètics de cada zona.

Al igual que en la primer part, es crea un nou model anomenat ModelTermodinamic\_Test (figura 21) que servirà per comprovar el bon funcionament del ModelTermodinamic\_Striling.

Per configurar les temperatures s'ha utilitzat una rampa per la temperatura calenta que surt de la Illibreria Modelica -> Blocks -> Sources -> Ramp i una constant per la temperatura freda que és igual a la temperatura ambient.

Respecte la rampa de la temperatura calenta, començarà a temperatura ambient i anirà augmentant en funció de l’altura especificada (height).

De la mateixa manera que en la primera part, en l’annex 1 es troben especificades més detalladament les creacions i configuracions dels diferents models utilitzats, les equacions de temperatura, les especificacions dels paràmetres i condicions inicials necessàries, etc.

![](images/1cf854a4414a7bfc7ca36197c71a12b643bd86e6d2a99af4f15d6b40f99e66f4.jpg)  
Figura 21: Diagrama ModelTermodinamic\_Test

### 6.1.3. Acoblament

Un cop implementats els dos models bàsics es procedeix a acoblar-los. El model final que ho engloba tot s’anomenarà Model\_Final\_Stirling. En aquest model final s'han de fer un parell de modificacions dins el ModelMecanic\_Stirling. Les modificacions són les següents:

• Eliminar la funció sinusoïdal i en el seu lloc connectar el model creat ModelTermodinamic\_Stirling.

• Afegir un sensor de posició en cada cilindre, cosa que ens donarà la posició relativa del pistó de potència o desplaçador respecte els seus respectius cilindres.

En la següent imatge (figura 22) es pot veure el diagrama final del ModelMecanic\_Striling on es diferencien clarament els dos pistons acoblats entre si (pistó de potència i desplaçador), a més a més de totes les modificacions mencionades anteriorment implementades.

![](images/7bfbb78bba20efdcabde7ad62c443fbbb55c3c8af3cdc4517f7ed2e9768e06d5.jpg)  
Figura 22: Diagrama ModelMecanic\_Stirling

Un cop creat el model mecànic s’afegiran una sèrie de components que tots junts formaran el sistema auxiliar d’arrencada ja que sense dit sistema d’arrencada el model no es posaria en funcionament i per tant permetran portar a terme les simulacions:

• El món (World) que proporciona la gravetat i els eixos de referència del sistema.

• Rodament (Revolute), que permet la rotació del cigonyal

• Un volant d’inèrcia (Inertia) que estabilitza la rotació del Rodament.

• Acceleració (Accelerate), que serà entregada a l’embragatge.

• Rampa (Ramp), activa l’acceleració passats els segons programats des del inici de la simulació per tal de que el sistema tingui temps d’escalfar-se.

• L'embragatge (Clutch) que transmetrà l’acceleració al cigonyal mentre aquesta duri. Inicialment ja està embragat i al finalitzar l’acceleració es desembraga del cigonyal.

• Escaló (Step), és l’encarregat de desembragar l’embragatge del cigonyal.

• Sensor potència (PowerSensor), que mesurarà la potència resultant entre la entregada al cigonyal i un fregament.

• Fregament (Damper), que ofereix un fregament que ens acabarà donant la potència entregada pel motor. S’estipula que el fregament tingui un valor aproximat d’una seixanta per cent respecte la velocitat màxima del cigonyal.

En la figura 23 es pot observar com quedarien acoblats el Model\_Final\_Stirling i el sistema auxiliar d’arrencada amb tots els components explicats en aquest mateix apartat.

Es pot consultar tot lo explicat anteriorment més detalladament en l’annex 1.

![](images/a0ab49c2d9b4abfa336983625cde03057c0887178759a6c86227a32edf49b536.jpg)  
Figura 23: Diagrama Model\_Final\_Stirling

### 6.1.3. Desenvolupament d’un prototip

Un cop obtingut el Model\_Final\_Stirling, es va fer una verificació del model mitjançant multitud de simulacions i finalment es va desenvolupar un prototip. Les simulacions que es van dur a terme van ser: simulacions de temperatura, simulacions d’inèrcia, multitud de simulacions del funcionament del sistema auxiliar d’arrencada i simulacions dels coeficients de transferència de calor.

Un cop realitzades totes les simulacions es coneixien les característiques amb les que havia de contar el model. A partir d’aquí es van decidir dissenyar dos prototips diferents, una màquina de dos blocs i una màquina de quatre blocs.

Entenem per bloc el conjunt del motor (ModelMecanic\_Stirling) format per el pistó de potència i el desplaçador. Quan parlem d’un prototip de dos blocs seria equivalent a acoblar dos motors, mentre que pel prototip de quatre blocs s'haurien d’acoblar quatre motors.

A continuació s’expliquen a mode de resum els dos prototips de dos i quatre blocs. En l’annex 2 es poden consultar més detalladament tant la verificació del model previ amb totes les simulacions pertinents com el disseny i simulació tant del prototip de dos blocs com del prototip de quatre blocs.

**a) Prototip de dos blocs**

Primer es va dissenyar el prototip de dos blocs amb un desfasament de 180º entre ells, es van fer les simulacions pertinents i es van detectar problemes en els focus de temperatura calenta i freda. Seguidament es va decidir eliminar els focus de temperatura de dins el motor i posar-lo en l’àrea d’interacció global.

En la figura 24 es pot veure com va quedar i, com es pot comprovar, hi ha dos motors acoblats (striling i striling1).

![](images/a314d7a08a8cf05db3035c58a0cde5e418ff14acdedd9389a645f444429ea6c0.jpg)  
Figura 24: Diagrama Model\_Final\_Stirling de dos blocs amb temperatures

Es va continuar simulant i finalment es va decidir passar a dissenyar un prototip de quatre blocs ja que el prototip de dos entregava molt poca potència, girava a una velocitat molt lenta i per tant no era portable ni competent a la vida real.

a) Prototip de quatre blocs

El procediment d’acoblament és exactament el mateix que amb el prototip de dos blocs. La diferència és que els quatre blocs han de complir els següents desfasaments:

Bloc 1 (stirling): Pistó de potència 0 deg i Desplaçador 90 deg.

Bloc 2 (stirling1): Pistó de potència 90 deg i Desplaçador 180 deg.

Bloc 3 (striling2): Pistó de potència 180 deg i Desplaçador 270 deg.

Bloc 4 (stirling3): Pistó de potència 270 deg i Desplaçador 360 deg.

En les dues imatges següents (figures 25 i 26) es pot observar com queda el prototip de quatre blocs tant en l’àrea d’interacció com en la simulació 3D que ofereix DYMOLA.

![](images/87491cae93949959902bb5a5d315c378ec7d47e28ff929668d9efe65fb2cdc35.jpg)  
Figura 25: Diagrama Model\_Final\_Stirling de quatre blocs.

![](images/7c33a22a78e6b782c996cd071aea2c211ff8ef257178952d046ec50bcb101f85.jpg)  
Figura 26: Representació 3D de la màquina de quatre blocs.

Com es pot observar em la imatge anterior (figura 26) i com s'ha explicat anteriorment, el pistó de potència i el desplaçador dins de cada bloc estan desfasats 90º, i d’igual manera cada bloc entre ells estan desfasats també 90º.

A continuació es va procedir a simular i, encara que no es va obtenir cap model ni portable ni competent a la vida real, si que es va aconseguir un model amb millores molt significatives respecte a l’estat previ abans de desenvolupar el prototip de quatre blocs. A continuació es presenten els resultats i és des d’aquí on entro jo mateix a millorar encara més aquest model.

Les característiques bàsiques es detallen a continuació. Es tracta d’una màquina de quatre blocs, tarda 30 segons en escalfar-se al arrencar, té una acceleració de 3 segons, un moment d’inèrcia de valor 5 kg·m2, un valor de damper de 4Nms/rad, uns coeficients de transferència de calor de Uc=100 i Uf=1000, una temperatura freda ambient (293,15 K) i una altura de 500 K per arribar a la temperatura calenta.

Es presenten els resultats de la versió més òptima del prototip de quatre blocs i les gràfiques són: velocitat de gir en funció del temps (figura 27), l’evolució de les temperatures freda i calenta en funció del temps (figura 28) i finalment la corba de potència (figura 29).

![](images/f7a55cc93a50e8155b160b04690b867de61b6a9cd05e513c637610abf181342b.jpg)  
Figura 27: Gràfic de la velocitat de gir [rad/s] en funció del temps [s]

Com es pot observar, aconseguim una velocitat de gir final mitjana d’uns 2.8 rad/s.

![](images/ada8dc8cec9702e93b4be2d9ceb6baa2d761f0ac8eefb328a6d65caf753d6ed5.jpg)  
Figura 28: Gràfic de l’evolució de les temperatures freda i calenta [k] en funció del temps [s]

En l’anterior gràfic (figura 28) es pot veure com la temperatura freda oscil·la sobre els 350 K mentre la temperatura calenta oscil·la sobre els 550 k.

![](images/adfd3acc9a69ebf9f42e53b5dd661d4a8a84c92001aa8fe3aaf070615de00c40.jpg)  
Figura 29: Corba característica de potència de la màquina de quatre blocs.

## 6.2. Parametrització i optimització.

Una vegada analitzat, estudiat i entès tot el que van fer els dos anteriors enginyers, l’Albert i l’Antía, procediré a millorar i optimitzar el model.

En el punt on ens trobem, tot la part termodinàmica del motor ja va ser analitzada exhaustivament per l’Antía, a mi el que em queda és millorar la part mecànica del model juntament amb la millora de tot el que es la implementació del conjunt del model en el software Dymola, per així estalviar feina als futurs usuaris que vulguin utilitzar aquest model, optimitzar els processos de simulació i facilitar la interacció entre els diferents submodels dintre del model global.

L’actual projecte es podria dividir en dos parts, una parametrització que servirà per millorar la implementació del model en Dymola, i una optimització que servirà per obtenir les característiques mecàniques més adequades per aquest motor.

### 6.2.1. Parametrització

L'objectiu principal d’aquesta part és modificar i millorar el disseny de tot el model que s'ha anat programant amb Dymola.

El primer punt va ser que ens trobàvem amb un model que simulava i funcionava correctament però estava programat de manera poc eficient. I doncs, una mateix paràmetre o variable que afectava a diferents nivells del model no es propagava a tots els nivells al ser modificada en un punt, sinó que havies d’anar punt per punt a modificar dit paràmetre o variable per tal de que afectés a la totalitat del model. Com es pot deduir, a I'hora de realitzar moltes simulacions, aquesta programació és realment incòmode i fa caure en errors molt fàcilment.

Per un altre costat, parlant del model mecànic, els diferents paràmetres o variables d’aquest no estaven relacionades entre si i per tant, al modificar un recorregut per exemple, la longitud dels pistons o els diàmetres no es modificaven i físicament et podies trobar amb un motor totalment estúpid, sense cap possibilitat de ser funcional. Això és degut a que en primera instància el que es va fer pel model mecànic va ser agafar els diferents valors de les dimensions físiques d’un altre motor que ja se sabia que funcionava correctament i deixar-les fixades. Així doncs, he redissenyat el model mecànic per tal de que tots els paràmetres i variables estiguessin relacionades entre si i, al modificar-ne una, afectés a tot el model mecànic.

**a) Redisseny del model mecànic**

Com he explicat, el model mecànic s'ha hagut de reprogramar de nou. S'ha fet utilitzant els valors ja existents de cada paràmetre/variable que sabíem d’entrada que funcionaven correctament i relacionant-los entre si extraient equacions. S'ha programat de tal manera que tots els paràmetres mecànics variïn en funció del radi de rotació del cigonyal i s'ha fet pels dos pistons, un radi de cigonyal pel pistó de potència i un radi de cigonyal pel desplaçador.

En les següents imatges (figura 30 a 33 ) es pot veure el motor funcionant en els seus quatre passos amb els nous noms de cada paràmetre implementats i en les dues següents taules (taules 6.1. i 6.2., una pel pistó de potència i una altre pel desplaçador) es pot veure la comparativa entre el nom dels anteriors paràmetres, el valor que tenien, el nom dels nous paràmetres i el valor o relació que tenen actualment.

És important comentar que tots els paràmetres que fan referència al pistó de potència porten al final del nom: \_pisto, mentre que els paràmetres que fan referència al desplaçador porten al final del nom: \_desp. Es pot observar tant en les imatges (figures 30 a 33) com en les taules (taules 6.1. i 6.2.).

![](images/1b71de95f085bce87fc984d8e7feb4742629c73f38091ebb4c97719032c9a4d4.jpg)  
Figura 30: Inici reducció pressió del sistema.

![](images/37b6773a345ebaca462c8770483f380ec67330cd285ef839ba6fbdbc1f0d5f6d.jpg)

Figura 31: Refredament màxim de l’aire.  
![](images/99dc33621df9dc399075029c15f3a90baeab86a096c8a82c6fe4de2b56adace5.jpg)  
Figura 32: Inici escalfament del gas.

![](images/e220a2484c51306619d728d4026365ef51be7c31a8aa2355666c62043ab5fd11.jpg)  
Figura 33: Escalfament màxim de l’aire.

Taula 6.1: Pistó de potència
<table><tr><td>Nom inicial</td><td>Valor Inicial [m]</td><td>Nom Actual</td><td>Valor Actual [m]</td></tr><tr><td>crankPinOffset</td><td>=0.1</td><td>crank_pin_offset_pisto</td><td>=0.1</td></tr><tr><td>crankPinLength</td><td>=0.1</td><td>crank_pin_length_pisto</td><td>=crank_pin_offset_pisto</td></tr><tr><td>crankLength</td><td>=0.2</td><td>long_cigonyal_pisto</td><td>=0.2</td></tr><tr><td>pistonLength</td><td>=0.1</td><td>long_cappisto</td><td>=crank_pin_offset_pisto</td></tr><tr><td>rodLength</td><td>=0.2</td><td>long_biela_pisto</td><td>=crank_pin_offset_pisto*2</td></tr><tr><td>cylinderTopPosition</td><td>=0.42</td><td>top_position_pisto</td><td>=long_cappisto + crank_pin_offset_pisto + long_biela_pisto + 0.02</td></tr><tr><td>cylinderLength</td><td>=Idem Actual</td><td>long_pisto</td><td>=Top_position_pisto (long_cappisto +0.02 + long_biela_pisto</td></tr><tr><td></td><td></td><td></td><td>crank_pin_offset_pisto)</td></tr><tr><td>d2</td><td>=0.11</td><td>D_pisto</td><td>=0.11</td></tr></table>

Taula 6.2: Desplaçador
<table><tr><td>Nom inicial</td><td>Valor Inicial [m]</td><td>Nom Actual</td><td>Valor Actual [m]</td></tr><tr><td>crankPinOffset1</td><td>=0.1</td><td>crank_pin_offset_desp</td><td>=0.1</td></tr><tr><td>crankPinLength1</td><td>=0.1</td><td>crank_pin_length_desp</td><td>=crank_pin_offset_desp</td></tr><tr><td>crankLength1</td><td>=0.2</td><td>long_cigonyal_desp</td><td>=0.2</td></tr><tr><td>pistonLength1</td><td>=0.1</td><td>long_capdesp</td><td>=crank_pin_offset_desp</td></tr><tr><td>rodLength1</td><td>=0.2</td><td>long_biela_desp</td><td>=crank_pin_offset_desp*2</td></tr><tr><td>cylinderTopPosition1=0.42</td><td></td><td>top_position_desp</td><td>=long_capdesp + crank_pin_offset_desp + long_biela_desp + 0.02</td></tr><tr><td>cylinderLength1</td><td>=Idem long_desp Actual</td><td></td><td>=Top_position_desp (long_capdesp +</td></tr><tr><td></td><td></td><td></td><td>long_biela_desp crank_pin_offset_desp + 0.02)</td></tr><tr><td>d1</td><td>=0.15</td><td>D_desp</td><td>=0.15</td></tr></table>

**b) Reprogramació del model**

Una vegada redissenyat el model mecànic es procedeix a repgrogramar el model. Lògicament no he reprogramat tot el model enter, simplement he afegit o implementat les noves equacions, paràmetres o variables necessàries per tal de que al modificar un valor afectes a la totalitat del programa, a tots els nivells.

El més important que s'ha fet ha sigut programar perquè tots els paràmetres de les dues taules anteriors arribin a tots els nivells del model a més a més d’algunes altres com per exemple el dc, que és el diàmetre del cilindre.

El model final està dissenyat de tal manera que el ModelTermodinamic\_Stirling es troba dins el ModelMecanic\_Striling, mentre que aquest últim es troba dins el Model\_Final\_Striling. Per tant, el que s'ha fet ha sigut crear els nous paràmetres dins el Model\_Final\_Stirling, un cop aquí s'han d’enviar els paràmetres a tots quatres blocs (striling, striling1, stirling2 i stirling3) per tal de que entrin en el ModelMecanic\_Stirling. Un cop dins aquest últim, s'han d’enviar en el model termodinàmic (gas) per tal de que quedin dintre el ModelTermodinamic\_Stirling que ja és l’últim nivell. Els antics paràmetres que es trobaven dins els models mecànic i termodinàmic no s'han tocat per si algun dia interessa utilitzar per separat algun dels models en un altre projecte. Tot hi així, s'ha programat de tal manera que en la simulació el software no faci cas dels antics paràmetres i només faci cas als nous creats en el Model\_Final\_Stirling.

En les següents imatges (figures 34, 35 i 36) es pot veure primer la creació dels nous paràmetres en el Model\_Final\_Stirling, segon com aquet transmet cap al ModelMecanic\_Stirling (només posaré l’exemple del stirling, però és exactament igual per els altres stirlings1, 2 i 3) i finalment en tercer lloc com es transmeten els paràmetres cap al ModelTermodinamic\_Stirling (només els que afecten al cicle termodinàmic, no totes les dimensions físiques del motor doncs aquestes estan en el model mecànic).

model Model\_Final\_Stirling   
import SI = Modelica.SIunits;   
parameter SI.Length D\_desp=0.15 "Diàmetre del desplaçador";   
parameter SI.Length D\_pisto=0.11 "Diàmetre del pistó de potència";   
parameter SI.Length D cilindre=0.18 "Diàmetre del cilindre";   
parameter SI.Length crank pin offset pisto=0.1   
"offset of crank pin from center axis";   
parameter SI.Length crank\_pin\_length\_pisto=crank\_pin\_offset\_pisto   
"offset of crank pin from center axis";   
parameter SI.Length long\_cigonyal\_pisto=0.2   
"Longitud del cigonyal en la direcció x";   
parameter SI.Length long\_cappisto=crank\_pin\_offset\_pisto   
"Longitud del cap del pistó de potència";   
parameter SI.Length long biela pisto=crank pin offset pisto\*2   
"Longitud de la biela";   
parameter SI.Length top position pisto=long\_cappistotcrank pin\_offset pisto+long\_biela pisto+0.02   
"Longitud desde 1'eix del cigonyal al final del cilindre del pistó de potència";   
parameter SI.Length long cilindre pisto=top position pisto-(long cappisto+long biela pisto+0.02-crank pin offset pisto)   
"Longitud pistó potència";   
parameter SI.Length crank pin\_offset\_desp=0.1   
"Offset of crank pin from center axis";   
parameter SI.Length crank\_pin\_length\_desp=crank\_pin\_offset\_desp   
"Offset of crank pin from center axis";   
parameter SI.Length long\_cigonyal\_desp=0.2   
"Longitud del cigonyal en la direcció x";   
parameter SI.Length long\_capdesp=crank\_pin\_offset\_desp   
"Longitud del cap del desplaçador";   
parameter SI.Length long\_biela\_desp=crank\_pin\_offset\_desp\*2   
"Longitud de la biela";   
parameter SI.Length top\_position\_desp=long\_capdesptcrank\_pin\_offset\_desp+long\_biela\_desp+0.02   
"Longitud desde l'eix del cigonyal al final del cilindre del desplaçador";   
parameter SI.Length long\_cilindre\_desp=top\_position\_desp-(long\_capdesp+long\_biela\_desp+0.02-crank\_pin\_offset\_desp)   
"Longitud desplaçador";  
Figura 34: Creació de paràmetres/variables en el Model\_Final\_Stirling.

Es pot observar que els paràmetres/variables creats coincideixen perfectament amb els de les taules anteriors.

ModelMecanic\_Stirling   
stirling(   
cylinderInclination=0,   
crankAngle0ffset=-1.5707963267949,   
cylinderInclination1=1.5707963267949,   
crankAngle0ffset1=-1.5707963267949,   
Desplacador(diameter=D\_desp),   
Piston\_potencia(diameter=D\_pisto),   
cylinderTopPosition=top\_position\_pisto,   
pistonLength=long\_cappisto,   
rodLength=long\_biela\_pisto,   
crankLength=long\_cigonyal\_pisto,   
crankPinOffset=crank\_pin\_offset\_pisto,   
crankPinLength=crank\_pin\_length\_pisto,   
cylinderTopPosition1=top\_position\_desp,   
pistonLength1=long\_capdesp,   
rodLength1=long\_biela\_desp,   
crankLength1=long\_cigonyal\_desp,   
crankPinOffset1=crank\_pin\_offset\_desp,   
crankPinLength1=crank\_pin\_length\_desp,   
cylinderLength=long\_cilindre\_pisto,   
cylinderLength1=long\_cilindre\_desp,   
dc=D cilindre)   
a ;  
Figura 35: Transmissió de paràmetres/variables del Model\_Final\_Stirling al ModelMecanic\_Stirling pel bloc stirling.

ModelTermodinamic\_Stirling   
gasStirling1(   
P1 (fixed=true),   
nt (fixed=true),   
n1 (fixed=true),   
n2 (fixed=true),   
Uc=100,   
Uf=1000,   
d2=D\_pisto,   
d1=D\_desp,   
1\_d=Desplacador.length,   
dc=D\_cilindre,   
Vm1=0. 002,   
Vm2=0.001)   
a :

Figura 36: Transmissió de paràmetres/variables del ModelMecanic\_Stirling al Model\_Temordinàmic\_Stirling pel bloc stirling.

c) Verificació de la parametrització

Un cop realitzada la parametrització s'ha de comprovar que està ben feta, que el model compila i simula sense problemes i que dóna els mateixos resultats que l’última versió sense parametritzar ja que fins al moment no s'ha realitzat cap canvi de valor.

I, efectivament, veiem que ens donen els mateixos resultats, presentats a continuació:

![](images/82a9ac6f996e7ff2927f9e49d366f2db8053e5139ab07a78aaa1679cbef5ee6b.jpg)  
Figura 37: Gràfic velocitat de gir [rad/s] temps [s] del model parametritzat sens canvis.

![](images/e8e683322824f2bd9df6969bccb0dde4db1cf4c3010086a599db63a88d3e5b56.jpg)  
Figura 38: Gràfic velocitat de gir [rad/s] – temps [s] del model previ sense parametritzar.

On es pot observar que les gràfiques coincideixen perfectament amb l’última versió del model final sense parametritzar. Tenim una velocitat de gir mitjana de 2.8 rad/s i unes temperatura calenta mitjana de 550 K i fred de 350 K. Les petites diferències que s’observen són degudes al temps de simulació.

![](images/c92fba064abf533ae0a3edc5f40d027819dc9a490594808327e10c891928d747.jpg)

![](images/e4a1b643039bf7bf277df759c76ae7e5b63e8a705084948c32748dbe06c82b6f.jpg)  
Figura 39: Gràfic temperatures calenta i freda [k] – temps [s] del model sense parametritzar.

![](images/5821af70aa5d4c475103ef4fe3e9e9f4c03839ccf959b1f74aed60f060b04b8a.jpg)  
Figura 41: Gràfic potència [W] – temps [s] del model parametritzat sense canvis.

### 6.2.2. Optimització

En aquest apartat, un cop parametritzat el model, procedirem a fer diferents simulacions per tal de poder optimitzar els valors dels paràmetres mecànics del motor. Abans de tot però, es faran unes simulacions variant el valor del Damper (és el que ens diu la potència que entrega el motor) per tal de poder modelitzar una corba de potència.

**a) Simulacions Damper**

Havia quedat pendent en l’anterior projecte fer un estudi amb diferents valors de Damper per tal d’obtenir varis punts de velocitat angular i potència entregada promitjos a partir dels quals es podrà determinar una corba característica de potència molt més fiable que la del anterior model sense parametritzar.

Per fer aquesta simulació s'ha utilitzat un script.mos. Aquest script conté la programació adequada per tal d’executar-lo juntament amb el Model\_Final\_Stirling i poder fer un seguit de simulacions per els diferents valors desitjats, a més a més de poder extreure els resultats desitjats tant en format Dymola com en txt. En el nostre cas hem fet 8 simulacions per 8 diferents valors de Damper, des de 0.5 fins a 4.0 passant de 0.5 en 0.5, i ens extreu els resultats de velocitat de gir (revolute.w) i potència entregada (lossPower). En la imatge següent es pot veure el codi de l’script.

```javascript
// Execució de les simulacions
Advanced.StoreProtectedVariables:=true; // per que no es quedi bloquejada la simulació al final
pos=1;
for d in 0.5:0.5:4 loop
tempsFinal=80;
res_f="Simulacio"+"_Damp_"+realString(d,precision=2);
intervals=50*tempsFinal;
simulateExtendedModel(problem="Model_Final_Stirling", stopTime=tempsFinal,
method="dassl",numberOfIntervals=intervals,
initialNames={"damper.d"}
initialValues={d}.
finalNames={"damper.lossPower"}.
resultFile=res_f,autoLoad=false)
mysignals = {"Time", "damper.lossPower", "inertia.w", "damper.d"}:
n=readTrajectorySize(res_f+".mat");
traj=readTrajectory(res_f+".mat",mysignals,n);
writeCSVFileInternal(res_f+".txt",mysignals,transpose(traj),separator="");
closeModel();
pos=pos+1;
end for;
```  
Figura 42: Script per les 8 simulacions Damper.

A continuació es presenten els resultats:

![](images/58db1f251d37f446105479e7864706056421e7642cd6c6e8579827bedc10244b.jpg)  
Figura 43: Potència entregada en el cas Damper=0.5

![](images/f002f15610eea6c6c67aae8eb95667f2bacddee2dd0aeeec79d28d1bc694afc5.jpg)  
Figura 44: Velocitat angular en el cas Damper=0.5

![](images/edf1c20abf975bdcf84830527a1bda9aa7c50e949e1948ce85ce1c7a7332d6b3.jpg)  
Figura 45: Potència entregada en el cas Damper=1.0

![](images/45deba898f9541cf9dd23621b04dd18248c4c1d533ba34b01d479bc43c92a1af.jpg)  
Figura 46: Velocitat angular en el cas Damper=1.0

![](images/a36646b422a1e918a2fd18712455db027d47d9082b80aaeb52820a8e1206f7d6.jpg)  
Figura 47: Potència entregada en el cas Damper=1.5

![](images/86958d42e591c8f4f3b064d2d718b8be4ec44df1ced3017d398d9c71718e788d.jpg)  
Figura 48: Velocitat angular en el cas Damper=1.5

![](images/d1c3fbc2122c776cca196dcfa1ad8e045aa7ffa0c6c6dcfd1889849888a7605d.jpg)  
Figura 49: Potència entregada en el cas Damper=2.0

![](images/d96d372a4c1a87199d4603b00edae9396750ece92d0deac0e60630b2d4ecb9b1.jpg)  
Figura 50: Velocitat angular en el cas Damper=2.0

![](images/0d3abc6e01d75732fb1a093a05d51afff0bfac2daa2640a432bdcbfaa5fd059c.jpg)  
Figura 51: Potència entregada en el cas Damper=2.5

![](images/561772d32b85c2a7b662f00194ee7372fb9c70e5f9caed2a9e333ea7dc0fa319.jpg)  
Figura 52: Velocitat angular en el cas Damper=2.5

![](images/6ac4f7e62bea6e65eb427c1ca03522df39666d600a21ba8abb78c6e7072a1467.jpg)  
Figura 53: Potència entregada en el cas Damper=3.0

![](images/f925ec3ed84e798f34da79aa0f62ae6bd32a48df751a900fe543bab7ae240058.jpg)  
Figura 54: Velocitat angular en el cas Damper=3.0

![](images/ba0ae171e913c5110b02763e2b90bad7612f819f4464d76d747dfe01c386bd52.jpg)  
Figura 55: Potència entregada en el cas Damper=3.5

![](images/66eef7e30c1f02ec52ff20845cb4260c798f8bda3873fddd72e881c6ce7ddf64.jpg)  
Figura 56: Velocitat angular en el cas Damper=3.5

![](images/bde496f19d4fbb4bec67a295afa531ac377d1b8a0131531cf7fa0d5b928fafae.jpg)  
Figura 57: Potència entregada en el cas Damper=4.0

![](images/5597fbd760bd31fd385f722b4285bc3328d6db3f8f0721fb1ebf228cf0a52fdb.jpg)  
Figura 58: Velocitat angular en el cas Damper=4.0

En les anterior gràfiques de potència es pot veure com per cada valor de Damper més alt va augmentant el pic inicial de potència.

Un cop vistes les gràfiques, en la següent taula es presenten els valors mitjos de potència entregada i velocitat angular per cada valor de Damper a partir dels quals podrem obtenir la corba de potència desitjada:

Taula 6.3: Resultats promitjos simulacions Damper
<table><tr><td>Valor Damper</td><td>Potència [W]</td><td>Velocitat Angular [rad/s]</td></tr><tr><td>0.5</td><td>3,439135</td><td>1,9907009</td></tr><tr><td>1.0</td><td>5,1770992</td><td>1,792633</td></tr><tr><td>1.5</td><td>6,402097</td><td>1,555227</td></tr><tr><td>2.0</td><td>7,3680568</td><td>1,439964</td></tr><tr><td>2.5</td><td>8,1774881</td><td>1,352497</td></tr><tr><td>3.0</td><td>8,8779643</td><td>1,2829241</td></tr><tr><td>3.5</td><td>9,5020713</td><td>1,2246026</td></tr><tr><td>4.0</td><td>10,067531</td><td>1,1755342</td></tr></table>

Es pot observar que a més potència entregada més alt és el valor de Damper, al contrari passa amb la velocitat angular que disminueix a mesura que el valor de Damper puja.

També es pot observar que la velocitat angular mitjana no coincideix amb la velocitat angular on s’estabilitza en les gràfiques. Això és degut a que durant els primers trenta segons la velocitat angular es zero i també hi tenim el pic inicial provocat per l’escalfament de la màquina al arrencar. Com que ens afecta a tots els casos igual no es influenciarà a l’hora de fer la corba de potència ja que la idea final serà la mateixa.

Al utilitzar I'scrip mencionat anteriorment per ordenar les simulacions, li diem que ens extregui els resultats en forma de txt. Ens guarda molt intervals i per gestionar la dades, treure les gràfiques i els valors promitjos s'ha utilitzat el sowftware Scilab 5.5.2 que és un programa molt similar al MatLab. Tot hi així també tenim la possibilitat de consultar els resultats en l’arxiu Dymola que crea.

A continuació es presenta la corba característica de potència obtinguda (figura 59):

Corba característica de potència  
![](images/6c3ea710126900ed7796bdb42fd183735e279690dbd5cf934a41331be5a19696.jpg)  
Figura 59: Comparativa corbes característiques de potència

Com es pot comprovar (figura 59) s’obté una corba similar a la de l’última versió del model sense parametritzar. Encara que el nombre total de punts simulats son diferents, els punts en comú coincideixen i tenen la mateixa tendència.

**b) Simulacions diàmetre pistó potència (D\_pisto)**

En aquest apartat hem agafat el paràmetre D\_pisto com a paràmetre principal i hem provat de fer dues simulacions amb un +-20% del valor de D\_pisto que inicialment es de 0,11 m. Per fer-ho també s'ha utilitzat un scrip. Es pot veure a continuació (figura 60)

Advanced.StoreProtectedVariables:=true; // per que no es quedi bloquejada la simulació al final   
pos=1;   
for D\_pisto1 in 0.09:0.04:0.14 loop   
tempsFinal=80;   
res\_f="Simulacio"+"\_D\_pisto\_"+realString(D\_pisto1,precision=2);   
intervals=50\*tempsFinal;   
simulateExtendedModel(problem="finalfinalfinal", stopTime=tempsFinal, method="dassl",numberOfIntervals=intervals.   
initialNames={"D\_pisto"}.   
initialValues={D\_pisto1}.   
finalNames={"D\_pisto1"}.   
resultFile=res\_f,autoLoad=false);   
mysignals = {"Time","damper.lossPower","inertia.w","stirling.gasStirling1.T1", "stirling.gasStirling1.T2"};   
n=readTrajectorySize(res\_f+".mat");   
traj=readTrajectory(res\_f+".mat",mysignals,n);   
writeCSVFileInternai(res\_f+".txt",mysignals,transpose(traj),separator=" ");   
closeModel();   
pos=pos+1;   
end for;  
Figura 60: Codi Scrip simulació +-20% del paràmetre D\_pisto

En la següent taula (taula 6.4) es poden veure els valors promitjos per aquest script. Es pot observar que tant la potència com la velocitat angular mitjanes augmenten amb l’augment del valor de D\_pisto, però molt lleugerament.

Taula 6.4: Resultats promitjos simulacions +-20% D\_pisto
<table><tr><td>Valor D_pisto</td><td>Potència [W]</td><td>Velocitat Angular [rad/s]</td></tr><tr><td>0.09</td><td>10,055715</td><td>1,1750763</td></tr><tr><td>0.11</td><td>10,067531</td><td>1,1755342</td></tr><tr><td>0.13</td><td>10,082087</td><td>1,1761282</td></tr></table>

A continuació es presenten les gràfiques (figures 61 a 64) pels dos casos de 0.09 m i 0.13 m per tal de comparar-les. És difícil apreciar la diferencia.

![](images/04a731eafd75524da28875d11c9f0cd2c08bc6ba0d20e181de282fbb0afd7c6f.jpg)  
Figura 62: Potència entregada en el cas D\_pisto =0.09 m

![](images/8afe5b60df1c2ab5920470591304f1abf01ada6c08614afc09a3514d6fe648d4.jpg)  
Figura 61: Potència entregada en el cas D\_pisto =0.13 m

![](images/0dcb36e88fc0a1321013a863ad63eb11c6966297ce5690307d992699a77f55df.jpg)  
Figura 64: Velocitat angular en el cas D\_pisto =0.09 m

![](images/bf4c6f14131b434f007b6254f2694048c2b231b9237f5b1328a362a87d6cd92a.jpg)  
Figura 63: Velocitat angular en el cas D\_pisto =0.13 m

Amb la intenció de saber sobre cap on evoluciona més favorablement, si amb un D\_pisto més alt o més baix, es passa a analitzar els resultats només a partir del segon 36, desprès d’arrencar i fer el pic inicial, que és quan s'estabilitza. A continuació es poden veure el valors promitjos.

Taula 6.5: Resultats promitjos simulacions +-20% D\_pisto a partir segon 36 de simulació
<table><tr><td>Valor D_pisto</td><td>Potència [W]</td><td>Velocitat Angular [rad/s]</td></tr><tr><td>0.09</td><td>12,484397</td><td>1,7659862</td></tr><tr><td>0.13</td><td>12,485134</td><td>1,7660457</td></tr></table>

Aquets serien els valors promitjos reals que tenim un cop el motor s'ha estabilitzat. Al igual que abans, veiem que per un valor més alt de D\_pisto entrega més potència i gira mes ràpid. Tot hi així, les variacions entre un i altre son molt petites i entrega uns 12,5 W de potència i gira a una velocitat de 1,76 rad/s.

A continuació es presenten les gràfiques (figures 65 a 68) a mode de comparació però al igual que abans és difícil apreciar diferències.

![](images/c61ec8553961b6ac030b3d4ad3be7c8c8b20a1039f22db130b78c0da9ef39efe.jpg)  
Figura 66: Potència entregada en el cas D\_pisto =0.09 m a partir segon 36

![](images/db885b146c302303a8e657b9734ffd819222acced319f16678febf72ff3a49e8.jpg)  
Figura 65: Potència entregada en el cas D\_pisto =0.13 m a partir segon 36

![](images/00acb968637a20fa5a41b67dc6e29aa18b7034148236476430a25de6d23752c0.jpg)  
Figura 68: Velocitat angular en el cas D\_pisto =0.09 m a partir segon 36

![](images/b8ce29c13135ff00c9a27445b096302206f4774a95c9d46c1a4956c8571b7bea.jpg)  
Figura 67: Velocitat angular en el cas D\_pisto =0.13 m a partir segon 36

En aquest apartat doncs arribem a la conclusió que la variació del valor del paràmetre D\_pisto en un 20%, ja sigui per dalt o per baix, no produeix canvis massa significatius en els resultats finals. Si ens haguéssim de quedar amb un, triaríem el D\_pisto ja que ofereix més potència i gira més ràpid, encara que de forma molt limitada.

A continuació es provaran de variar altres paràmetres, i si no dóna resultat més passarem a variar més d’un paràmetre.

**c) Simulacions diàmetre desplaçador D\_desp**

Igual que en l’anterior apartat, es provarà aquesta vegada de variar +-20% el diàmetre del desplaçador. Inicialment té un valor de 0,15 m.

Els següents gràfics (figures 69 i 70) són per un valor de D\_desp = 0,12 m. Entrega una potència mitjana de 10,097818 i una velocitat angular mitjana de 1,1761282 rad/s. Una mica millor que amb 0,15 m.

![](images/ccc9889e74d8507ca2704f4f57bcb15c78c13e6e528fb1aa187f285bd8577ac6.jpg)  
Figura 69: Potència entregada pel cas D\_desp = 0,12 m.

![](images/f99dddb3d211bd708549e4cabca78f1590af6c42e46ebb96e0e365b132d9730f.jpg)  
Figura 70: Velocitat angular pel cas D\_desp = 0,12 m.

Passem a les gràfiques del valor més alt, D\_de $\mathtt { \Gamma } _ { \mathtt { S p } = 0 , 1 7 }$ m. Aquesta vegada es presenten les gràfiques directament des del Dymola (figures 71 i 72).

![](images/801e8b441ce9f485bcc1c0cca714d60fad9ea46f643d46f1c5b5b77584908af8.jpg)  
Figura 71: Potència entregada pel cas $D _ { - } d e s p = 0 , 1 7 m$

Apliquem un zoom per veure quina potència entrega quan s’estabilitza.

![](images/4b0499bd4ca18ef846f47f26db142d1ad70c9a58ed14f6e723245b2432de95e7.jpg)  
Figura 72: Potència entregada estabilitzada pel cas $D _ { - } d e s p = 0 , 1 7$ m

En aquest cas si es nota un millora destacable, s’estabilitza i entrega uns 15 W de mitjana. És una millora significativa ja que en anteriors simulacions s'estabilitzava a 12,5 W aproximadament. Anem a veure com ha sortit la velocitat angular (figures 73 i 74).

![](images/ffdbdc1b2f42cec604fb11f2e1665e33156f372883ffc8f56e3563f1afe62530.jpg)  
Figura 73: Velocitat angular pel cas D\_desp = 0,17 m

Apliquem el zoom aquí també.

![](images/1d0b37378e7346225fd284bb3fd252472d870381000de51fae36be8c1b302f5a.jpg)  
Figura 74: Velocitat angular estabilitzada pel cas D\_desp = 0,17 m

I també resultats positius, la velocitat angular s’estabilitza sobre els 2 rad/s, mentre que en els anteriors casos s’estabilitzava sobre 1,76 rad/s.

Com a conclusió en aquest apartat, s'han trobat millores significatives pel cas de D\_desp = 0,17 m, enfront del 0,15 m o 0,12 m. Aquest serà un dels paràmetres importants a tenir present.

**d) Simulacions radi cigonyal**

En aquest cas trobem dues variables, el crank\_pin\_offset\_pisto i el crank\_pin\_offset\_desp. En aquest apartat s'han agafat com a paràmetres principals. En tots dos casos tenen valor de 0,1 m. S'ha provat de fer dues simulacions per separat variant un dels dos valors dels paràmetres a 0,12 m.

I, tant en l'un com en l’altre, han donat resultats menyspreables o poc significatius. S'estabilitzaven sobre els 12,5 W de potència entregada i sobre 1,76 rad/s de velocitat angular. A continuació a poden veure les gràfiques on és difícil apreciar alguna diferència (figures 75 a 78).

![](images/8aebc73dd47b28c4cdb5e3cc4f93089dbd2368b63a5d3ffff6ddc048cddb3385.jpg)  
Figura 75: Potència entregada pel cas crank\_pin\_offset\_desp = 0,12 m

![](images/2b9f8188d89d91f2f86c87f68f66cfff025e05c67d5ac44f2ada84b10a3fec0b.jpg)  
Figura 76: Potència entregada pel cas crank\_pin\_offset\_pisto = 0,12 m

![](images/eab14ee9822d9a6939a26c6da9fff17c1bf143315b70a390cd1835280a5cb2ad.jpg)  
Figura 77: Velocitat angular pel cas crank\_pin\_offset\_desp = 0,12 m

![](images/c2654347601e945f8a91735d8dbf4af827d7fc7ed2aa352fcc6448897ea92547.jpg)  
Figura 78: Velocitat angular pel cas crank\_pin\_offset\_pisto = 0,12 m

**e) Simulacions segons anteriors paràmetres simulats**

Un cop realitzades totes les simulacions explicades fins al moment i vistos els resultats poc significatius, arribem a la conclusió que modificar un sol paràmetre no té prou efecte sobre els resultats finals i per tant, en aquest apartat es procedirà a provar de simular utilitzant alguns dels resultats obtinguts en les anteriors simulacions.

Per un costat s'ha llençat una simulació amb els següents paràmetres variats, i l’anomenarem simulació múltiples paràmetres cas 1:

\- D\_desp = 0,17 m

\- D\_pisto = 0,13 m

\- crank\_pin\_offset\_desp = 0,12 m

\- crank\_pin\_offset\_pisto = 0,12 m

Anem a veure quins resultats s’han obtingut.

![](images/fd4df2416a4696d1df1febe8267adb2a35e8afd5f999f0f0c211c523eab443a9.jpg)  
Figura 79: Potència entregada simulació múltiples paràmetres cas 1

Apliquem un zoom per veure més concretament a quin valor de potència entregada s’estabilitza.

![](images/de2c49ae61e8033f9df9670bc64fcf7d7e943d7791a67b4359a08810a74bf3bc.jpg)  
Figura 80: Potència entregada estabilitzada simulació múltiples paràmetres cas 1

Com es pot observar en l’anterior imatge (figura 80), la potència entregada s’estabilitza sobre els 20,5 W. Aquest és un resultat molt positiu i un gran avanç ja que en les anteriors simulacions ens entregava una potència estabilitzada al voltant dels 12,5 W i en el millors dels casos 15 W. Hem augmentat aproximadament un 33,3% el valor de potència entregada respecte el millor dels anteriors casos.

![](images/630ce911d03d6ceabd12993a73fce14624d1bf17128c0ba99913653a9e97d67a.jpg)  
Figura 81: Velocitat angular simulació múltiples paràmetres cas 1

Ja d’entrada veiem que la velocitat angular s’estabilitza per sobre els 2 rad/s quan en els anteriors casos teníem una velocitat angular mitjana de 1,76 rad/s. Apliquem també un zoom per veure-ho amb més detall.

![](images/c8462c1b29f66f61063f395abc796b7bb5cb576cf346bd271306b41a42bf2db8.jpg)  
Figura 88: Velocitat angular estabilitzada simulació múltiples paràmetres cas 1

Un cop fet el zoom, és pot observar clarament que la velocitat angular esta estabilitzada sobre els 2,3 rad/s. Hem augmentat un 15 % la velocitat angular respecte el millor dels anteriors resultats que era de 2 rad/s.

Per un altre costat s'ha llençat la següent simulació que l’anomenarem simulació múltiples paràmetres cas 2.

\- D\_desp = 0,17 m

\- D\_pisto = 0,14 m

\- crank\_pin\_offset\_desp = 0,15

\- crank\_pin\_offset\_pisto = 0,14

Els resultats obtinguts en aquesta segona simulació també són positius. Obtenim una millora considerable tant en la potència entregada com en la velocitat de gir. A continuació es presenten les gràfiques tant generals com de la part on s’estabilitzen els paràmetres.

![](images/0d91ef205ec879d0d8ca316c8a0a060993b535f5ff6f082be8c854891770edd7.jpg)  
Figura 89: Potència entregada simulació múltiples paràmetres cas 2

Abans de comentar res, anem a veure el zoom de la zona on s’estabilitza.

![](images/a46f2d4beada362a428e051fabca57c93fa7a51bd09c797e0d2a167c98c3e6f9.jpg)  
Figura 90: Potència entregada estabilitzada simulació múltiples paràmetres cas 2

Com es pot observar en l’anterior imatge (figura 99) la potència entregada s'estabilitza ens els 22,5 W. Això són 2 W més que en l’anterior simulació múltiples paràmetres cas 1, i suposa un augment del 50 % respecte el millor resultat de les simulacions en les que nomes variàvem un paràmetre i que donava una potència entregada estabilitzada de 15 W.

Passem a veure la velocitat angular (figura 91):

![](images/9b88c35a56d987cef433fd20c33220d5afd994925817ac81659a069d4cc9edb7.jpg)  
Figura 91: Velocitat angular simulació múltiples paràmetres cas 2

I com no podia ser d’una altre manera, anem a veure el zoom (figura 92):

![](images/f7dd10e6de6ec79d37ac9b5a02b7fac63d31edfaf5d3b6d4c84985fb25bc325d.jpg)  
Figura 92: Velocitat angular estabilitzada simulació múltiples paràmetres cas 2

S'observa que la velocitat angular s'estabilitza, igual que en la simulació múltiples paràmetres cas 1, sobre els 2,3 rad/s i, al igual que en el cas anterior, suposa un augment del 15% respecte el millor dels resultats on només variàvem un sol paràmetre.

Com a conclusió d’aquest apartat s'ha de dir que em obtingut resultats significatius, que està clar que s'han de variar més d’un paràmetre a la vegada i no només un, i que els valors dels 4 paràmetres agafats com a principals (D\_desp, D\_pist, crank\_pin\_offset\_desp i crank\_pin\_offset\_pisto) tendeixen a donar més bons resultats com més alt el seu valor.

Està clar que aquesta es la línea de treball a seguir i així es farà en futurs estudis.

# CONCLUSIONS

Desprès d’haver realitzat aquest projecte podem treure les conclusions. Fixantnos ens els objectius específics podem dir que els hem complert tots, es detallen a continuació:

S'ha conegut i aprés a utilitzar els software Dymola en tots els seus entorns.

• S'ha comprés perfectament el funcionament tant mecànic com termodinàmic del motor i cicle Stirling.

• S'ha estudiat i analitzat tota la part prèvia a aquest projecte.

• S'ha aconseguit parametritzar tot el model i ara funciona amb un comportament més harmònic, simula correctament i és més fàcil evitar errors.

• S’ha fet un estudi de simulació exhaustiu per arribar als resultats desitjats.

• S'ha arribat a un prototip de motor amb un millor comportament, una velocitat de gir més alta i un augment en la entrega de potència.

Pel que fa a l’objectiu general, que era aconseguir un model de motor funcional, factible, competent i portable al món real, hem de dir que encara no s'ha aconseguit. En tot cas tampoc s'havia aconseguit en els dos projectes previs a aquest ja que és una cosa molt complexa i faran falta alguns projectes més per arribar al objectiu final i poder-lo fer realitat.

Com a valoració personal, m’agradaria comentar que em sento molt satisfet del projecte realitzat, és un tema que he trobat molt interessant i que no creia que ho fos tant, m'ha servit per consolidar antics coneixements en el món de la simulació, la mecànica i la termodinàmica, així com adquirir-ne de nous que segur em seran útils en algun futur pròxim. Trobo que és un tema molt interessant, sobretot el de la simulació, ja que es pot utilitzar en infinitats de camps i està clar que el futur avança cap aquí.

# CAPÍTOL 8: FUTURES MILLORES

Els futurs estudis en aquest projecte han d’anar encarats a seguir millorant i optimitzant el total del model, ja sigui millorant el model termodinàmic com va fer l’Antía en el seu projecte, millorant el model mecànic com s'ha fet en aquest projecte, o bé millorar els dos models conjuntament.

A part, seria de molta importància tard o d’hora la incorporació d’un regenerador.   
És un element clau per el bon rendiment i funcionament d’un motor Stirling.

A llarg termini, utilitzar els paràmetres obtingut tant en el model termodinàmic com en el model mecànic per modelar un prototip de motor que tingues un alt rendiment i s’ajustés més properament a la realitat.

CAPÍTOL 9:

# BIBLIOGRAFIA

## 8.1. Referències bibliogràfiques

García Prat, Albert. Sistema autònom de generació elèctrica basat en motor Stirling. EUETIB, Universitat Politècnica de Catalunya, 2013.

Varela Souto, Antía. Estudio y modelización de un motor Stirling. EUETIB, Universitat Politècnica de Catalunya, 2014.

## 8.2. Bibliografia complementària

Dassault Systemes. Dynamic Modeling Laboratory. http://www.3ds.com/products-services/catia/products/dymola/(consultat19 de febrer 2015)

Modelon. DYMOLA. http://www.modelon.com/products/dymola/ (consultat 19 de febrer 2015)

Dymola. Getting started with Dymola. http://www.3ds.com/fileadmin/PRODUCTS/CATIA/DYMOLA/PDF/Getting-Started.pdf (consultat 19 de febrer 2015)

Dymola. Tutorial for Beginners. http://www.cds.caltech.edu/archive/help/uploads/wiki/files/12/Lecture1.pdf (consultat 19 de febrer 2015)

Física, estadística y termodinámica. http://www.sc.ehu.es/sbweb/fisica\_/estadistica/termodinamica/stirling/stirlin g.html (consultat 5 març 2015)

Wikipedia. Motor Stirling. http://es.wikipedia.org/wiki/Motor\_Stirling (consultat 5 març 2015)

Tipo de Motores Stirling. http://personales.able.es/jgros/tipos.htm (consultat 5 març 2015)

Universidad de Sevilla. Ciclo Stirling. http://laplace.us.es/wiki/index.php/Ciclo\_de\_Stirling (consultat 5 març 2015)

Principio Stirling. http://www.ecotec2000.de/espanol/stir2.htm (consultat 5 març 2015)

TREBALL DE FI DE GRAU

![](images/77ee332e92bc2c313c51a78eff8b13c5e24e1b340145e1955ce30e471de49936.jpg)

Barcelona, 05 de Maig de 2015

# ÍNDEX GENERAL

# ÍNDEX DE LA MEMÓRIA

Resum   
Resumen   
Abstract..   
Agraïments..   
Glosari...   
Índex de la memória   
Índex de figures   
Índex de taules   
CAPÍTOL 1: Prefaci.   
1.1. Origen del projecte   
1.2. Motivació   
CAPÍTOL 2: Objectius del projecte   
2.1. Objectiu general   
2.2. Objectius específics   
CAPÍTOL 3: Introducció   
CAPÍTOL 4: Dymola..   
4.1. Modelització   
4.1.1. Menú superior   
4.1.2. Menú disseny.   
4.1.3. Àrees de treball   
4.1.4. Navegador de Paquets (Package Browser) .   
4.1.5. Navegador de Components (Component Browser)   
4.2. Simulació.   
4.2.1. Menú simulació (Simulation   
4.2.2. Menú Gràfics (Plot   
4.2.3. Menú Animació (Animation   
4.2.4. Navegador de Variables (Variable Browser)   
4.2.5. Avançat (Advanced   
4.2.6. Comandes (Commands)   
CAPÍTOL 5: Motor stirling   
5.1. Descripció.   
5.1.1. Descripció general   
5.1.2. Avantatges.   
5.1.3. Inconvenients   
5.2.Configuracions...   
5.2.1. Configuració Alpha   
5.2.2. Configuració Beta .   
5.2.3. Configuració Gamma   
5.2. Cicle Stirling..   
5.3.Funcionament..   
CAPÍTOL 6: Modelització del motor stirling   
6.1. Estat previ ..   
6.1.1. Model mecànic..   
6.1.2. Model termodinàmic   
6.1.3. Acoblament .   
6.1.3. Desenvolupament d’un prototip   
6.2. Parametrització i optimització.   
6.2.1. Parametrització.   
6.2.2. Optimització ..   
CAPÍTOL 7: Conclusions   
CAPÍTOL 8: Futures millores   
CAPÍTOL 9: Bibliografia..   
8.1. Referències bibliogràfiques   
8.2. Bibliografia complementària

# ÍNDEX DEL PRESSUPOST

Índex del pressupost..   
CAPÍTOL 1: Pressupost del projecte..   
CAPÍTOL 2: Bibliografia...   
2.1. Bibliografia de consulta..

# ÍNDEX ANNEXOS

Índex annexos....   
CAPÍTOL 1: Annex 1. Resum projecte Albert Garcia.   
1.1. Annex 1.1. Model mecànic   
1.2. Annex 1.2. Model Termodinàmic ...   
CAPÍTOL 2: Annex 2. Resum projecte Antía Varela .   
2.1. Annex 2.1. Verificació...   
2.2. Annex 2.2. Desenvolupament d'un prototip ..

![](images/4e26c5864c6b31a71971a4f4243cda15434922269c3d3d506c52f0e158c58b03.jpg)

Barcelona, 05 de Maig de 2015

# ÍNDEX DEL PRESSUPOST

Índex del pressupost... ..107   
CAPíTOL 1: Pressupost del projecte.. ..108   
CAPÍTOL 2: Bibliografia... ... 110   
1.1.Bibliografia de consulta .. ...110

# CAPÍTOL 1: PRESSUPOST DEL PROJECTE

A continuació es presenta el pressupost. Hi ha dos tipus de costos, els de personal d’enginyeria i els de recursos informàtics. Els recursos informàtics estan valorats en els temps que s'ha tardat a realitzar aquest projecte, que són 8 mesos.

Taula 1: Pressupost del projecte
<table><tr><td>Descripció</td><td>Hores / Unitats</td><td>Preu per hora/unitat</td><td>Preu TOTAL</td></tr><tr><td>Costos personal d’enginyeria</td><td></td><td></td><td></td></tr><tr><td>Iniciació i estudi projectes previs</td><td>80,00 h</td><td>24 €/h</td><td>1.920,00 €</td></tr><tr><td>Iniciació i estudi software DYMOLA</td><td>100,00 h</td><td>24 €/h</td><td>2.400,00 €</td></tr><tr><td>Parametrització i Optimització</td><td>180,00 h</td><td>24 €/h</td><td>4.320,00 €</td></tr><tr><td>Elaboració documentació</td><td>150,00 h</td><td>24 €/h</td><td>3.600,00 €</td></tr><tr><td>Costos recursos informàtics</td><td></td><td></td><td></td></tr><tr><td>Màquina PC186</td><td>0,1 u.</td><td>1.500,00 €/u.</td><td>150,00 €</td></tr><tr><td>Llicència DYMOLA</td><td>0,66 u.</td><td>800,00 €/u.</td><td>533,33 €</td></tr><tr><td>Llicència C++ Visual 2010</td><td>0,1 u.</td><td>400,00 €/u.</td><td>40,00 €</td></tr><tr><td>Llicència AutoCAD 2010</td><td>0,15 u.</td><td>2.800 €/u.</td><td>420,00 €</td></tr><tr><td>Connexió Internet Fibra Òptica</td><td>8 mesos</td><td>65,75 €/mes</td><td>520,00 €</td></tr><tr><td>Ordinador portàtil Acer ASPIRE 5750G</td><td>0,1 u.</td><td>820,00 €/u.</td><td>82,00 €</td></tr></table>

<table><tr><td>Total brut</td><td>13.985,33 €</td></tr><tr><td>I.V.A. 21%</td><td>2.936,92 €</td></tr><tr><td>Total Projecte</td><td>16.922,25 €</td></tr></table>

El cost brut del projecte puja a tretze mil nou-cents vuitanta cinc amb trenta tres cèntims (13.985,33 €), mentre que un cop aplicat el 21% d’I.V.A ens queda un pressupost total del projecte de setze mil nou-cents vint i dos amb vint i cinc cèntims (16.922,25 €).

Barcelona, Maig de 2015

Autor del projecte:

Nil Juvanteny Planagumà

# CAPÍTOL 2: BIBLIOGRAFIA

## 1.3. Bibliografia de consulta

Llicència AutoCad 2010. http://e-cadstore.es/epages/ea9524.sf/es\_ES/?ViewAction=View&ObjectID =1161325&PageSize=30&OrderBy=NameOrAlias&OrderDesc=0(consultat 8 Abril 2015).

Llicència C++ Visual 2010. http://www.abox.es/productos.asp?pid=66 (consultat 8 Abril 2015).

# TREBALL DE FI DE GRAU

![](images/b6508e67c2d0d33b7493eefa9051b84639d8ec083c4c6504cdfc9696a1309b3f.jpg)

Barcelona, 05 de Maig de 2015

# ÍNDEX GENERAL

# ÍNDEX DE LA MEMÓRIA

Resum   
Resumen   
Abstract..   
Agraïments..   
Glosari...   
Índex de la memória   
Índex de figures   
Índex de taules   
CAPÍTOL 1: Prefaci..   
1.1. Origen del projecte   
1.2. Motivació   
CAPÍTOL 2: Objectius del projecte   
2.1. Objectiu general   
2.2. Objectius específics   
CAPÍTOL 3: Introducció   
CAPÍTOL 4: Dymola..   
4.1. Modelització   
4.1.1. Menú superior   
4.1.2. Menú disseny.   
4.1.3. Àrees de treball   
4.1.4. Navegador de Paquets (Package Browser) .   
4.1.5. Navegador de Components (Component Browser)   
4.2. Simulació.   
4.2.1. Menú simulació (Simulation   
4.2.2. Menú Gràfics (Plot   
4.2.3. Menú Animació (Animation   
4.2.4. Navegador de Variables (Variable Browser)   
4.2.5. Avançat (Advanced   
4.2.6. Comandes (Commands)   
CAPÍTOL 5: Motor stirling   
5.1. Descripció.   
5.1.1. Descripció general   
5.1.2. Avantatges.   
5.1.3. Inconvenients   
5.2.Configuracions...   
5.2.1. Configuració Alpha   
5.2.2. Configuració Beta .   
5.2.3. Configuració Gamma   
5.2. Cicle Stirling..   
5.3.Funcionament..   
CAPÍTOL 6: Modelització del motor stirling.   
6.1. Estat previ ..   
6.1.1. Model mecànic..   
6.1.2. Model termodinàmic   
6.1.3. Acoblament .   
6.1.3. Desenvolupament d’un prototip   
6.2. Parametrització i optimització.   
6.2.1. Parametrització.   
6.2.2. Optimització ..   
CAPÍTOL 7: Conclusions   
CAPÍTOL 8: Futures millores   
CAPÍTOL 9: Bibliografia..   
8.1. Referències bibliogràfiques   
8.2. Bibliografia complementària

# ÍNDEX DEL PRESSUPOST

Índex del pressupost..   
CAPÍTOL 1: Pressupost del projecte.   
CAPÍTOL 2: Bibliografia...   
2.1. Bibliografia de consulta..

# ÍNDEX ANNEXOS

Índex annexos....   
CAPÍTOL 1: Annex 1. Resum projecte Albert Garcia.   
1.1. Annex 1.1. Model mecànic   
1.2. Annex 1.2. Model Termodinàmic ...   
CAPÍTOL 2: Annex 2. Resum projecte Antía Varela .   
2.1. Annex 2.1. Verificació...   
2.2. Annex 2.2. Desenvolupament d’un prototip ..

Annexos

![](images/1bad45e986d72282016d972fd4930a60403dd3898497f415d7d5e8755df22295.jpg)

Barcelona, 05 de Maig de 2015

# ÍNDEX ANNEXOS

Índex annexos... ..3   
CAPÍTOL 1: Annex 1. Resum projecte Albert Garcia... 116   
1.1. Annex 1.1. Model mecànic.... ...16   
1.2. Annex 1.2. Model Termodinàmic .. ..128   
CAPÍTOL 2: Annex 2. Resum projecte Antía Varela . .155   
2.1.Annex 2.1. Verificació... ...155   
2.2. Annex 2.2. Desenvolupament d'un prototip... ..177

# CAPÍTOL 1: ANNEX 1. RESUM PROJECTE ALBERT GARCIA

## 1.4. Annex 1.1. Model mecànic

## 3.4. Models.

Ara que j a hem entès com funciona el motor i que coneixem el programa, podem passar al disseny o implementació d’aquest en Dymola. Per tal de simplificar tant la creació com l’explicació del sistema, hem dividit aquest en dos models o subsistemes m és senzills anomenats: model mecànic i model termodinàmic.

### 3.4.1. Model Mecànic.

Model Mecànic.

Com el seu nom indica és el model que s'encarrega de descriure la part mecànica del sistema. Per al modelatge d’aquest sistema no s'ha creat cap nou component ni model, sinó que s'han reutilitzat models i components de Ilibreries existents de Dymola (exactament les de Modelica-> Mechanics).

La funció del model mecànic és la de transformar l’energia tèrmica, en energia mecànica de la qual posteriorment en farem energia elèctrica.

El model mecànic, està principalment format per quatre components: El pistó de com pressió, el pistó d'expansió o desplaçador, el cigonyal i el cilindre o carcassa.

• Pistó de compressió.

És l'element encarregat de rebre la pressió interior del cilindre, que es tradueix en una força sobre el pistó, i que provoca el moviment de tot el sistema. Es t roba situat en la part freda del motor. Els elements que el com posen són els següents:

![](images/91c300ba3df52a703fca63e702cb83b5a72e7b86f63d1482c5a11797487990ed.jpg)  
Il-lustració 11 Acoblament d’un pistó.

b) Biela: Element que uneix el cap del pistó am b el colze de cigonyal o manivela i que traspassa el moviment lineal del cap al cigonyal, per tant t robarem que aquest element ha de ser capaç de suportar esforços de compressió i flexió. Un factor important a I’hora de dissenyar la biela és que la longitud d’aquesta, ha de ser dos cops el diàmetre de gir descrit per la manivela.

![](images/5b3c71547b8dc517ebbbc83b1a42544ea91354c21f54ba7f94cb4b0d93a34d88.jpg)  
II-lustració 13 Biela.

c) Rodaments: Elements d'unió que redueix la fricció entre un eix i la peça connectada a ell per mitjà d'una rodadora. Serveix de suport i facilita el desplaçament d’un envers de l’alt re. Els t robem entre buló - biela i entre biela - cigonyal.

![](images/ffd4487d96472bb27db62cc9b40450a94b120adbe096fd74cc118993d1dd9bb9.jpg)  
Il-lustració 14 Vista seccionada d’un rodament.

**• Pistó d'expansió o desplaçador.**

Element del model mecànic que s'encarrega de desplaçar l’aire de una zona a l’alt re. Com que el pistó de com pressió dona un moviment al cigonyal, aquest el transmet anàlogament al desplaçador. Aquest moviment tindrà el mateix període que el de compressió però desfasat 90º tal i com les especificacions d’un motor beta ens indica.

Els com ponents que formen el desplaçador són els mateixos que el del pistó de potència.

**• Cigonyal**

Part del motor que connecta als dos pistons. Rep la força d’explosió del pistó de com pressió i el transforma en moviment rotatiu. Aquest moviment rotatiu es transfereix com a moviment lineal al desplaçador quedant Illigades així les posicions d’un pistó en funció de l’altre.

![](images/5df09ba9e1d92fa2a658d99230d9100323e9f761089a6ac765e5c2106763d2c8.jpg)  
Il-lustració 15 Cigonyal del motor Stirling.

**• Cilindre.**

Definim com a cilindre, la carcassa o element protector del motor que s'encarregarà de protegir- lo dels afers exteriors, de acabar de definir la geometria del motor i de transferir les calors de l’exterior al gas del interior.

Un cop identificades les diferents parts del motor podem entendre I' interacció del conjunt.

![](images/36962e3e97691a7879fd0e29e099ad194285768fab4ff48f28dc9197d671337f.jpg)  
Il-lustració 16 Vista en planta de la configuració mecànica.

![](images/5399fafebfd80aab6fe7866e03c4b131fea6cfaa235a0e373df97a601404ef3d.jpg)  
Il-lustració 17 Vista de perfil de la configuració mecànica.

Anàlisis del funcionament del model mecànic:

La força exercida per la pressió provoca un moviment lineal del cap del pistó de com pressió, des de un punt inferior (PMI) a un superior (PMS) que es tradueix en el cigonyal com un moviment circular

![](images/6c518d1860eb5c558fb11edd12d7e65a765759f2afcbe82d9a79c5fb86b618e2.jpg)  
Il-lustració 18 Descripció del moviment del pistó de potència del motor Stirling

El cap del pistó rep la força que és:

$$
F = P 2 ^ { * } A 2
$$

On:

P2= Pressió en la zona del pistó.

A2= Area pistó com pressió.

Fent un anàlisis de les forces que actuen veiem que podem descriure la força que actua en el cap del pistó de com pressió, com el producte de aquesta mateixa força per I' angle entre l’eix longitudinal del cap del pistó de com pressió i la seva biela:

![](images/faa40ed1d0676ef217533de32da0ebc79170cdc1a5a55f9ed93c74dee58f0ba9.jpg)  
Il-lustració 19 Detall de les seccions d’anàlisis.

Aplicant el trigonometria t robem que podem descriure l’eix longitudinal del cap del pistó en funció de la longitud de la biela i del cigonyal:

$$
X = \sqrt { l ^ { \mathrm { A } } 2 - B ^ { \mathrm { A } } 2 ^ { \mathrm { ~ + ~ } } 5 e n ^ { \mathrm { ~ A } } 2 \bar { \theta } }
$$

$$
x = l ^ { 2 } - \infty , 0 \in \mathbb { C }
$$

Finalment sabent que el parell entregat a l’eix, és el producte de la força que aquest rep per la distància, trobem que el parell entregat al cigonyal és:

$$
T = P 2 ^ { * } A 2 ^ { * } \frac { B } { \sqrt { l ^ { \sim } 2 - B ^ { \sim } 2 ^ { * } s e n ^ { \sim } 2 \theta } } { * ( \frac { B ^ { * } s e n ^ { \sim } 2 \theta } { 2 } + s e n \theta ^ { * } \sqrt { l ^ { \sim } 2 - B ^ { \sim } 2 ^ { * } s e n ^ { \sim } 2 \theta } ) }
$$

Fixant, per geometria del cilindre i dels pistons, un Pms i Pm i. Juntament amb la fórmula anterior podríem descriure la nova posició del pistó de com pressió en funció de la força que actua i la nova posició del desplaçador en funció de la posició del pistó de com pressió.

aquest model ja que no rep cap força deguda a la pressió, sinó que nom és ens m ou els volum s d’una zona a l’alt re (el moviment dels volum s provocat pel desplaçador ho definirem dins del model termodinàmic que descriurem en la secció 3.4.2. ).

Agafem el model de l’actual gas que porta el pistó V6 i el copiem en un nou Model que anomenarem ModelConnectors\_Forces. On esborrarem tot el codi actual i introduirem una nova entrada, (Modelica-> Blocks-> Interfaces-> Real Input), que serà la força que el cicle Stirling ens proporcionarà i que igualarem a la força que aquest gas entrega. Ho fem així per tal d’aprofitar els connectors del model gas que ja estan programats per enllaçar- se am b els dem és com ponents del model mecànic.

```matlab
model ModelConnectors Forces
import SI = Modelica.SIunits;
extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
Modelica.Blocks.Interfaces.RealInput f_mt
a ;
equation
f = f_mt;
a ;
end ModelConnectors_Forces;
```  
Il-lustració 21 Codi del Model\_Connectors\_Forces.

On:

f\_ m t = Força d’entrada al model mecànic entregada per el model termodinàmic.

f = Força resultant en el pistó de potència en el model mecànic.

Un cop tenim el ModelConnectors\_Forces, podem anar a crear el ModelMecanic\_Stirling. On copiem dos pistons V6, a l'àrea d'interacció del nou model, i realitzem les modificacions ja esmentades. Substituir el model del gas actual en el pistó de potència per el ModelConnectors\_Forces creat i eliminar el model gas en el desplaçador.. On de moment, per tal de poder fer una simulació i com provar que el nou sistema mecànic es m ou, equiparem la entrada de la força, que ens entregarà el model termodinàmic Stirling, a l’entrada d'una força sinusoïdal. Això s'aconsegueix connectant una funció sinusoïdal (Modelica-> Blocks-> Sources-> Sine) a l’entrada que hem creat. Quedant el ModelMecanic\_Stirling (provisional) de la següent manera.

![](images/fc413ca97e341414e2500ada203cb9a86bec55829e9e06b4d78f6f30282b93e4.jpg)  
Il-lustració 22 Vista de l’àrea d’interacció del Model\_Mecànic provisional.

Un petit canvi que també cal fer es moure l’orientació dels pistons a l’orientació desitjada (90º de desfasament entre un pistó i l’altre). Això s'aconsegueix canviant el valor del paràmetre de I' inclinació del cilindre del desplaçador a 90º respecte l’orientació del pistó de potència elegida. Podem realitzar aquet canvi anant al codi del ModelMecanic\_Stirling. Ajustem el valor de Cylinder Inclinat ion a l’angle desitjat i desprès ajustem Cylinder Inclination1 al angle de CylinderInclination+ 90º.

![](images/d7afa29982d3b76c0b71c9aefffa1868e98b60e04838ab87584b689addaf066d.jpg)  
Il-lustració 23 Codi del Model\_Mecànic provisional.

Un cop tenim el ModelMecanic\_Stirling podem testejar- lo per com provar el seu funcionament. Creem un nou ModelMecanic\_Test i incorporem el model mecànic acabat de crear, el món ( Modelica-> Mechanics-> MultiBody-> World), un rodament (Modelica-> Mechanics-> MultiBody-> Joints-> Revolute) i un volant d'inèrcia al cigonyal (Modelica-> Mechanics-> Rotational-> Com ponents-> Inertia). El món ens donarà la gravetat i els eixos de referència del sistema, que coordinaran el moviment, i el rodament permetrà la rotació del cigonyal on el volant d' inèrcia estabilitzarà la rotació d’aquest.

Ho connectem de la següent manera:

![](images/d32ea4f29e0a9288015346912cb2715c9d133a2a9d28f04aaa6b7ed8788f45c2.jpg)  
Il-lustració 24 Area d’interacció del ModelMecànic\_Test.

Quan simulem el model mecànic podem com provar visualment tant per animació com per gràfics que els pistons es m ouen, per l’acció d’una força sinusoïdal (li donem una amplitud de dotze mil i una freqüència de trenta herzs), am b un desfasam ent de 90o entre ells. Les variables que ens permeten veure aquest moviment gràficament són " s", dins de Cilindre\_pistó\_potencia, i " s" , dins de Cilindre\_Desplaçador, que corresponent a la posició relativa del pistó de potència i del desplaçador respectivament. Entenen per posició relativa la llargada del volum disponible següent aquest la diferència entre el volum del cilindre i el volum del pistó en moviment de la mateixa zona.

**Obtindríem els següents resultats:**

![](images/93559b942f16cfc5f602a0db547b943f4964726eb0c6f25e5820688cf6e03f57.jpg)

Il-lustració 27 Gràfica de les posicions relatives dels pistons.  
![](images/548da6f09a87a16996d99b4fa6ef3b22cf12868bf3d733b7e4235f22769ea38e.jpg)  
Il-lustració 28 Força exercida sobre el pistó de potència.

![](images/24917616fc6908afbc288386efcfad7f4fa3a9b6d2b34aa7bc4ef6c5b249c35f.jpg)  
Il-lustració 29 Animació 3D del model mecànic.

## 1.5. Annex 1.2. Model Termodinàmic

### 3.4.2. Model Termodinàmic.

El model termodinàmic és la part m és important del motor ja que és la que ens donarà la força així com les temperatures de treball. Aquesta part s'ha modelat des de zero, ja que Dymola no disposa de cap model que s'assimili al cicle Stirling am b el qual treballa el gas.

Per a I' implementació d’aquest model s'han diferenciat dues parts. La prim era on nom és modelem un moviment de m asses, en funció dels volum s que el moviment del desplaçador ens atorgarà a cada zona, a temperatura constant . I una segona on modelarem l’escalfament i el refredament, de les m asses de les respectives zones, en funció dels volum s disponibles en cada una d’elles.

**• Primera part, moviment masses:**

Partint de la construcció del model mecànic anterior sabem que necessitarem relacionar les posicions dels pistons que aquest té am b les posicions dels pistons en el model tèrmic que ens donarà els volum s disponibles en cada zona iens retornarà una força resultant. Per tant necessitarem un primer model que anomenarem ModelConnector\_Posicions\_Forces que ens relacioni l’entrada de aquestes posicions al model termodinàmic i la sortida de la força d’aquest model cap al mecànic.

![](images/f29e122d96fe7c455e0127238eefc98c001a7571d7ecaa6706a08a3a780d1830.jpg)  
Il-lustració 30 Codi del ModelConnectors\_Posicions\_Forces.

On:

u = Entrada posició relativa del pistó de potència

u1 = Entrada posició relativa desplaçador.

fo = Sortida força entregada per el model termodinàmic.

Un cop tenim relacionades les entrades i sortides del model passem a modelar el moviment dels volum s creant un nou model anomenat ModelVolum s. Observant les gràfiques resultants de l’estudi del model mecànic veiem que aquestes posicions descriuen un moviment sinusoïdal desfasat 90º entre un i l’altre, on el desplaçador es troba a la seva posició màxim a i el pistó de potència a la meitat de la seva posició màxim a. Com que de moment estudiem els models per separat ajustarem l’entrada d’aquestes posicions com una constant, multiplicada pel tem ps, que transformarem en una sinusoide i a una de les dos la desfasarem 90º (pi mitjos) respecte de l’altre.

Quedant descrit aquest moviments de la següent manera:

//Entrada de les posicions.   
sd = (1+sin(u1\*time+3.1514/2))/10;   
sp = (1+sin(u\*time))/10;  
Il-lustració 31 Codi entrada de posicions del ModelVolums.

Se li suma 1 al valor del sinusoide per tal de fer-la tota positiva i es divideix el valor de les dues entrades per 10 per ajustar la magnitud del valor a un valor més real. Conseqüentment, un cop sabem com es descriuen aquestes posicions relatives i observant la geometria inicial del model mecànic, podrem saber quins paràmetres constants tenim i com es relacionen aquestes entre un model i l’altre.

![](images/881adea1e86ab61194f3b3e9fd078e597e2523d85a0b4ff9ef44e238f3296706.jpg)  
Il-lustració 32 Esquem a de la configuració del model.

Així podrem marcar també unes condicions inicials que ajudin a iniciar la simulació del model termodinàmic i a identificar si aquest s'està ajustant-se correctament o no a la funció desitjada que ha de desenvolupar. Aquestes condicions inicials són la pressió i temperatura inicial del sistema que serà igual en tot ell. Els volum s inicials en cada zona, que depenen de les posicions relatives inicials que coneixem ja que les hem m arcat el model mecànic, la suma dels quals ens donarà el volum total del sistema. I el nombre de m ols en cada zona, així com en el total del sistema, que podem treure a partir de l’equació dels gasos ideals ja que el gas de treball és aire. També caldrà incloure òbviament certs paràmetres d’aquest gas ideal.

**A partir de l'imatge anterior podem definir: Paràmetres geomètrics:**

```proto
model ModelVolums Only
extends ModelConnectors Posicions Forces;
//Sub model que intercanvia 1'entreda de les posicions i la sortida de la força"
import SI = Modelica.SIunits;
//Parametres de valor constants en l'estudi del sistema.
parameter .Real d1 "Diametre del desplaçador";
parameter .Real 1_d "Longitud del desplaçador";
parameter .Real d2 "Diametre del pistó de potència";
parameter .Real dc "Diametre del cilindre";
constant .Real pi=3.141592 "Constant número pi";
parameter .Real A1=pi*d1^2/4 "Area superior desplaçador";
parameter .Real A2=pi*d2^2/4 "Area superior pistó de potència";
parameter .Real V l=A an*l d "Volum en el lateral del cilindre";
parameter SI.Volume VT=V1o+V2o+V_1 "Volum total del sistema";
parameter .Real A_an=pi*(dc^2-d1^2)/4
"Area anul-lar disponible entre la zona 1 i el cilindre";
parameter .Real Vm1 "Volum mort en el del desplaçador";
parameter .Real Vm2 "Volum mort en el pistó de potència";
```

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

Per acabar de identificar la resta de variables, no constants i que intervenen en l’estudi analitzem les diferents zones del sistema o volum s de control.

![](images/1eeb355dc0c9cca094c8891e7f02637e6dee92be463a0a9fc60bf97af09125e2.jpg)  
Il-lustració 33 Esquema de la zona calenta.

![](images/474489ebecf72cee26580270f2856e04cd6d69c359186066a282460446d9e54b.jpg)  
Il-lustració 34 Esquem a de la zona lateral.

![](images/d6648bd7e05dcd8906d333e80dfae065cd1b19fcb4b1987b3aa8776b7c2d8e44.jpg)  
Il-lustració 35 Esquem a de la zona freda.

.Real nt(start=nt o) "Nombre total de mols en el sistema";   
.Real V1 "Volum en el desplaçador";   
.Real V2 "Volum en el pistó de potència";   
.Real P1(start=Po) "Pressio en el desplaçador";   
.Real P2(start=Po) "Pressio en el pistó de potència";   
.Real n2(start=n2\_o) "Nombre de mols en el pistó de potència";   
.Real n1(start=n1\_o) "Nombre de mols en el desplaçador";   
.Real n\_1(start=nt\_o-n1\_o-n2\_o) "Nombre de mols en el lateral";   
.Real m2 "Massa en el pistó de potència";   
.Real m\_1 "Massa en el lateral";   
.Real m1 " Massa en el desplaçador";   
.Real mt "Massa total del sistema";   
.Real T1(start=To) "Temperatura del gas (aire) en el desplaçador";   
.Real T2(start=To) "Temperatura del gas (aire) en el pistó de potència";   
.Real T\_l(start=To) "Temperatura del gas (aire)en el lateral del sistema";   
.Real sp "Posició relativa del pistó de potència";   
.Real sd "Posició relativa del desplaçador";   
.Real ro1 "Densitat relativa del gas (aire) en la zona 1 o desplaçador";   
.Real ro2   
"Densitat relativa del gas (aire) en la zona 2 o pistó de potència";   
.Real A\_1 "Area lateral disponible en el cilindre";   
.Real P\_1 "Pressio en el latreal del sistema";   
.Real c "Velocitat dels pistons";   
.Real mp2 "Massa que rep 1'intercanvi energètic en la zona 2";   
.Real mp1 "Massa querep 1'intercanvi energètic en la zona 1";   
.Real Rp "Constant gassos ideals (Unitats de massa)";   
.Real ro 1 "Densitat relativa del gas (aire) en la zona lateral";

On en el conjunt del sistema tindrem un nombre de m ols totals (nt) que dona una massa total (m t). Cal esmentar que les variables Rp i A\_l no caldrien que estiguessin definides aquí ja que són paràmetres constants en l’estudi del sistema i es podrien haver definit en l’apartat anterior.

A continuació descriurem les equacions que governen el sistema i l’evolució de les variables durant l’estudi o funcionament d’aquest.

equation

//Entrada de les posicions.

$$
{ \begin{array} { l } { \displaystyle \mathsf { s d } = { \frac { 1 + \sin { \big ( } \mathsf { u } 1 \cdot \mathsf { t i m e } + { \frac { 3 . 1 5 1 4 } { 2 } } { \big ) } } { 1 0 } } } \\ { \displaystyle \mathsf { s p } = { \frac { 1 + \sin { \big ( } \mathsf { u } \cdot \mathsf { t i m e } { \big ) } } { 1 0 } } } \end{array} }
$$

//Volums disponibles en les diferentes zones en funció de la posició del pisto de la respectiva zona.

$$
\mathrm { V } 1 = \mathrm { V } \mathrm { m } 1 + \mathrm { A } 1 { \cdot } \mathsf { s } \mathrm { d }
$$

$$
\mathrm { V } 2 = \mathrm { V } \mathrm { m } 2 + \mathrm { A } 2 \cdot \mathsf { s p } - \mathrm { A } 1 \cdot \mathsf { s d } + 2 \mathit { l a } \cdot \mathrm { A } 1
$$

//Càlcul de l'area lateral disponible.

$$
\mathcal { A } _ { \mathcal { i } } = \boldsymbol { \pi } \cdot \mathbf { d } \boldsymbol { 1 } \cdot \boldsymbol { l } _ { d }
$$

//Canvi unitats de mols a massa de la constant dels gassos ideals.

$$
\mathbb { R } \mathbb { p } = { \frac { R } { M } }
$$

//Càlcul de les densitats relatives en les diferentes zones del sistema.

$$
\mathfrak { r o } 1 = \frac { \mathbb { P } 1 } { \mathbb { R } \mathfrak { p } \cdot \mathbb { T } 1 }
$$

$$
\mathfrak { r o } 2 = \frac { \mathbb { P } 2 } { \mathbb { R } \mathfrak { p } \cdot \mathbb { T } 2 }
$$

$$
{ \bf r o } _ { i } = \frac { P _ { i } } { { \mathbb { R } } { \bf p } \cdot { T } _ { i } }
$$

//Equació dels gassos ideals aplicada a les dues zones.

$$
\mathrm { V } 1 { \cdot } \mathbb { P } 1 = \mathrm { n } 1 { \cdot } R { \cdot } \mathbb { T } 1
$$

$$
\mathtt { V } 2 \cdot \mathtt { P } 2 \ = \ \mathtt { n } 2 \cdot \mathtt { R } \cdot \mathtt { T } 2
$$

//Càlcul de la pressio en la zona lateral.

$$
{ P } _ { l } = \frac { { \mathbb { P } } 1 + { \mathbb { P } } 2 } { 2 }
$$

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

$$
\mathrm { m t } = \mathrm { m } 2 + \mathrm { m } 1 + \mathrm { m } _ { \downarrow }
$$

Fins aquí, la deducció de les equacions no presenta complexitats però ara analitzem de manera més detallada l’equació de la continuïtat que descriurà el moviment de les m asses en cada zona. Les equacions es descriuen per dos zones i Dymola anàlogament am b les equacions anteriors que relacionen totes les m asses del sistema dedueix l’evolució de la restant. Les m asses de les zones varien degut al moviment dels pistons que poden tenir dos moviments per cada zona, el de pujada (del Pmi a Pms) o el de baixada (viceversa) i que es donen de manera simultània o contraria a cada pistó ja que estan connectats pel cigonyal i desfasats $90 \%$ . El valor que determina si el sentit del moviment per cada pistó és de pujada o baixada és el valor de la velocitat (c). I aquestes m asses es transfereixen de la zona 1 a la 2 passant per la zona lateral.

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
\frac { \mathrm { d } \mathrm { m } 1 } { \mathrm { d t } } = m e = m q 1 ;
$$

![](images/de10a30d74d895569a424c6bb6a4a0f68d7d928611b282774cacee0a4ab6d606.jpg)  
Il-lustració 36 Moviment de m asses en zona calenta durant el descens.

El caudal màssic que surt (mq1) tal i com observem a la imatge prové del la mateixa zona 1 per tant serà el resultat de:

$$
m q 1 = c ^ { * } A \_ a m ^ { * } r v \_ l =
$$

Per la zona 2 tenim $ \mathrm { ~ \ m e = \ m q } 2 \mathrm { ~ i ~ } \mathsf { m } s = 0$

$$
{ \frac { \mathrm { d m 2 } } { \mathrm { d t } } } = - m 5 = - m q 2 .
$$

![](images/5145fb4809b79f49914931213d735b052976d8197fe3d71a3181eccee2588f0d.jpg)  
Il-lustració 37 Moviment de m asses en zona freda durant el l’ascens.

El caudal màssic que entra (mq2) tal i com observem a la imatge prové de la mateixa zona 2 per tant serà el resultat de:

$$
m q 2 = c ^ { * } A \_ a n ^ { * } r o 2 ;
$$

Si la $\mathsf { c } > 0$

Per la $_ { 2 0 \mathsf { n a } \mathrm { ~ 1 ~ t e n i m ~ - > ~ } \mathsf { m e } = 0 \mathrm { ~ i ~ } \mathsf { m } s = \mathsf { m q 1 } }$

$$
\frac { \mathrm { d } { \mathrm { m } } 1 } { \mathrm { d t } } = - m s = - m q 1 ;
$$

Zona 1 (Desplaçador)  
![](images/198bbdd22739784745849d216f17b1871bd94789377417c1696ef6a345560fc5.jpg)  
Il-lustració 38 Moviment de m asses en zona calenta durant l’ascens.

El caudal màssic que surt (mq1) tal i com observem a la imatge prové del la mateixa zona 1 per tant serà el resultat de:

$$
m q 1 = c ^ { * } { \cal A } \_ a n ^ { * } r o 1 .
$$

Per la zona 2 tenim $\scriptstyle \mathtt { - > } \ \mathsf { m e } = \mathsf { m q } 2 \ \mathsf { i } \ \mathsf { m s } = 0$ 1

$$
{ \frac { \mathrm { d m } 2 } { \mathrm { d t } } } = m e = m g 2 .
$$

![](images/8c65664073b09579c57f503b487e969e2ab7ffc0511b56b363acdb22c3345875.jpg)  
Il-lustració 39 Moviment de m asses en zona freda durant el descens.

El caudal màssic que entra (m q1) tal i com observem a la imatge prové del lateral per tant serà el resultat de:

$$
m q 2 = c ^ { * } A \_ a n ^ { * } r o \_ \mathrm { l } ;
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

Un cop sabem com seran els caudals podem escriure l’evolució d’aquest respecte del tem ps com :

$$
\begin{array} { l } { { \exists \in \mathbb { r } \left( \mathrm { m } 1 \right) = - \mathrm { m } 1 \bar { r } } } \\ { { \mathrm { d } \in \mathbb { r } \left( \mathrm { m } \ 1 \right) = \mathrm { m } \underline { { \mathbb { r } } } 1 - \mathrm { m } \underline { { \mathbb { r } } } \bar { z } ; } } \end{array}
$$

Els signes estan ficats en funció de la velocitat. Comprovem que són correctes.

$$
\frac { \mathrm { d } \mathrm { m } 1 } { \mathrm { d t } } = - m q 1 ;
$$

$$
\{ \textsf { S i c < 0 } \left( - \right) \to > \ = \ + \ \mathsf { m q 1 } = \mathsf { L a ~ Z o n a ~ 1 ~ s ' e s t a ~ o m p l i n t } .
$$

$$
\{ \mathsf { S i c } > 0 \ ( + ) \ - > \ = \ - \mathsf { m q 1 } = \mathsf { L a \ z o n a \ 1 \ s } ^ { \prime } \mathsf { e s t a \ b u i d a n t } . 
$$

$$
\frac { \mathrm { d } { \mathrm { m } } \mathrm { ~ . } } { \mathrm { d t } } { = } m q 1 - m q 2 ;
$$

{ Si c<0 (-) -> = + mq2 = La zona lateral s’està omplint de massa 2 i en marxa cap a la zona 1.

{ Si c>0 (+) -> = - mq2= La zona lateral s’està omplint de massa 1 i en marxa cap a la zona 2

Quan es vol estudiar la força que actua sobre un sistema es planteja l'equació de quantitat de moviment ja que les forces que actuen sobre un sistema provoquen canvis en la quantitat de moviment.

En aquesta equació tenim per una banda la suma de les forces externes que actuen sobre el fluid i per l'altra banda la variació de la quantitat de moviment

$$
\sum F = { \frac { g F ( m c ) } { g T } } { \frac { \ l } { a } } =
$$

Les forces que actuen sobre el fluid lateral són:

\- Forces de pressió, tant a l'entrada com a la sortida. Es fa servir la pressió relativa, en el teu cas, com que les àrees d'entrada i sortida són iguals, el que interessa és tot just la diferència de pressions.

\- La força de fregament del fluid am b les parets deguda a la viscositat.

\- El pes del propi fluid, en aquest cas no es té en compte ja que els moviments son horitzontals i el pes afecta al moviment vertical.

Quedant les forces que actuen en el sistema relacionades de la següent manera:

$$
\begin{array} { r l } & { \sum F = - ( P 1 - P 2 ) ^ { * } A _ { - } a n - A _ { - } l ^ { * } \mu ^ { * } ( \frac { \displaystyle \frac { d e r ( s d ) } { d t } } { \displaystyle \frac { ( d c - d 1 ) } { 2 } } ) ; } \end{array}
$$

El terme de variació de quantitat de moviment es pot expressar com:

$$
\frac { d e r ( m c ) } { d t } = c ^ { * } \frac { d e r ( m ) } { d t } + m ^ { * } \frac { d e r ( c ) } { d t } ;
$$

També es podria aplicar el teorema del trasnport de Reynolds i quedaria:

$$
\frac { d ( m c ) } { d t } = \frac { \hat { \sigma } } { \hat { \sigma } t } \int _ { v } \boldsymbol { r } d V + \int _ { \mathrm { { s } } } \boldsymbol { c } \cdot \boldsymbol { c } \mathrm { { \rho } } d S
$$

$$
\frac { d ( m c ) } { d \iota } = \frac { \hat { \sigma } ( m c ) } { \hat { \sigma } \iota } + \dot { m } _ { \iota } c _ { \iota } - \dot { m } _ { \rho } c _ { \iota }
$$

$$
\frac { d ( m c ) } { d t } = \frac { \hat { \sigma } ( m c ) } { \hat { \sigma } t } + c _ { s } A _ { s } \rho _ { \mathsf { l a r } } c _ { s } - c _ { e } A _ { e } \rho _ { \mathsf { l } } c _ { e } \qquad 0 = \frac { \hat { \sigma } m } { \hat { \sigma } t } + \dot { m } _ { s } - \dot { m } _ { e }
$$

Prenent la primera expressió com a funció del temps però a la vegada de la posició, podem posar:

$$
\frac { \hat { \sigma } ( m c ) } { \partial t } = c \frac { \hat { \sigma } m } { \hat { \sigma } t } + m \frac { \hat { \sigma } c } { \hat { \sigma } t }
$$

Es pot ficar l’expressió final.

$$
\frac { d ( m c ) } { d t } = c \frac { \hat { c } m } { \hat { \sigma } t } + m \frac { \hat { \sigma } c } { \hat { \sigma } t } + c _ { s } A _ { s } \rho _ { { \varphi } t } c _ { s } - c _ { e } A _ { e } \rho _ { 1 } c _ { e }
$$

Afegint les forces del sistema queda:

$$
\sum F = c { \frac { \hat { \sigma } m } { \hat { \sigma } t } } + m { \frac { \hat { \sigma } c } { \hat { \sigma } t } } + c _ { s } A _ { s } \rho _ { { \mathrm { l o t } } } c _ { s } - c _ { e } A _ { e } \rho _ { 1 } c _ { e }
$$

En el programa no s’han modelat els dos últims dos termes de l’expressió per tal de simplificar-la.

$$
- ( P 1 - P 2 ) ^ { * } { \cal A } _ { - } a n - { \cal A } _ { - } l ^ { * } \mu ^ { * } ( \underbrace { \frac { d e r ( s d ) } { d t } } _ { 2 } ) = c ^ { * } \frac { d e r ( m ) } { d t } + m ^ { * } \frac { d e r ( c ) } { d t } ;
$$

Programat en Dymola com:

$$
/ / ( \mathbb { P } 1 . \mathbb { P } 2 ) ^ { * } \mathbb { A } \supseteq \mathbb { P } 1 \neg \mathbb { A } \_ \sharp \Pi \sqcup ^ { * } ( \mathbb { d } \in \Gamma ( \mathsf { s d } ) / ( ( \mathbb { d } \mathbb { c } \mathbb { d } 1 ) / 2 ) ) = \mathbb { c } ^ { * } \mathbb { d } \in \Gamma ( \Pi \_ \Pi ) + \mathfrak { m } \_ \sharp \mathbb { d } \in \Gamma ( \mathsf { c } ) ;
$$

$$
\left| \mathbb { P } 1 - \mathbb { P } 2 \right| \mathcal { A } _ { \sf 3 / 2 } - \mathcal { A } _ { l } - \mu \left| \frac { \mathrm { ~ d ~ s d ~ } } { \mathrm { ~ d ~ } t } \right| = m _ { l } - \frac { \mathrm { ~ d ~ } c } { \mathrm { ~ d ~ } t }
$$

//Al no tenir escalfament les temperatures es mantenen constants.

$$
\frac { \mathrm { ~ d ~ T ~ 1 ~ } } { \mathrm { ~ d ~ } t } = 0
$$

$$
\frac { \mathrm { ~ d ~ T ~ 2 ~ } } { \mathrm { ~ d ~ } t } = 0
$$

$$
\frac { \mathrm { d } T _ { i } } { \mathrm { d } t } = 0
$$

I la força que es realitza en el pistó de potència és la pressió d’aquesta zona menys la pressió atmosfèrica multiplicada per l’àrea en la que s’està aplicant.

$$
\begin{array} { r l } & { \mathrm { / / F o r g e ~ g u s e ~ \underline { { \Sigma } } e g e ~ \in \mathbb { Z } ^ \nu ~ \ p i . e t o ~ \underline { { \Sigma } } e g e ~ \underline { { \Sigma } } e g e t e ~ f i n c i . e . } } \\ & { \mathrm { ~ \underline { { \Sigma } } ~ = ~ \Gamma ( \mathbb { E } / \hat { z } - \mathbb { E } o ) \mapsto \hat { \underline { { \Sigma } } } e ~ \hat { z } ~ ; } } \end{array}
$$

Un cop tenim tot el ModelVolum s definit passem a testejar-lo. Creem un nou model anomenat ModelVolum s\_Test, on nom és cal afegir la constant que fa d’equivalent dels valors de les posicions relatives i el ModelVolums que acabem de modelar.

![](images/3089cbdbdf7eb487204e880f03bf97e0dc0ba1573aca8cd9d7ac1cc5a644391e.jpg)  
Il-lustració 40 Àrea d’interacció del ModelVolum s\_Test

Abans de simular, hem d'introduir els següents valors i activar les condicions inicials següents (P1, n1, n2, nt) com a fixes.

model ModelVolums\_Test   
Modelica.Blocks.Sources.Constant const(k=1)   
a ;   
ModelVolums   
modelVolums (   
d1= 0.15,   
1\_d=0.1,   
d2= 0.12,   
dc=0.18,   
P1(fixed=true),   
n1 (fixed=true),   
n2 (fixed=true),   
nt (fixed=true))   
a ;   
equation   
connect(const.Y, modelVolums\_Bo.u1) a;   
connect(const.Y, modelVolums\_Bo.u) a;   
a ;   
end ModelVolums\_Test\_Only;  
Il-lustració 4 1 Codi del ModelVolum s\_Test amb paràmetres i condicions inicials.

Am b el test podem com provar gràficament com els volum s estan variant en funció de les posicions, com les masses varien en funció d’aquests volum s i que el model ens entrega una força resultant.

![](images/5570a7e7852de9a85135b698f595126284d694a85e3b1f7dd151ee3a65924336.jpg)

![](images/1c6350fa6a77118558c9eec799238228302f4942b6d00cb93e6875b127912f94.jpg)  
Il-lustració 42 Variacions de volum s en funció de les posicions.

![](images/e00dbd4d3d86721c10114ac5892d13ba036481cbbf1867741808dec91b3d70b0.jpg)

![](images/7160571b632e53ed4c660299c2bf83303ca5e7962411dc618f5d0a48110177d7.jpg)  
Il-lustració 43 Variacions de les m asses en funció dels volums disponibles.

![](images/a3fb239ae296399cbaa00b788f0f9a64ddf358d5e36287587d3f1abb2729526e.jpg)  
Il-lustració 44 Força exercida sobre el pistó de potència.

• Segona part, escalfament:

Ara afegim al ModelVolums, l’escalfament i refredament del sistema. Tornem a analitzar el sistema afegint aquests nous processos per veure quins nous paràmetres i variables tenim.

![](images/0e7b20d0e2d4d5b1281e1f225b0cd678354767734b04dc99fe55b7e7d052647a.jpg)  
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

Cal esmentar que Ac i Af també podrien haver- se definit com a paràmetres ja que són constants. Els calors en cada zona necessiten condicions inicials ja que aquests es troben a una temperatura inicial i tenen unes m asses inicials. Per últim veiem que aquí tenim nou de les onzè noves variables, falten les temperatures d’escalfament i refredament, aquestes es modelen com entrades al nou ModelTermodinàmic per tal de poder-les ajustar posteriorment al tipus d’escalfament i refredament que tinguem en el sistema.

Al tenir dues noves entrades també haurem de substituir el ModelConnectors\_Posicions\_Forces per un nou model que incorpori aquestes entrades i que anomenarem ModelConnectors\_Posicions\_ Tem peratures\_Forces.

partial model ModelConnectors\_Posicions\_Temperatures\_Forces   
Modelica.Blocks.Interfaces.RealInput u   
"Posició del pisto de potència en el cilindre"   
a ;   
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
Il-lustració 46Codi del ModelConnectors\_Posicions\_Temperatures\_Forces.

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

```javascript
Per a la zona 1 tenim:
//Transferència de calor entre l'entorn exeterior i l'interior de la zona 1.
(pc = Uc*λc* (Tc-T1) ;
Ac = A1;
//Calor absorvit per la massa en la zona 1.
Qc = nl*cv*T1;
Per la zona 2 tenim:
//Transferència de calor entre 1'entorn exeterior i 1'interior de la zona 2.
Qpf - – Uf*Af*(T2-Tf); //Signe negatiu ja que la calor surt del sistema.
Af = A2;
//Calor absorvit per la masza en la zona 2.
Qf = m2*cv*T2;
Per la zona lateral tenim:
//Calor absorvit per la massa lateral.
Q_1 = m_1*cv*T_1;
```

On l’evolució del calor de cada zona depèn del calor que està entrant o sortint per la paret i de les m asses que hi circulen (on ja sabem que aquestes varien segons el moviment dels pistons). Veiem com és aquesta evolució del calor en les respectives zones del sistema.

Partint de:

$$
\cfrac { \mathrm { d } Q } { \mathrm { d t } } = Q e - \mathcal { Q } s ;
$$

Per la zona 1:

$$
\cfrac { \mathrm { d } { \sf Q } \mathrm { c } } { \mathrm { d t } } = { \mathcal { Q } } e ;
$$

![](images/d0cb467296dddb1da2b9bf7626f2ff90c6a91e85eeb96750f61973c6a977d297.jpg)

Il-lustració 47 Variació del calor en la zona 1 durant el descens del desplaçador.

On tenint en compte el signe de la velocitat i sabent que m q1 prové de la zona lateral, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = \mathcal { Q } e = \mathcal { Q } p c - m p \mathrm { 1 } ^ { \ast } c \nu ^ { \ast } T \_ l ;
$$

$$
\mathsf { S i c } > 0 \mathrm { ~ t e n i m ~ } \to \mathsf { Q e } = \mathsf { Q p c } \mathrm { ~ i ~ } \mathsf { Q s } = \mathsf { m q 1 } ^ { * } \mathsf { c v } ^ { * } \mathsf { T 1 }
$$

$$
\frac { \mathrm { d } Q \mathrm { c } } { \mathrm { d t } } = Q e - Q s ;
$$

![](images/3eb9f57af8552bbdb0b5913462e26c2632f461dba91a289bf965c1cfe7caa4ae.jpg)  
Il-lustració 48 Variació del calor en la zona 1 durant el ascens del desplaçador.

On tenint en compte el signe de la velocitat i sabent que m q1 prové de la zona 1, finalment ens queda:

$$
\frac { \mathrm { d } \hat { \mathrm { Q } } c } { \mathrm { d t } } = \mathcal { Q } e - \mathcal { Q } s = \mathcal { Q } p c - m g \mathrm { 1 } ^ { \ast } c \mathrm { v } ^ { \ast } T \mathrm { 1 } ,
$$

Tot això es programa en Dym ola de la següent manera:

//Variació del calor en la zona 1 en funció del moviment del sistema.   
if c<0 then   
der(Qc)=Qpc-mp1\*cv\*T\_1;   
else   
der(Qc)=Qpc-mp1\*cv\*T1;   
end if;

Per la zona 2:

$$
\mathsf { S i c } < 0 \mathsf { t e n i m } \to \mathsf { Q e } = 0 \mathsf { i } \mathsf { Q s } = \mathsf { Q p f } + \mathsf { m q 2 ^ { * } c v ^ { * } T } \mathsf { \Pi } _ { - } |
$$

$$
\frac { \mathrm { d } Q \mathrm { f } } { \mathrm { d t } } = - Q s ;
$$

![](images/7b0b045eef920a357e61936775a0df768da5cc4d4ba3d2c70dd5e8da263d44ba.jpg)  
Il-lustració 49 Variació del calor en la zona 2 durant el ascens del pistó.

On tenint en compte el signe de la velocitat, el signe de latransferència de calor per la paret i sabent que m ${ \tt q } 2$ prové de la zona $^ { 2 , }$ finalment ens queda:

$$
\frac { \mathrm { d } Q \mathrm { f } } { \mathrm { d t } } = - Q s = Q p f ^ { \ast } + m q 2 ^ { \ast } c v ^ { \ast } T 2 .
$$

Si $= - 0$ tenim $- \gg \mathrm { C e } = \Pi \Omega ^ { 2 } ^ { \ast } \mathtt { C V } ^ { \ast } \mathbb { T } \_ \mathrm { I } \mathrm { i } \mathrm { Q s } = \mathtt { Q p f }$

$$
\frac { \mathrm { d } \mathrm { Q } \mathrm { f } } { \mathrm { d } \mathrm { t } } = \underline { { Q } } _ { E } - \underline { { Q } } _ { \bar { s } } ,
$$

![](images/fb3c1511b4e4827bfbc675d5021773cb0c703a828ac9041e72d357d0652ad7bc.jpg)  
Il-lustració 50 Variació del calor en la zona 2 durant el descens del pistó.

On tenint en compte el signe de la velocitat, el signe de la transferència de calor per la paret i sabent que m q2 prové de la zona lateral, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q f } } { \mathrm { d t } } = \mathcal { Q } e - \mathcal { Q } s = \mathcal { Q } p f + m q 2 ^ { \ast } c v ^ { \ast } T \_ l _ { \ast }
$$

Quedant programat en Dymola:

//Variació del calor en la zona 2 en funció del moviment   
if c<0 then   
der(Qf)-Qpf+mp2\*cv\*T2;   
else   
der(Qf)-Qpftmp2\*cv\*T\_1;   
end if:

Per la zona lateral:

$$
\begin{array} { r }  \mathsf { S i } \mathtt { c } \mathtt { < } 0 \mathrm { ~ t e n i m ~ \mathtt { - } > \mathsf { Q e } = \mathsf { m q } \mathtt { Z } \mathtt { e v } ^ { \mathtt { s } } \mathtt { C v } ^ { \mathtt { s } } \mathtt { T } \mathtt { Z } \mathtt { i } \mathtt { Q } \mathtt { s } = \mathsf { m q } \mathtt { 1 } ^ { \mathtt { s } } \mathtt { C v } ^ { \mathtt { s } } \mathtt { T } \_ { 1 } } \end{array}
$$

$$
\frac { \mathrm { d } \mathrm { Q } \mathrm { ~ \underline { ~ } { ~ l ~ } ~ } } { \mathrm { d t } } = \underline { { Q } } \mathrm { e } - \underline { { Q } } \mathrm { r } =
$$

![](images/639896b21d0528ba549baee91304101d09ce8e4b3a327594729759e1de8a24ca.jpg)  
Il-lustració 51 Variació del calor en la zona lateral durant el descens

On tenint en compte el signe negatiu de la velocitat ens queda:

$$
\frac { \mathrm { d } \mathrm { Q } _ { - } 1 } { \mathrm { d t } } = { Q } e - { Q } s = - m q 2 ^ { * } c v ^ { * } T 2 + m q 1 ^ { * } c v ^ { * } T _ { - } l ;
$$

![](images/775ed45d208507919352e9e1842e02154d798ad4bb195197287254dd0b1d52e1.jpg)  
Il-lustració 52 Variació del calor en la zona lateral durant l’ascens del desplaçador.

Considerant novament el conveni de signes elegit tenim que:

dQ\_1   
= Qe − Qs = −mq2 \* cv \*T \_l + mq1 \* cv \* T1;   
dt

Resultant la programació en Dymola:

//Variació del calor en la zona lateral en funció del moviment del sistema   
if c<0 then   
der(Q\_1)=-mp2\*cv\*T2+πp1\*cv\*T\_1;   
else   
der(Q\_1)=-mp2\*cv\*T\_1+mp1\*cv\*T1;   
end if;

Abans de simular cal ajustar els següents valors i condicions inicials

```matlab
model ModelTermodinamic_Test
Modelica.Blocks.Sources.Ramp TC( duration=10,
offset=293.73,
height=200)
a ;
Modelica.Blocks.Sources.Constant TF(k=293.73)
a ;
Modelica.Blocks.Sources.Constant const(k=1)
a ;
ModelTermodinamic_Only modelTermodinamic_Only(
d1=0.15,
1_d=0.1,
d2=0.12,
dc=0.18,
P1(fixed=true),
nt (fixed=true),
n1(fixed=true),
n2 (fixed=true),
Uc=10,
Uf=100)
a ;
equation
a ;
end ModelTermodinamic
```

Il-lustració 54 Codi del ModelTermodinamic\_Test am b paràmetres i condicions inicials.

Podem observar gràficament com les temperatures i calors de les zones del sistema van variant en funció del moviment de les m asses d’una zona a l’altre durant la simulació del sistema.

![](images/dc49d5315016e91aa3b7ab44bc074612aafe7ba2803459069eb05d5c074742d6.jpg)  
Il-lustració 55 Variacions de calors en el sistema.

![](images/70815e88e04e4ef7a40e8af30069b0f0129597abe55f42db1e8a946e577808f3.jpg)  
Il-lustració 56 Variacions de calors en les parets del sistema.

![](images/c56e5affae63b4da0b2fed4d821e2705a2ecd2f830475c39177df2e2312a6022.jpg)  
Il-lustració 57 Variacions de les temperatures del sistema.

Aquest sistema d'arrencada esta format per una acceleració (Modelica-> Mechanics-> Rotational-> Sources-> Accelerate) que se li entrega a un embragatge i que s'activarà a través d'una rampa (Modelica-> Blocks-> Sources-> Ram p) aquesta ram pa s'activa al cap de trenta segons desprès d'haver començat la simulació, per tal de que el sistema s'hagi escalfat bé, i té una durada de deu segons. L'embragatge (Modelica-> Mechanics-> Rotational-> Components-> Clutch) està embragat des de el principi de la simulació al cigonyal i s'encarregarà de transmetre l’acceleració durant els deu segons que aquesta dura i desprès es desem braga del cigonyal per l’acció d’un escaló unitari (Modelica-> Blocks-> Sources-> Step) que el farà passar de un estat activat a un de desactivat (d’un offset de valor 1 a una alçada de valor -1 respecte l’offset que és igual a zero al cap de quaranta segons).

Per poder mesurar la potència que aquest motor ens està entregant afegirem al test un sensor de potència (Modelica-> Mechanics-> Rotationa-> Sensors-> Power Sensor) que mesurarà la potència resultant entre l’entregada al cigonyal i un fregament (Modelica-> Mechanics-> Rotational-> Components-> Dam per) que l'imposem a aquest. La posició d’aquest fregament és fixa (Modelica-> Mechanics-> Rotational-> Com ponents- Fixed). Per obtenir una bona potència s'estipula que el fregament a de tenir un valor aproximat d’un seixanta per cent respecte de la velocitat màxim a del cigonyal.

![](images/e49ad92f4fdd837f24095b032e82bd04d78948e472945c2ab7ed18a54b8b149f.jpg)  
Il-lustració 59 Exemple dels components per el test del Motor\_Stirling.

# CAPÍTOL 2: ANNEX 2. RESUM PROJECTE ANTÍA VARELA

## 2.1. Annex 2.1. Verificació.

Inicio de las simulaciones

Antes de comenzar a introducir modificaciones en la implementación del motor Stirling es necesario analizar el funcionamiento del modelo inicial para tratar de averiguar el origen de los problemas existentes.

El primer paso a llevar a cabo es estudiar detenidamente los modelos mecánico y termodinámico para detectar posibles errores en la implementación del código.

### 5.2.2. Simulaciones de inercia y temperatura

Simulaciones de inercia y temperatura

Es preciso aclarar que en este apartado sólo se presentan las gráficas de las simulaciones más importantes, mientras que la totalidad de las gráficas están recogidas en el apartado B.2 de los anexos.

**a) Simulaciones de temperatura**

Una vez estudiados los modelos mecánico y termodinámico del motor diseñado por Albert, se procede a analizar el funcionamiento de la máquina mediante una visualización 3D. Tras dicha simulación se puede comprobar que el motor se para al cabo de cierto tiempo e incluso comienza a moverse en la dirección contraria, lo cual indica que hay un problema que debe solucionarse.

La primera modificación introducida para tratar de mejorar el funcionamiento del motor es aumentar la temperatura del foco caliente (Tc) para que entre más energía en el motor. Por otro lado, también se disminuirá la temperatura del foco frío para aumentar la diferencia de temperaturas. El valor inicial que toma el foco frío se corresponde con la temperatura ambiente $( \mathsf { T } \mathsf { F } =$ 293,15 K).

Para ello se accede a la función rampa que define la temperatura $\mathsf { y } ,$ sin modificar el offset, se varía la altura de la función. Inicialmente se parte de un valor de altura de 230 y de un momento de inercia (J) de $2 ~ \mathsf { k g } / \mathsf { m } ^ { 2 }$

Tabla 1. Simulaciones modificando la temperatura de los focos.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa temperatura</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Offset (K)</td><td>Height (K)</td></tr><tr><td>1</td><td>293,15</td><td>240</td><td>NO</td></tr><tr><td>2</td><td>293,15</td><td>250</td><td>NO</td></tr><tr><td>3</td><td>250</td><td>260</td><td>NO</td></tr><tr><td>4</td><td>250</td><td>280</td><td>NO</td></tr></table>

En las primeras dos simulaciones se aumenta la temperatura del foco caliente, manteniendo el foco frío a la temperatura ambiente. En las dos siguientes se continúa aumentando la temperatura del foco caliente, disminuyendo a su vez la temperatura del foco frío a 250 K.

![](images/50a749904e5f78776a6a0b3e2aa93bf7ca43df3da8bd33d7863263d2b19e6765.jpg)  
Figura 25. Caso de simulación nº4: velocidad angular.

En la gráfica anterior se puede apreciar el caso de simulación número $^ { 4 , }$ el cual refleja, al igual que los 3 casos anteriores, que el motor no funciona pese a las modificaciones de temperatura llevadas a cabo. Por tanto, tras las simulaciones realizadas se concluye que el aumento de la diferencia de temperaturas entre el foco caliente y el foco frío no es suficiente para asegurar el buen funcionamiento del motor. Por tanto, se vuelve a establecer el foco frío a temperatura ambiente.

**b) Simulaciones de inercia**

La siguiente modificación consiste en el aumento del momento de inercia (J), la cual surge de plantearse que quizás el momento de $2 \ \mathrm { k g } / \mathrm { m } ^ { 2 }$ establecido inicialmente no es suficiente para asegurar que el motor de arranque provoque el arranque del motor Stirling. Esta decisión también está basada en el análisis de la gráfica de la velocidad angular, donde se puede observar que la máquina gira muy lentamente.

Tabla 2. Simulaciones modificando el volante de inercia.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Altura rampa temperatura</td><td>Momento de inercia (kg/m²)</td><td>Funciona (SI/NO)</td></tr><tr><td>5</td><td>80</td><td>(K) 240</td><td>5</td><td>SI</td></tr><tr><td>6</td><td>80</td><td>240</td><td>4</td><td>SI</td></tr><tr><td>7</td><td>80</td><td>240</td><td>3</td><td>SI</td></tr><tr><td>8</td><td>200</td><td>240</td><td>3</td><td>NO</td></tr></table>

En la primera simulación se establece un aumento considerable del momento de inercia para analizar el comportamiento del motor. Tras el experimento se comprueba que la máquina funciona durante el tiempo establecido, por lo que se va disminuyendo gradualmente el valor del momento mientras siga funcionando.

Finalmente se establece dicho valor en $\mathsf { J } { = } 3 \ \mathrm { \ k g / m } ^ { 2 } \ \mathsf { y }$ se procede a simular durante 200 segundos para comprobar si el comportamiento se mantiene durante más de 80 segundos o si, por el contrario, el motor vuelve a pararse. Tras la simulación se puede observar que el motor se desestabiliza al cabo de 150 segundos, pero no llega a pararse.

![](images/7bfcdf5280a3f1d816171a9f0345a07a0d4b4191e0620e25c71efa07ba210e3e.jpg)  
Figura 26. Caso de simulación nº8: velocidad angular.

### 5.2.3. Simulaciones del sistema de arranque y temperaturas

**a) Simulaciones de funcionamiento debido al motor de arranque**

Para comprobar la acción que ejerce la inercia de arranque sobre el movimiento de la máquina, se procede a simular el funcionamiento del motor debido únicamente a la inercia que proporciona el sistema de arranque. Por tanto, se igualan los focos de temperatura, ${ \sf T } _ { \sf C } = { \sf T } { \sf F } ,$ y se comienza a aumentar paulatinamente el tiempo de simulación con el objetivo de comprobar cuánto tiempo dura el efecto de la inercia en el motor.

Tabla 3. Simulaciones del funcionamiento de la máquina debido al motor de arranque.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Momento de inercia (kg/m²)</td><td>Funciona (SI/NO)</td></tr><tr><td>9</td><td>80</td><td>3</td><td>SI</td></tr><tr><td>10</td><td>200</td><td>3</td><td>SI</td></tr><tr><td>11</td><td>400</td><td>3</td><td>SI</td></tr><tr><td>12</td><td>600</td><td>3</td><td>NO</td></tr></table>

Como se puede deducir de la tabla anterior, la inercia de arranque del motor es suficiente para que éste funcione durante, al menos, 400 segundos. En el último de los casos el motor funciona hasta los 440 segundos, momento en el que se para completamente. En la siguiente gráfica podemos ver dicho comportamiento analizando la velocidad angular del motor.

![](images/70b945f8d2bcf96ef0cfef9e243bbb571a5ce944330170f475d1a41aefd4f761.jpg)  
Figura 27. Caso de simulación $n ^ { o } 1 2 .$ velocidad angular.

b) Comparaciones funcionamiento del motor de arranque y variación de temperaturas

A continuación se decide comparar el comportamiento del motor con una variación de temperatura entre los focos de 240 grados y el comportamiento debido únicamente al motor de arranque. Los resultados obtenidos se muestran en las siguientes gráficas. En la primera de ellas, el color azul se corresponde con el caso de simulación nº 8 y el color rojo al caso de simulación ${ \mathsf n } ^ { \mathsf { o } }$ 10.

![](images/13620460f860cfa892ab096eef5f52f7a00e70cea67813763d77445e39e7b69c.jpg)  
Figura 28. Comparación de casos nº8 y $n ^ { o } 1 0 \div$ velocidad angular.

![](images/0dea60913084263cf2d4c6a000a1de70dbe3039284b18146b4d3fcfff496bed8.jpg)

![](images/a3c4bf948f828d27aacec3786c148e6fdb78a983e9e43aac523b2bb88e005589.jpg)

Figura 29. Comparación de casos $n ^ { o } 8$ (arriba) $\gamma n ^ { o } 1 0$ (abajo): temperaturas.  
![](images/7d3a2857a703fa689860a8d710f662bc9978d6949d5808eda52ad3ebb36d00e1.jpg)

![](images/d152db95a2d1b282a0874cf03f0564e95c08b1b1bcd05d2866d92b23fbd2fa28.jpg)  
Figura 30. Comparación de casos $n ^ { o } 8$ (arriba) $\gamma n ^ { o } 1 0$ (abajo): transferencias de calor.

Se puede observar que las transferencias de calor producidas se deben casi únicamente a las diferencias de presión existentes en el fluido entre la zona caliente y la fría. Además, la aceleración proporcionada al motor en el arranque, gracias al momento del volante de inercia $( \mathrm { { J } } = 3 \mathrm { { k g } } / \mathrm { { m } } ^ { 2 } )$ , suponen que el motor pueda funcionar sin necesidad de una variación de temperatura durante casi 500 segundos. Por tanto se puede concluir que, en este caso, el efecto de la diferencia de temperatura entre los focos es casi inapreciable y que existe un problema en el motor, ya que sin la ayuda del arranque forzado éste no funciona.

### 5.2.1. Modificación de la fuerza

Tras analizar detenidamente el comportamiento actual de la máquina se llega a la conclusión de que es posible que la fuerza que se transmite del sistema termodinámico al sistema mecánico tenga el signo cambiado, es decir, que en lugar de entrar al sistema mecánico de forma positiva, llegue de forma negativa. Por tanto, para probar si el motor funciona mejor con la fuerza negativa, se accede al área de código del sistema termodinámico y se modifica la ecuación de la fuerza resultante, introduciendo un signo negativo.

$$
\begin{array} { r l } & { \mathrm { / / { F o r } \varsigma a ~ \varsigma _ { C } \circ ~ \varsigma _ { C } \circ ~ \varsigma _ { C } \circ ~ \varsigma _ { \mathrm { ~ e ~ l ~ } } ~ \ p i \ s t { \circ } ~ \varsigma _ { C } \circ ~ \varsigma _ { C } \circ \ c t { \circ } , \ } } \\ & { \mathrm { ~ \ \ } t = \mathrm { ( ) } \langle \mathrm { P } 2 \mathrm { - } \mathrm { P o } \rangle ^ { \star } \mathrm { A } 2 ; } \end{array}
$$

A continuación se comparará la presión resultante, la fuerza que llega al sistema mecánico del sistema termodinámico y la posición del pistón de potencia (sp) para los tres siguientes casos:

Tabla 4. Simulaciones modificando la rampa de temperatura y la fuerza.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Altura rampa temperatura (K)</td><td>Momento de inercia (kg/m²)</td><td>Fuerza</td><td>Color gráfica</td></tr><tr><td>13</td><td>80</td><td>0</td><td>3</td><td>f</td><td>rojo</td></tr><tr><td>14</td><td>80</td><td>240</td><td>3</td><td>f</td><td>azul</td></tr><tr><td>15</td><td>80</td><td>240</td><td>3</td><td>-f</td><td>verde</td></tr></table>

### 5.2.1. Sistema de arranque forzado

El objetivo de las simulaciones es analizar la velocidad angular mínima (ω) del sistema de arranque para que funcione el motor, teniendo en cuenta la combinación de altura y duración de la rampa de aceleración.

Por otro lado, se tendrá que estudiar el calentamiento previo del motor que proporciona la temperatura del área caliente (Tc) necesaria para que el motor funcione correctamente.

De esta manera, se determinará la combinación óptima de tiempo de calentamiento, altura y duración de la rampa de aceleración.

Las simulaciones que vienen a continuación tendrán como objetivo conseguir las metas establecidas en los párrafos anteriores.

**a) Análisis del sistema sin arranque forzado**

El siguiente paso es simular el sistema aplicando la modificación de la fuerza y sin la ayuda del motor de arranque para comprobar si la máquina es capaz de moverse sin la ayuda del arranque forzado.

Para anular el efecto del motor de arranque se tiene que acceder al Step, el cual activa el embrague que frena la aceleración, e indicar que en lugar de comenzar a los 20 segundos (lo que supondría que se le daría una aceleración al motor de 20 seg) se active a los 0 segundos (lo que implica que el Step activa el embrague en el segundo 0, por lo que la aceleración no actúa).

Tabla 5. Simulación sin sistema de arranque forzado.
<table><tr><td rowspan=1 colspan=1>Casosimulación</td><td rowspan=1 colspan=1>Tiemposimulación (seg)</td><td rowspan=1 colspan=1>Tiempocalentamiento (seg)</td><td rowspan=1 colspan=1>Altura rampatemperatura (K)</td></tr><tr><td rowspan=1 colspan=1>16</td><td rowspan=1 colspan=1>80</td><td rowspan=1 colspan=1>20</td><td rowspan=1 colspan=1>240</td></tr></table>

Tabla 6. (Continuación) Simulación sin sistema de arranque forzado.
<table><tr><td rowspan="2">Caso simulación</td><td>Step temperatura</td><td rowspan="2">Momento de inercia (kg/m² 2)</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Start Time (seg)</td></tr><tr><td>16</td><td>0</td><td>3</td><td>NO</td></tr></table>

![](images/7784cbcca3f51b3809d18df5788dec09ea48b1f100d0c698fb00b794ff51f12c.jpg)  
Figura 32. Caso de simulación nº16: velocidad angular.

![](images/95bade3583ee98ab2a86f327325c77546c08c8b18edf050cc01a76546f362bdd.jpg)

Figura 33. Caso de simulación $n ^ { o } 1 6 \cdot$ presión.  
![](images/c4536adae884e55b049ca60d89217fc51601d44845e8221e26d60336f6409f9d.jpg)  
Figura 34. Caso de simulación $n ^ { o } 1 6 \div$ fuerza.

Como se puede comprobar en las gráficas realizadas, el motor no funciona correctamente, sino que va oscilando de un lado a otro sin completar una vuelta. Esto supone que se vaya acumulando presión en el cilindro y que la fuerza que actúa sobre el pistón de potencia vaya aumentando, sin ser suficiente para que se mueva el motor.

Por tanto, se puede deducir que el motor no funciona sin un sistema de arranque forzado, pero se puede tratar de disminuir la acción de dicho sistema para darle el impulso necesario a la máquina sin excederse.

b) Análisis del sistema modificando el arranque forzado

A continuación se llevarán a cabo una serie de simulaciones para determinar qué configuración del sistema de arranque es la óptima para máquina estudiada.

Todas las simulaciones presentadas se realizan en un tiempo de simulación de 80 segundos, con una diferencia entre los focos de temperatura de 240 grados y con un momento de inercia de 3 kg/m².

Tabla 7. Simulaciones modificando el sistema de arranque forzado.
<table><tr><td rowspan=2 colspan=1>Casosimulación,</td><td rowspan=2 colspan=1>Tiempocalentamiento(seg)</td><td rowspan=1 colspan=1>Duración</td><td rowspan=1 colspan=1>Funciona</td></tr><tr><td rowspan=1 colspan=1>aceleración (seg)</td><td rowspan=1 colspan=1>(SI/NO)</td></tr><tr><td rowspan=1 colspan=1>17</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>18</td><td rowspan=1 colspan=1>12</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>19</td><td rowspan=1 colspan=1>14</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>20</td><td rowspan=1 colspan=1>16</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>21</td><td rowspan=1 colspan=1>20</td><td rowspan=1 colspan=1>1</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>22</td><td rowspan=1 colspan=1>20</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>23</td><td rowspan=1 colspan=1>18</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>NO</td></tr><tr><td rowspan=1 colspan=1>24</td><td rowspan=1 colspan=1>18</td><td rowspan=1 colspan=1>6</td><td rowspan=1 colspan=1>SI</td></tr><tr><td rowspan=1 colspan=1>25</td><td rowspan=1 colspan=1>30</td><td rowspan=1 colspan=1>6</td><td rowspan=1 colspan=1>SI</td></tr><tr><td rowspan=1 colspan=1>26</td><td rowspan=1 colspan=1>30</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>NO</td></tr></table>

El tiempo de calentamiento se establece programando el Start Time de la rampa que inicia la aceleración. La duración de dicha aceleración se determina mediante el Start Time del Step que controla el embrague que frena la aceleración.

Tal y como indica la tabla anterior, las únicas simulaciones en la que el motor funciona son la n⁰24 y la n⁰25. Ambas coinciden en que la duración de la rampa de aceleración es de 6 segundos. Sin embargo, esta aceleración es demasiado larga, por lo que en el siguiente apartado se tratará de reducir el tiempo de funcionamiento del motor de arranque.

![](images/aab636c4ab12c4b7590ec7dfbb04cca164a6320dc3ab5d27b3e0cb458eed68c1.jpg)  
Figura 35. Caso de simulación nº24: velocidad angular.

![](images/528d36f63b448857da57d28676e8b1298a84d45ebb096f83f753c73613506403.jpg)  
Figura 36. Caso de simulación nº25: velocidad angular.

**c) Análisis del sistema modificando la rampa de aceleración**

El objetivo es que se le proporcione al motor una aceleración suficiente para que se ponga en marcha, pero cuya duración no sea excesiva. Por tanto, se intentará combinar la altura de la rampa de aceleración con el tiempo de duración para conseguir que el motor se ponga en marcha, de modo que a medida que aumenta la altura de la rampa, disminuya su duración.

Sería adecuado obtener un sistema de arranque forzado cuya aceleración durase no más de 2 o 3 segundos. Se procederá a realizar diversas simulaciones para obtener la combinación adecuada. Todas ellas partirán de un calentamiento del motor de 20 segundos.

En la siguiente tabla se presentan las combinaciones establecidas:

Tabla 8. Simulaciones modificando la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo calentamiento (seg)</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>27</td><td>20</td><td>10</td><td>1</td><td>SI</td></tr><tr><td>28</td><td>20</td><td>5</td><td>N</td><td>SI</td></tr><tr><td>29</td><td>20</td><td>3</td><td>5</td><td>NO</td></tr><tr><td>30</td><td>20</td><td>4</td><td>5</td><td>SI</td></tr><tr><td>31</td><td>20</td><td>1</td><td>10</td><td>NO</td></tr></table>

Tras las simulaciones realizadas se puede comentar que el motor sólo se pone en marcha para las simulaciones ${ \mathsf n } ^ { \mathsf { o } } 2 7$ , 28 y 30, las cuales presentan una mayor duración de la aceleración.

![](images/ecb859290a2040bcf41f5bd37862194338192774400af93098739db9b3579656.jpg)  
Figura 37. Caso de simulación nº27: velocidad angular.

![](images/ea4c945230f409cc5727a5349640adbb686f3e7b05da8b502bfbd40f3caf3640.jpg)  
Figura 38. Caso de simulación nº29: velocidad angular.

Como ya se ha mencionado, el objetivo es reducir dicha duración, por tanto se llevarán a cabo nuevas pruebas aumentando el tiempo de calentamiento del motor para comprobar si ese aumento de temperatura es suficiente para que la máquina funcione correctamente con una aceleración más corta.

d) Análisis del sistema aumentando el tiempo de calentamiento y modificando la rampa de aceleración

A continuación se presentan las simulaciones realizadas aumentando el tiempo de calentamiento de 20 segundos a 30, 40 y 60 segundos. Todas ellas presentan diferentes combinaciones de altura y duración de la rampa de aceleración.

Tabla 9. Simulaciones aumentando el tiempo de calentamiento y modificando la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo calentamiento (seg)</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>32</td><td>40</td><td>1</td><td>10</td><td>NO</td></tr><tr><td>33</td><td>40</td><td>2</td><td>10</td><td>NO</td></tr><tr><td>34</td><td>40</td><td>3</td><td>10</td><td>SI</td></tr><tr><td>35</td><td>50</td><td>1</td><td>10</td><td>NO</td></tr><tr><td>36</td><td>50</td><td>2</td><td>10</td><td>NO</td></tr><tr><td>37</td><td>50</td><td>3</td><td>10</td><td>SI</td></tr><tr><td>38</td><td>60</td><td>1</td><td>12</td><td>NO</td></tr><tr><td>39</td><td>60</td><td>2</td><td>12</td><td>NO</td></tr></table>

La tabla anterior muestra que sólo las combinaciones que cuentan con una duración de 3 segundos de aceleración favorecen el funcionamiento del motor, independientemente del tiempo de calentamiento de la máquina o de la altura de la rampa de aceleración. La siguiente gráfica muestra el caso de simulación ${ \mathsf n } ^ { \circ } 3 4$ , uno de los dos casos en los que el motor funciona.

![](images/8080198775646f01ffe8d70cda5dd32de92e60d5e0b137308a5d78b4a989c5e2.jpg)  
Figura 39. Caso de simulación nº34: velocidad angular.

Para tratar de disminuir la duración de la aceleración se llevarán a cabo pruebas aumentando el tiempo de simulación, el tiempo de calentamiento y modificando la rampa de aceleración.

e) Análisis del sistema aumentando la altura de la rampa de aceleración y el tiempo de simulación

Tras las pruebas anteriores se decide aumentar la altura de la rampa de aceleración a 15 y el tiempo de simulación a 200 seg, estableciendo un calentamiento previo de la máquina de 100 segundos. Esta modificación persigue el objetivo de obtener una diferencia de temperaturas entre los focos lo suficientemente grande para que el motor funcione durante 200 segundos, con una aceleración que favorezca el arranque de la máquina.

Tabla 10. Simulaciones aumentando el tiempo de simulación y la altura de la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo simulación (seg)</td><td rowspan="2">Tiempo calentamiento</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>40</td><td>200</td><td>(seg) 100</td><td>1</td><td>15</td><td>NO</td></tr><tr><td>41</td><td>200</td><td>100</td><td>2</td><td>15</td><td>NO</td></tr><tr><td>42</td><td>200</td><td>100</td><td>3</td><td>15</td><td>SI</td></tr></table>

Una vez realizadas las simulaciones anteriores se determina que la máquina precisa de, al menos, tres segundos de aceleración para que pueda completar la primera vuelta, con una altura de 15. El comportamiento del motor con dichas especificaciones se puede observar en la siguiente gráfica:

![](images/a8afa9709397aa571dff971bd2d7053238b35c694f275741ac267ada0587be8a.jpg)  
Figura 40. Caso de simulación nº42: velocidad angular.

![](images/633eb793b8ee6cef70bee323fe6f09ce60cf2d756d9cbee61373241afb0effe8.jpg)

**Figura 41. Caso de simulación nº42: temperaturas.**

Como las temperaturas obtenidas en el foco caliente no son lo suficientemente elevadas, se procederá a aumentar la altura del Step de temperatura, de modo que la diferencia entre los focos caliente y frío sea mayor. Esta modificación está basada en la comprobación de que en una maqueta de un motor Stirling en funcionamiento, las temperaturas del foco caliente son mucho más elevadas que las obtenidas en las simulaciones mediante Dymola.

**f) Análisis del sistema aumentando la temperatura del foco caliente**

Se establece la altura del Step de temperaturas a 500, se determina un tiempo de calentamiento de 30 segundos y una rampa de aceleración cuya altura es de 15 y cuya duración es de 3 segundos.

Tabla 11. Simulación aumentando la temperatura del foco caliente.
<table><tr><td>Caso simulación</td><td>Tiempo</td><td>Tiempo simulación (seg) calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>43</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 12. (Continuación) Simulación aumentando la temperatura del foco caliente.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg). Altura</td><td></td></tr><tr><td>43</td><td>3</td><td>15</td><td>SI</td></tr></table>

![](images/56ebde9cf98c4428d0baf8bca30b3f25f4b5cdcf1b08dc6e05f5e11b75e28000.jpg)  
Figura 42. Caso de simulación nº43: velocidad angular.

![](images/87fbe32f22cd36fe73886dd2e5c7ec8fa7fa75ae04fb20a5d114136c15a8ec82.jpg)  
Figura 43. Caso de simulación nº43: temperaturas.

La simulación anterior funciona correctamente, pero la velocidad angular oscila mucho y no aumenta paulatinamente, sino que va decayendo poco a poco. Por tanto, para eliminar dicha oscilación se procede a aumentar el momento de inercia del motor (J).

**g) Aumento del momento de inercia (J)**

Se establece un momento de inercia de J=5 y se procede a simular el funcionamiento del sistema. Tras el experimento se comprueba que, efectivamente, la oscilación de la velocidad angular se reduce notablemente.

Tabla 13. Simulación aumentando el momento de inercia.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>44</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 14. (Continuación) Simulación aumentando el momento de inercia.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="3">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td></td><td>Altura</td></tr><tr><td>44</td><td></td><td>3</td><td>15</td><td>5</td><td>SI</td></tr></table>

![](images/eb3a2b4147d4b348e341096a88cbae3aabbbb99efb18663290c20b87baaa78e6.jpg)  
Figura 44. Caso de simulación nº44: velocidad angular.

![](images/130cb85207c0181878c29484f0420ab8aca85c73bf795047fceb097c913c29aa.jpg)  
Figura 45. Caso de simulación nº44: temperaturas.

Sin embargo, pese a que la temperatura del foco caliente es elevada en los primeros instantes de la simulación, ésta va disminuyendo a lo largo del tiempo, lo que supone una degradación del funcionamiento de la máquina. Por tanto, se decide mejorar la refrigeración del sistema y la transferencia de calor del foco caliente aumentando los coeficientes de transferencia de calor UC y UF.

**h) Aumentar los coeficientes de transferencia de calor**

Inicialmente, los coeficientes tomaban valores de UC=10 y UF=100. Se realiza una primera prueba aumentando los valores a UC=100 y UF=1000. En la imagen siguiente se presenta la zona del código donde se implanta la modificación de los coeficientes

![](images/be9284a8080a8bfbfbaf36fefd76a4c928830a63dc5cc097121df1ed1a88a739.jpg)  
Figura 46. Modificación de los coeficientes de transferencia de calor en ModelMecanic\_Stirling.

Tabla 15. Simulaciones modificando los coeficientes de transferencia de calor.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td><td>Ue</td><td>u,</td></tr><tr><td>45</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr><tr><td>46</td><td>3</td><td>15</td><td>5</td><td>1000</td><td>1000</td><td>NO</td></tr></table>

![](images/9ce0f7d29e6e445775f0892f8d4513add463770634ff5e25db7e8e34e0c8bf2b.jpg)  
Figura 47. Caso de simulación nº45: velocidad angular.

![](images/dbba28adcf2a2138d290ac49252ae296bf31d896e095ff4385803c3673bb593e.jpg)  
Figura 48. Caso de simulación nº45: temperaturas.

Como se comprueba que funciona, se decide aumentar el valor de UC a 1000. Tras la simulación se observa que esta modificación no es válida, puesto que la máquina no funciona.

i) Aumentar el tiempo de simulación con la modificación de los coeficientes de transferencia de calor

Se pretende comprobar si el motor funciona correctamente durante más tiempo, por lo que se aumenta el intervalo de simulación a 300 segundos, manteniendo la combinación de coeficientes de calor a UC=100 y UF=1000.

Tabla 16. Simulación aumentando el tiempo de simulación y modificando los coeficientes de transferencia de calor.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo simulación (seg)</td><td rowspan="2">Tiempo calentamiento (seg)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td> $\underline { { \mathbf { u } } } _ { \mathsf { c } }$ </td><td> $\overline { { \mathbf { u } _ { r } } }$ </td></tr><tr><td>47</td><td>300</td><td>30</td><td>100</td><td>1000</td><td>SI</td></tr></table>

![](images/a7238d1065136f7df39d1ed7ec8b24ba508e66402da4de30a319448e42faa7e7.jpg)  
Figura 49. Caso de simulación $n ^ { o } 4 7 .$ : velocidad angular.

![](images/6798a20d832c56ff190ee67c804caa05ec6c666a82563a306255e24cd8b8ab4d.jpg)  
Figura 50. Caso de simulación $n ^ { o } 4 7 \cdot$ temperaturas.

Se comprueba que la velocidad angular se mantiene prácticamente constante y se determina que el modelo actual cuenta con unas características que permiten el correcto funcionamiento del motor. Sin embargo, no es un modelo interesante para constituir una máquina con una aplicación real, ya que la velocidad angular es muy baja y oscilante.

Por tanto, se decide que en lugar de modificar esta máquina se procederá a crear un prototipo formado por dos bloques o cuatro bloques, cada uno de los cuales será un motor Stirling en sí, prototipo que proporcionará un funcionamiento continuo. De este modo se podrá caracterizar una máquina que, aunque no sea la más óptima, será una máquina funcional.

## 2.2. Annex 2.2. Desenvolupament d’un prototip

En el apartado anterior se determinaron las características con las que debía contar el modelo del motor Stirling para funcionar adecuadamente, tras una serie de simulaciones llevadas a cabo en Dymola.

A continuación se expondrán los distintos prototipos estudiados para el motor Stirling. Dichos prototipos están basados en la conexión de bloques, dentro de los cuales se encuentra un motor con un pistón de potencia y un desplazador. Las máquinas creadas estarán formadas por dos y cuatro bloques.

### 5.3.1. Máquina de dos bloques

Esta máquina consiste en la conexión de dos motores con un desfase de 180º entre ellos.

En primer lugar, se accede al área de interacción del motor Stirling y se selecciona el bloque llamado stirling, tras lo cual se copia y se pega en la misma pantalla. El nuevo bloque creado se llamará stirling1. A partir de ahora, en esta memoria se conocerá como bloque 1 (o motor 1) al stirling, y bloque 2 (o motor 2) al stirling1.

A continuación se procede a conectar directamente ambos bloques y a averiguar en qué lugar se debe programar el desfase de 180º entre los bloques y el desfase de 90º entre los cilindros que conforman cada bloque.

![](images/7260dd011c5f02662548f7a3dfb80bc26a81bd7e62c729233d41185abd9c0ffc.jpg)  
Figura 51. Conexión de la máquina de dos bloques en el área de interacción del motor Stirling.

Si se da doble click en el bloque del motor 1, se abre una ventana en la que es posible programar el desfase entre el pistón de potencia y el desplazador. Los parámetros modificados son:

• Pistón de potencia: cylinderInclination = 0 deg

• Desplazador: cylinderInclination1 = 90 deg

![](images/4c14b813439d6ddc40f23f9b2310b296ac100dfcc266c754f212ae1bf9441664.jpg)  
Figura 52. Programación del desfase entre pistón de potencia y desplazador del motor

En cuanto al motor 2, el procedimiento es similar. Se accede al bloque stirling1 y se programa tanto el desfase entre los cilindros como el desfase de 180º entre un bloque y otro. Los parámetros a modificar son:

• Pistón de potencia: cylinderInclination = 180 deg

• Desplazador: cylinderInclination1 = 270 deg

![](images/424374c5490d2e3f2bd24b453fdc46c3ba208a740a3b09d46e438b9457bdbf4d.jpg)  
Figura 53. Programación del desfase entre los cilindros del motor 2 y entre el motor 1 y 2.

La siguiente imagen muestra la animación 3D que Dymola genera para el prototipo de máquina de 2 bloques.

![](images/899a703eb28d4f03c2f1f8737a9708bfa133bdbf9254753fb2bc8f5a51be18cb.jpg)  
Figura 54. Visualización 3D de la máquina de 2 bloques.

Una vez conexionados los dos bloques y programados los desfases pertinentes, se procede a simular con Dymola. En el primer intento de simulación, Dymola advierte mediante un mensaje que hay una condición escalar de sobra. Dicha condición escalar sobrante es la inicialización de la posición del cilindro del pistón de potencia de los motores 1 y 2.

En la imagen siguiente se muestra la localización del cilindro del pistón de potencia en el modelo mecánico del motor Stirling implementado.

![](images/f45196d7a8265982a1d17218becb497c25bcfaa8570d3d239a87b2649dd2ce32.jpg)  
Figura 55. Localización del cilindro del pistón de potencia en el área de interacción del ModelMecanic\_Stirling.

Inicialmente, el pistón de potencia de los motores 1 y 2 estaba programado con una posición inicial de 0.09 m. Para que el prototipo de 2 bloques funcione, el pistón de potencia de ambos bloques tiene que estar inicializado a 0 m.

A continuación se presenta la modificación de dicha condición, que consiste en abrir la ventana del cilindro de potencia del motor 1 y del motor 2 y eliminar la selección de la inicialización de posición, s.start. Como se puede observar en la imagen, no hay ningún tick marcado en la casilla.

![](images/88090a21d1596f454458f75b6c5d2280cf22fd6fa859b3d5f47629c1a76b1dd8.jpg)  
Figura 56. Modificación de la inicialización de posición del cilindro de potencia.

Una vez programada la modificación anterior se procede a simular la máquina con las condiciones establecidas en el apartado anterior, las cuales aparecen recogidas en la siguiente tabla:

Tabla 177. Simulación de la máquina con 2 bloques con las condiciones establecidas.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>48</td><td>2</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 18. (Continuación) Simulación de la máquina con 2 bloques con las condiciones establecidas.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>(seg)</td><td>Duración Altura</td><td>Uc</td><td>UF</td></tr><tr><td>48</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr></table>

![](images/1cc780971168170eeb1235c8ff4954191e27199f33c2607469426968f0ce9463.jpg)  
Figura 57. Caso de simulación nº48: velocidad angular.

En la siguiente gráfica aparecen representadas las temperaturas de los focos caliente y frío de ambos motores.

• Motor 1: Azul= TC, Rojo= TF

• Motor 2: Verde= TC, Fuccia= TF

![](images/835b1e0300f6d90d4ac213baa5b28d359a665b31ac87da16a11be4fa7a1af3fc.jpg)  
Figura 58. Caso de simulación nº48: temperaturas.

La siguiente simulación llevada a cabo incluye la modificación del tiempo de simulación, para observar si la máquina funciona correctamente durante 300 segundos.

Tabla 18. Simulación de la máquina con 2 bloques aumentando el tiempo de simulación.
<table><tr><td>Caso simulación</td><td>Nº bloques</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>49</td><td>2</td><td>300</td><td>30</td><td>500</td></tr></table>

Tabla 19. (Continuación) Simulación de la máquina de 2 bloques aumentando el tiempo de simulación.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td><td>Uc</td><td>UF</td></tr><tr><td>49</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr></table>

![](images/3db4209ab930e5fed193d50d7a9604e9227da2b1888ad9789eea456b18592b5c.jpg)  
Figura 59. Caso de simulación nº49: velocidad angular.

![](images/e866ef4b798459840a88489da554edc2fb7daf7050b2dd54225492f81269a839.jpg)  
Figura 60. Caso de simulación nº49: temperaturas.  
Como se puede observar en las graficas anteriores, el motor Stirling de dos bloques funciona correctamente durante 300 segundos.

A continuación se compararán las simulaciones realizadas para la máquina de 1 bloque y para la máquina de 2 con las mismas condiciones, de modo que se puedan analizar las mejoras que trae consigo el motor de dos bloques.

![](images/884471408c015f965d2f431018a1024b35b6d0c67eea0771b4bb5f4bbc25af26.jpg)  
Figura 61. Comparación de la máquina de 1 bloque (azul) y 2 bloques (rojo): velocidad angular.

La gráfica anterior muestra que la máquina de 2 bloques presenta una velocidad angular mucho más estable, con menos oscilaciones que la del motor de 1 solo bloque. Además, el valor medio de la velocidad coincide en ambos motores.

Por tanto, queda comprobado que la creación de un motor Stirling con dos bloques es una mejora considerable, ya que se consigue una mayor estabilidad en el sistema.

La siguiente gráfica compara las temperaturas de los focos de la máquina de 1 bloque y la máquina de 2 bloques:

• Máquina de 1 bloque: Azul= TC, Rojo= TF

• Máquina de 2 bloques:

Motor 1: Verde= TC, Fuccia= TF

Motor 2: Negro= TC, Azul x= TF

![](images/ad2eeae9d1f4b8ee0ce3a2fb04bdff29feb61bcab3df93016ecbb5d1d03c97c9.jpg)  
Figura 62. Comparación de la máquina de 1 bloque y 2 bloques: temperaturas.

La temperatura del foco caliente del motor con un bloque oscila mucho más que la del motor con dos bloques. Sin embargo, el motor con 1 bloque alcanza una temperatura de foco caliente más elevada.

En cuanto a la temperatura del foco frío, ambas máquinas presentan oscilaciones similares y un valor medio de temperatura semejante.

La siguiente modificación que se le aplica al modelo es la de establecer los focos de temperatura TC y TF fuera de los bloques de los motores.

Se procede a eliminar los bloques de los focos de dentro de los motores y ponerlos en el área de interacción global.

A continuación se crean dos conectores para TC y TF dentro de cada bloque del motor. Para ello se tiene que sacar una línea de conexión del punto de entrada de temperatura en el modelo termodinámico y, con el botón derecho, seleccionar Create connector. De este modo se generan dos conectores de forma triangular en el área de interacción global. Dichos conectores se tienen que conectar a los bloques de temperatura TC y TF, tras lo cual se dispone de un modelo que funciona exactamente igual que en el caso anterior, pero que permite una modificación de la temperatura de los focos mucho más sencilla y práctica.

![](images/ec3323d86f5ec5e26a5f360e976fc95118ab9c03c80dd2c1bf269751c27945f6.jpg)  
Figura 63. Conexión de la máquina de dos bloques en el área de interacción del motor Stirling con los focos de temperatura fuera de los blogues de los motores.

Como ya se ha comentado anteriormente, el objetivo de este proyecto es obtener un modelo funcional del motor Stirling que produzca una potencia adecuada para su uso en la vida real. Por tanto, es interesante conocer la potencia generada por el modelo creado hasta el momento. Para ello se analizará la potencia obtenida en el componente Damper, el cual aplica el rozamiento al eje del motor. El valor actual del Damper es d=0.01.

![](images/8bf0e135e630333bbae97f4aeca4f26009f5db0bd91674971f97e6547737a178.jpg)  
Figura 64. Potencia de la máquina de 2 bloques para d=0.01.

En la gráfica anterior se puede comprobar que la potencia obtenida es muy baja, alrededor de unos 0.2 W. Como esta potencia no es la deseada, se procederá a aumentar paulatinamente el valor del Damper y analizar la potencia generada.

Tabla 20. Simulaciones de la máquina de 2 bloques variando el Damper.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación (seg)</td><td>Damper</td><td>Potencia generada LossPower (W)</td><td>Funciona (SI/NO)</td></tr><tr><td>50</td><td>2</td><td>300</td><td>0.1</td><td>1.5</td><td>SI</td></tr><tr><td>51</td><td>2</td><td>300</td><td>0.5</td><td>5</td><td>SI</td></tr><tr><td>52</td><td></td><td>300</td><td>1</td><td>0</td><td>NO</td></tr><tr><td>53</td><td></td><td>300</td><td>0.6</td><td>5.2</td><td>SI</td></tr><tr><td>54</td><td>2 2 2</td><td>300</td><td>0.8</td><td>7</td><td>SI</td></tr></table>

![](images/1948f9d3b36836e7d08cfeb5f9313271750d64da147b401fad6fa5d6313f3f38.jpg)  
Figura 65. Caso de simulación nº50: potencia generada.

![](images/13fe97b4da8c02408c6278e658ca4bdcdb69bec03bfc5363ce204aeeaf6e15d6.jpg)

Figura 66. Caso de simulación nº51: potencia generada.  
![](images/b82397c0bc0da78bf210671a069ee7073578fe008542483b42298d263ade14b3.jpg)  
Figura 67. Caso de simulación nº52: potencia generada.

![](images/4f2a3f5b174ebc522f391425c24bbe1d3f56bf1b046fdc5130da47be158aa666.jpg)  
Figura 68. Caso de simulación nº53: potencia generada.

![](images/7536e951c0ad872467d2e7a4201b640aa8e9faee73f83a597c7df2e3f678331a.jpg)  
Figura 69. Caso de simulación nº54: potencia generada.

En la tabla anterior aparece recogida la potencia generada por la máquina para cada caso. Con un valor de 0.8 en el Damper se obtiene una potencia media de 7W. Sin embargo, se puede observar que la potencia generada no es constante y el valor obtenido no es suficiente para que el motor Stirling pueda ser competente en la vida real.

Por otro lado, la velocidad del motor es muy baja, alrededor de una vuelta por segundo. Si la máquina con 2 bloques fuese más revolucionada, no sería necesario configurar una nueva máquina de 4 bloques. Sin embargo, debido a la lentitud de la máquina de 2 bloques se decide crear un modelo de motor de 4 para obtener una potencia más adecuada.

Debido a esto se decide comenzar a simular con un motor de 4 bloques, con el objetivo de obtener un funcionamiento más continuo y una semejanza a un motor de un vehículo (motor de 4 tiempos).

### 5.3.1. Máquina de cuatro bloques

Siguiendo el procedimiento aplicado para la creación del modelo de la máquina de dos bloques, se creará un nuevo modelo para el motor de cuatro bloques. Dicho modelo estará programado con los focos de temperatura externos a los bloques de los motores. Además, será necesario establecer los desfases existentes entre cada uno de los bloques.

![](images/8db73feb111f2cdd5fe608c221a843a0c48f1c102c0c0449e8c4755d3ca2f2bc.jpg)  
Figura 70. Conexión de la máquina de cuatro bloques en el área de interacción del motor Stirling.

A continuación se programarán los desfases entre los cilindros de cada uno de los motores y el desfase existente entre los bloques.

Los parámetros modificados para el motor 1 son:

• Pistón de potencia: cylinderInclination = 0 deg

• Desplazador: cylinderInclination1 = 90 deg

![](images/1abd0c3c6c021ebdf5b6f6a99f5789d6e210024c6757694e3ce252c93c8a9dd3.jpg)  
Figura 71. Programación del desfase entre el pistón de potencia y el desplazador del motor 1.

Los parámetros modificados para el motor 2 son:

• Pistón de potencia: cylinderInclination = 90 deg

• Desplazador: cylinderInclination1 = 180 deg

![](images/fd0429aee85324e6c6eee0735af4c5944531d7c3dff819769f6fde823616768d.jpg)  
Figura 72. Programación del desfase entre los cilindros del motor 2 y entre el motor 1 y 2.

Los parámetros modificados para el motor 3 son:

• Pistón de potencia: cylinderInclination = 180 deg

• Desplazador: cylinderInclination1 = 270 deg

![](images/1d645c83c748a239f0d3a4365605fc5572d4eb53e8dd1fe0ceea0069c74415dd.jpg)  
Figura 73. Programación del desfase entre los cilindros del motor 3 y entre el motor 2 y 3.

Los parámetros modificados para el motor 4 son:

• Pistón de potencia: cylinderInclination = 270 deg

• Desplazador: cylinderInclination1 = 360 deg

![](images/c6dfe17d795671e89cb430abb0d327c5362d41ccccefc6e9d3f7a83dbe45626f.jpg)  
Figura 74. Programación del desfase entre los cilindros del motor 4 y entre el motor 3 y 4.

En la imagen siguiente se puede observar la visualización en 3D del prototipo de máquina de 4 bloques en la animación que Dymola genera.

![](images/64f4d0d129137cac4864d302d7d973bcabb6088065820c1ffe35e676d3d42918.jpg)  
Figura 75. Visualización 3D de la máquina de 4 bloques.

A continuación se realizarán una serie de simulaciones variando el valor del Damper y analizando la velocidad angular resultante y la potencia generada. Tras dichas simulaciones se tratará de caracterizar la curva de potencia de la máquina de 4 bloques.

Tabla 21. Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td rowspan=1 colspan=1>Casosimulación</td><td rowspan=1 colspan=1>Nºbloques</td><td rowspan=1 colspan=1>Tiemposimulación(seg)</td><td rowspan=1 colspan=1>Tiempocalentamiento(seg)</td><td rowspan=1 colspan=1>Altura rampatemperatura(K)</td></tr><tr><td rowspan=1 colspan=1>55</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>80</td><td rowspan=1 colspan=1>30</td><td rowspan=1 colspan=1>500</td></tr><tr><td rowspan=1 colspan=1>56</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>300</td><td rowspan=1 colspan=1>30</td><td rowspan=1 colspan=1>500</td></tr><tr><td rowspan=1 colspan=1>57</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>80</td><td rowspan=1 colspan=1>30</td><td rowspan=1 colspan=1>500</td></tr></table>

Tabla 22. (Continuación) Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td rowspan=1 colspan=1>Caso</td><td rowspan=1 colspan=1>Rampa acele</td><td rowspan=1 colspan=1>ración</td><td rowspan=1 colspan=1>Momento de</td><td rowspan=1 colspan=2>Coeficientestransferencia calor</td></tr><tr><td rowspan=2 colspan=1>simulación</td><td rowspan=1 colspan=1>Duración</td><td rowspan=1 colspan=1>Altura</td><td rowspan=2 colspan=1>inercia (kg/m²)</td><td rowspan=2 colspan=1>Ue</td><td rowspan=2 colspan=1>U</td></tr><tr><td rowspan=1 colspan=1>(seg)</td><td rowspan=1 colspan=1></td></tr><tr><td rowspan=1 colspan=1>55</td><td rowspan=1 colspan=1>3</td><td rowspan=1 colspan=1>15</td><td rowspan=1 colspan=1>5</td><td rowspan=1 colspan=1>100</td><td rowspan=1 colspan=1>1000</td></tr><tr><td rowspan=1 colspan=1>56</td><td rowspan=1 colspan=1>3</td><td rowspan=1 colspan=1>15</td><td rowspan=1 colspan=1>5</td><td rowspan=1 colspan=1>100</td><td rowspan=1 colspan=1>1000</td></tr><tr><td rowspan=1 colspan=1>57</td><td rowspan=1 colspan=1>3</td><td rowspan=1 colspan=1>15</td><td rowspan=1 colspan=1>5</td><td rowspan=1 colspan=1>100</td><td rowspan=1 colspan=1>1000</td></tr></table>

Tabla 23. (Continuación) Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td rowspan=1 colspan=3>Caso                       Potencia generadaDampersimulación                     LossPower (W)</td><td rowspan=1 colspan=1>Velocidadangular(rad/s)</td><td rowspan=1 colspan=1>Funciona(SI/NO)</td></tr><tr><td rowspan=1 colspan=1>55</td><td rowspan=1 colspan=1>0.5</td><td rowspan=1 colspan=1>3,8</td><td rowspan=1 colspan=1>2,8</td><td rowspan=1 colspan=1>SI</td></tr><tr><td rowspan=1 colspan=1>56</td><td rowspan=1 colspan=1>1.0</td><td rowspan=1 colspan=1>5,6</td><td rowspan=1 colspan=1>2,4</td><td rowspan=1 colspan=1>SI</td></tr><tr><td rowspan=1 colspan=1>57</td><td rowspan=1 colspan=1>1.5</td><td rowspan=1 colspan=1>7,2</td><td rowspan=1 colspan=1>2,2</td><td rowspan=1 colspan=1>SI</td></tr><tr><td rowspan=1 colspan=1>58</td><td rowspan=1 colspan=1>2.0</td><td rowspan=1 colspan=1>8,2</td><td rowspan=1 colspan=1>2,0</td><td rowspan=1 colspan=1>SI</td></tr></table>

Las gráficas siguientes representan la velocidad angular y la potencia generada para cada una de las simulaciones anteriores.

![](images/20ebeadb18353370e5fc280caac115b6c61419914a1b5f3a68a7573967cab673.jpg)  
Figura 76. Caso de simulación $n ^ { o } 5 5 \colon$ velocidad angular.

![](images/32985c735527cd2ed8d0d012c578e80e424de92ab67d3c36f596f5a782809ba8.jpg)

Figura 77. Caso de simulación nº55: potencia generada.  
![](images/5f372c1bc6bce858319fa9e9562db21257b51a49ffb6cc401a2ba90e117de5dd.jpg)  
Figura 78. Caso de simulación nº56: velocidad angular.

![](images/df791f2f4e1a22d847742629400decd8a2cd167e87de68f2ae2f61b031e655a0.jpg)  
Figura 79. Caso de simulación nº56: potencia generada.

![](images/20cd6ec1ba61409584380dfd43501d891afdd110929a142561ece43ddd8f1366.jpg)  
Figura 80. Caso de simulación nº57: velocidad angular.

![](images/b0815b535cec3c8c26e0dcb1589c186458d48e63e5cbb9618a9a937d10eeaf05.jpg)  
Figura 81. Caso de simulación nº57: potencia generada.

![](images/1802441bf377d7a2a6edf2145002310bb7d1532ed5645cb58e456c66abf40b02.jpg)  
Figura 82. Caso de simulación nº58: velocidad angular.

![](images/dddcdd2e0f91340f93898cfbc6c91ab13af7c04fad45063a2444efce30a72f2d.jpg)  
Figura 83. Caso de simulación nº58: potencia generada.

Para poder definir más a fondo la máquina que se está diseñando, se tratará de elaborar una curva característica aproximada de la potencia generada por este modelo.

![](images/8bab55b6ee4790c76ea1b76e40452ec3afd285674ae790d84207ec524d87a9cc.jpg)  
Figura 84. Curva característica de potencia de la máquina de 4 bloques.

Tal y como se aprecia en la curva característica realizada, la máquina con 4 bloques puede soportar dampers más grandes y proporcionar más potencia que la máquina de 2 bloques, la cual con un damper de 1 ya no funciona correctamente.

La curva característica proporciona una buena visión de conjunto de la máquina en si, por lo que en estudios posteriores se realizará un barrido para distintos valores de dámper y se obtendrán varios puntos de velocidad angular y potencia promedios, con los cuales se podrá determinar una curva característica mucho más fiable.