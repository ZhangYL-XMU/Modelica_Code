# TRABAJO DE FINAL DE GRADO

![](images/769c8d0a76b7ccc42d56135b499e468e6c1c522c863e0be207a95b2a69e6e6f7.jpg)

Barcelona, 11 de Junio de 2014

Tutor proyecto: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE GENERAL

# ÍNDICE MEMORIA

Índice memoria ...   
Índice de figuras.....   
Índice de tablas....   
Resumen ...   
Resum...   
Abstract ..   
Agradecimientos ...   
CAPÍTULO 1: Justificación, objetivos y alcance.......   
1.1. Justificación .   
1.2. Objetivos..   
1.2.1. Objetivo general ...   
1.2.2. Objetivos específicos .....   
1.3. Alcance.....   
CAPÍTULO 2: Introducción....   
CAPÍTULO 3: Dymola....   
3.1. Modelización ..   
3.2. Simulación ...   
CAPÍTULO 4: Motor Stirling ..   
4.1. Descripción general....   
4.2. Configuraciones ...   
4.2.1. Configuración Alpha...   
4.2.2. Configuración Beta ..   
4.2.3. Configuración Gamma...   
4.3. Ciclo termodinámico...   
4.4. Funcionamiento ...   
CAPÍTULO 5: Modelización del motor Stirling   
5.1. Estado previo .   
5.1.1. Modelo mecánico..   
5.1.2. Modelo termodinámico .   
5.2. Verificación del modelo ..   
5.2.1. Inicio de las simulaciones.   
5.2.2. Simulaciones de inercia y temperatura..   
5.2.3. Simulaciones del sistema de arranque y temperatura .   
5.2.4. Modificación de la fuerza.   
5.2.5. Sistema de arranque forzado ..   
5.3. Desarrollo de un prototipo .   
5.3.1. Máquina de dos bloques ..   
5.3.2. Máquina de cuatro bloques ...   
CAPÍTULO 6: Conclusiones   
CAPÍTULO 7: Futuras Mejoras.   
CAPÍTULO 8: Bibliografía..   
8.1. Referencias de bibliografía.   
8.2. Bibliografía de consulta..   
8.3. Bibliografía de imágenes.

# ÍNDICE PRESUPUESTO

Índice presupuesto ...   
Capítulo 1: Presupuesto   
Capítulo 2: Bibliografía..   
2.1. Bibliografía de consulta...

# ÍNDICE ANEXOS

Índice anexos...   
Capítulo 1: Anexo A. Resumen TFG Albert García ...   
1.1. Anexo A.1. Modelo mecánico ..   
1.2. Anexo A.2. Modelo termodinámico .   
Capítulo 2: Anexo B. Resultados ...   
2.1. Anexo B.1. Tabla global simulaciones apartado 5.2. Verificación   
del modelo. .   
2.2. Anexo B.2. Gráficas apartado 5.2. Verificación del modelo. ...

![](images/3da0a47a8a59ddaee5c610530f8d01afeea94a7f56a528e552441cc007f6162f.jpg)  
Barcelona, 11 de Junio de 2014

Director: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE MEMORIA

Índice memoria   
Índice de figuras.   
Índice de tablas.   
Resumen   
Resum.   
Abstract .8   
Agradecimientos.. 9   
CAPÍTULO 1: Justificación, objetivos y alcance.... 11   
1.1. Justificación .11   
1.2. Objetivos.. 11   
1.2.1. Objetivo general . 11   
1.2.2.Objetivos específicos 12   
1.3. Alcance. 12   
CAPÍTULO 2: Introducción.. 13   
CAPÍTULO 3: Dymola .... .15   
3.1. Modelización .16   
3.2. Simulación .. .18   
CAPÍTULO 4: Motor Stirling 21   
4.1. Descripción general. .21   
4.2. Configuraciones .. .23   
4.2.1. Configuración Alpha.. .23   
4.2.2. Configuración Beta .23   
4.2.3. Configuración Gamma. .24   
4.3. Ciclo termodinámico.. .25   
4.4. Funcionamiento . .26   
CAPÍTULO 5: Modelización del motor Stirling ... .31   
5.1. Estado previo .. .31   
5.1.1. Modelo mecánico. .31   
5.1.2.Modelo termodinámico .34   
5.2.Verificación del modelo. .40   
5.2.1. Inicio de las simulaciones. .40   
5.2.2. Simulaciones de inercia y temperatura.. 40   
5.2.3. Simulaciones del sistema de arranque y temperaturas. ..42   
5.2.4. Modificación de la fuerza .. 45   
5.2.5. Sistema de arranque forzado . 45   
5.3. Desarrollo de un prototipo. 59   
5.3.1. Máquina de dos bloques. .59   
5.3.2. Máquina de cuatro bloques. ..70   
CAPÍTULO 6: Conclusiones 81   
CAPÍTULO 7: Futuras Mejoras. 83   
CAPÍTULO 8: Bibliografía.. 85   
8.1. Referencias de bibliografía . ..85   
8.2. Bibliografía de consulta.. .85   
8.3. Bibliografía de imágenes.. ..87

# ÍNDICE DE FIGURAS

Figura 1. Colector solar con motor Stirling [1].. 14   
Figura 2. Características CPU del PC186. .16   
Figura 3. Entorno de modelización de Dymola. .16   
Figura 4. Entorno de simulación de Dymola. .19   
Figura 5. Motor Stirling de configuración Alpha [2]. .23   
Figura 6. Motor Stirling de configuración Beta [2]. .. ..24   
Figura 7. Motor Stirling de configuración Gamma [2]. .24   
Figura 8. Ciclo Stirling [3]. .25   
Figura 9. Inicio de la disminución de presión del sistema. . ..26   
Figura 10. Enfriamiento máximo del aire. .27   
Figura 11. Inicio del calentamiento del gas. .27   
Figura 12. Calentamiento máximo del aire. .28   
Figura 13. Ciclo Stirling real [4]. .. .29   
Figura 14. Componentes de un pistón modelados en Dymola. ..32   
Figura 15. Área de interacción del ModelMecanic\_Test. ..33   
Figura 16. Animación 3D del modelo mecánico. .33   
Figura 17. Inicio de la reducción de presión del sistema. . ..35   
Figura 18. Enfriamiento máximo del aire. ..35   
Figura 19. Inicio del calentamiento del gas. .36   
Figura 20. Calentamiento máximo del aire. ..36   
Figura 21. Área de interacción del ModelVolums\_Test. .37   
Figura 22. Área de interacción del ModelTermodinamic\_Test.. .38   
Figura 23. Área de interacción del Motor\_Stirling. ..39   
Figura 24. Componentes para el test del Motor\_Stirling. ..39   
Figura 25. Caso de simulación nº4: velocidad angular. ..41   
Figura 26. Caso de simulación nº8: velocidad angular. .42   
Figura 27. Caso de simulación nº12: velocidad angular. .43   
Figura 28. Comparación de casos nº8 y nº10: velocidad angular. .43   
Figura 29. Comparación de casos nº8 (arriba) y nº10 (abajo): temperaturas..44   
Figura 30. Comparación de casos nº8 (arriba) y nº10 (abajo): transferencias de   
calor. .44   
Figura 31. Modificación de la ecuación de la fuerza resultante en el código del   
modelo termodinámico. ..45   
Figura 32. Caso de simulación nº16: velocidad angular. ..46   
Figura 33. Caso de simulación nº16: presión. ...47   
Figura 34. Caso de simulación nº16: fuerza. ..47   
Figura 35. Caso de simulación nº24: velocidad angular. ..48   
Figura 36. Caso de simulación nº25: velocidad angular. ...49   
Figura 37. Caso de simulación nº27: velocidad angular. ...50   
Figura 38. Caso de simulación nº29: velocidad angular. ...50   
Figura 39. Caso de simulación nº34: velocidad angular. ...51   
Figura 40. Caso de simulación nº42: velocidad angular. ...52   
Figura 41. Caso de simulación nº42: temperaturas. ..52   
Figura 42. Caso de simulación nº43: velocidad angular. ...53   
Figura 43. Caso de simulación nº43: temperaturas. ...54   
Figura 44. Caso de simulación nº44: velocidad angular. ..55   
Figura 45. Caso de simulación nº44: temperaturas. ..55   
Figura 46. Modificación de los coeficientes de transferencia de calor en   
ModelMecanic\_Stirling. .56   
Figura 47. Caso de simulación nº45: velocidad angular. ..56   
Figura 48. Caso de simulación nº45: temperaturas. ..57   
Figura 49. Caso de simulación nº47: velocidad angular. ..58   
Figura 50. Caso de simulación nº47: temperaturas. ...58   
Figura 51. Conexión de la máquina de dos bloques en el área de interacción del   
motor Stirling. 59   
Figura 52. Programación del desfase entre pistón de potencia y desplazador del   
motor 1. .60   
Figura 53. Programación del desfase entre los cilindros del motor 2 y entre el   
motor 1 y 2. ..61   
Figura 54. Visualización 3D de la máquina de 2 bloques. ..61   
Figura 55. Localización del cilindro del pistón de potencia en el área de   
interacción del ModelMecanic\_Stirling. .62   
Figura 56. Modificación de la inicialización de posición del cilindro de potencia.62   
Figura 57. Caso de simulación nº48: velocidad angular. .63   
Figura 58. Caso de simulación nº48: temperaturas. ..64   
Figura 59. Caso de simulación nº49: velocidad angular. ..65   
Figura 60. Caso de simulación nº49: temperaturas. .65   
Figura 61. Comparación de la máquina de 1 bloque (azul) y 2 bloques (rojo):   
velocidad angular. .66   
Figura 62. Comparación de la máquina de 1 bloque y 2 bloques: temperaturas.   
..66   
Figura 63. Conexión de la máquina de dos bloques en el área de interacción del   
motor Stirling con los focos de temperatura fuera de los bloques de los motores.   
..67   
Figura 64. Potencia de la máquina de 2 bloques para d=0.01. . ... 68   
Figura 65. Caso de simulación nº50: potencia generada. ...68   
Figura 66. Caso de simulación nº51: potencia generada. ..69   
Figura 67. Caso de simulación nº52: potencia generada. ... 69   
Figura 68. Caso de simulación nº53: potencia generada.. ... 69   
Figura 69. Caso de simulación nº54: potencia generada. ..70   
Figura 7o. Conexión de la máquina de cuatro bloques en el área de interacción   
del motor Stirling. ... ..71   
Figura 71. Programación del desfase entre el pistón de potencia y el   
desplazador del motor 1. .72   
Figura 72. Programación del desfase entre los cilindros del motor 2 y entre el   
motor 1 y 2. .72   
Figura 73. Programación del desfase entre los cilindros del motor 3 y entre el   
motor 2 y 3.. ..73   
Figura 74. Programación del desfase entre los cilindros del motor 4 y entre el   
motor 3 y 4.. ...74   
Figura 75. Visualización 3D de la máquina de 4 bloques. ...74   
Figura 76. Caso de simulación nº55: velocidad angular. ...76   
Figura 77. Caso de simulación nº55: potencia generada. ...76   
Figura 78. Caso de simulación nº56: velocidad angular. ...77   
Figura 79. Caso de simulación nº56: potencia generada. ...77   
Figura 80. Caso de simulación nº57: velocidad angular. .. ...77   
Figura 81. Caso de simulación nº57: potencia generada.. ...78   
Figura 82. Caso de simulación nº58: velocidad angular. ...78   
Figura 83. Caso de simulación nº58: potencia generada. ...79   
Figura 84. Curva característica de potencia de la máquina de 4 bloques. .......79

# ÍNDICE DE TABLAS

Tabla 1. Simulaciones modificando la temperatura de los focos. .40   
Tabla 2. Simulaciones modificando el volante de inercia. .41   
Tabla 3. Simulaciones del funcionamiento de la máquina debido al motor de   
arranque. .42   
Tabla 4. Simulaciones modificando la rampa de temperatura y la fuerza.......45   
Tabla 5. Simulación sin sistema de arranque forzado. .46   
Tabla 6. (Continuación) Simulación sin sistema de arranque forzado. ... 46   
Tabla 7. Simulaciones modificando el sistema de arranque forzado. .48   
Tabla 8. Simulaciones modificando la rampa de aceleración. .49   
Tabla 9. Simulaciones aumentando el tiempo de calentamiento y modificando la   
rampa de aceleración. .51   
Tabla 10. Simulaciones aumentando el tiempo de simulación y la altura de la   
rampa de aceleración. .52   
Tabla 11. Simulación aumentando la temperatura del foco caliente. ..53   
Tabla 12. (Continuación) Simulación aumentando la temperatura del foco   
caliente. .53   
Tabla 13. Simulación aumentando el momento de inercia. ..54   
Tabla 14. (Continuación) Simulación aumentando el momento de inercia. ...... 54   
Tabla 15. Simulaciones modificando los coeficientes de transferencia de calor. 56   
Tabla 16. Simulación aumentando el tiempo de simulación y modificando los   
coeficientes de transferencia de calor. .57   
Tabla 17. Simulación de la máquina con 2 bloques con las condiciones   
establecidas. .63   
Tabla 18. Simulación de la máquina con 2 bloques aumentando el tiempo de   
simulación. .64   
Tabla 19. (Continuación) Simulación de la máquina de 2 bloques aumentando el   
tiempo de simulación. ..64   
Tabla 20. Simulaciones de la máquina de 2 bloques variando el Damper. ....... 68   
Tabla 21. Simulaciones de la máquina de 4 bloques variando el Damper. ......75   
Tabla 22. (Continuación) Simulaciones de la máquina de 4 bloques variando el   
Damper. .75   
Tabla 23. (Continuación) Simulaciones de la máquina de 4 bloques variando el   
Damper. 75

# RESUMEN

Este proyecto tiene como objetivo diseñar un laboratorio virtual del motor Stirling que permita optimizar su dimensionado mediante el software Dymola. El cometido es reproducir el comportamiento del motor partiendo de los procesos básicos que ocurren en él, simulando de manera dinámica la conducta de sus diferentes elementos. Esta herramienta está diseñada para que una persona interesada en el motor Stirling pueda llevar a cabo un anteproyecto de estudio de la máquina antes de desarrollar un prototipo real.

El presente estudio tiene como punto de partida el trabajo previo de otro estudiante, el cual consiguió desarrollar un modelo semi-funcional del motor Stirling. El objetivo actual es ampliar su trabajo hasta obtener un modelo completamente funcional con un sistema termodinámico adecuado, lo cual permita realizar un análisis de la sensibilidad de las variables. Por otro lado, un análisis paramétrico permitirá mejorar las características básicas de la máquina para aumentar su rendimiento. El objetivo a largo plazo de este proyecto es la construcción de un prototipo real del motor Stirling con una potencia de 500 W.

# RESUM

Aquest projecte té com a objectiu dissenyar un laboratori virtual del motor Stirling que permeti optimitzar el seu dimensionament mitjançant el software Dymola. La comesa és reproduir el comportament del motor partint dels processos bàsics que succeeixen en ell, simulant de manera dinàmica la conducta dels seus diferents elements. Aquesta eina està dissenyada perquè una persona interessada en el motor Stirling pugui dur a terme un avantprojecte d'estudi de la màquina abans de desenvolupar un prototip real.

El present estudi té com a punt de partida el treball previ d'un altre estudiant, el qual va aconseguir desenvolupar un model semi-funcional del motor Stirling. L'objectiu actual és ampliar el seu treball fins a obtenir un model completament funcional amb un sistema termodinàmic adequat, la qual cosa permeti realitzar una anàlisi de la sensibilitat de les variables. D'altra banda, una anàlisi paramètrica permetrà millorar les característiques bàsiques de la màquina per augmentar el seu rendiment. L'objectiu a llarg termini d'aquest projecte és la construcció d'un prototip real del motor Stirling amb una potència de 500 W.

# ABSTRACT

Currently I am working on my thesis project named "Study and modelling of a Stirling engine". This project aims to design a virtual laboratory of the Stirling engine for its sizing optimization using Dymola. The purpose is to simulate the behaviour of the engine starting from the basic processes that occur in it by dynamically simulating the behaviour of its different elements in Dymola. This tool is designed so that anyone who is interested in the Stirling engine can make a draft to study the behaviour of the machine before carrying out an actual prototype.

The starting point of my project is the previous work of another student who managed to developed a semi-functional model of a Stirling engine. My intention is to expand his work to get a fully functional model with a proper thermodynamic system for a further analysis of the sensitivity of the variables. Therefore, the performance of a comprehensive parametric analysis will make it possible to improve the basic characteristics of the engine in order to enhance its performance. Interestingly, the long-term goal of this project is to build a real prototype of a Stirling engine with a power of 500 W.

# AGRADECIMIENTOS

Agradecer en primer lugar a mi familia y amigos, cuyo respaldo y apoyo incondicional me han acompañado a lo largo de mis estudios, tanto en los momentos de ilusión como de frustración.

Dar las gracias también a mi tutor Joan Grau, por implicarme en un proyecto con aplicación real y con una vertiente sostenible, aspecto que siempre me ha motivado y ha reforzado la elección de mi especialidad. Me ha servido de guía durante la investigación, haciéndome participe de su experiencia y motivándome a alcanzar los objetivos día tras día.

Finalmente, agradecer a la EUETIB por los medios de trabajo que ha puesto a mi disposición para la realización de este trabajo final de grado.

# CAPÍTULO 1: JUSTIFICACIÓN, OBJETIVOS Y ALCANCE

## 1.1. Justificación

Hoy en día la investigación sobre el motor Stirling y sus posibles aplicaciones no está muy desarrollada, ya que los motores y combustibles convencionales han ganado terreno a lo largo de las décadas. Además, no se ha obtenido un motor lo suficientemente pequeño y potente para reemplazar a otras tecnologías en muchas aplicaciones, como en la automoción. Sin embargo, comienza a verse una tendencia al uso de energías renovables y una implementación de medidas de ahorro energético. En este ámbito, el motor Stirling se presenta como una alternativa tecnológica sostenible que se está comenzando a implementar principalmente en pequeñas centrales de energía solar termoeléctrica para poblaciones aisladas.

Si el desarrollo de esta tecnología cobra más importancia en los próximos años, ésta se podrá convertir en una alternativa competente en muchas áreas, como en la generación eléctrica o en la automoción de vehículos.

## 1.2. Objetivos

### 1.2.1. Objetivo general

El objetivo general de este trabajo final de grado consiste en diseñar un laboratorio virtual del motor Stirling, mediante el software Dymola, que permita optimizar su dimensionado. El propósito es obtener, partiendo de un modelo semi-funcional del motor, un prototipo completamente funcional con una característica de potencia que sea competente frente a otras tecnologías actuales.

1.2.2. Objetivos específicos

• Comprender el funcionamiento mecánico y termodinámico del motor.

• Adquirir conocimientos de programación y simulación con la herramienta Dymola.

• Estudiar la modelización del motor en su estado previo y evaluarla en busca de errores que imposibilitan su correcto funcionamiento.

• Desarrollar un exhaustivo proceso de simulación con el objetivo de obtener un modelo funcional de la máquina.

• Diseñar un prototipo de motor más estable y con mayor generación de potencia.

Sentar las bases para futuras mejoras de la máquina en proyectos posteriores, tales como un análisis paramétrico de las variables que más influyen en el funcionamiento de la máquina.

## 1.3. Alcance

El proyecto comienza con una introducción sobre el contexto histórico del motor Stirling, desde su invención hasta la actualidad, haciendo referencia a sus distintas aplicaciones a lo largo de los años.

A continuación se presenta un capítulo que describe el funcionamiento del software Dymola, dividido en un apartado de modelización y otro de simulación, donde se explican las distintas partes del área de interacción con el usuario.

En el tercer capítulo se lleva a cabo una descripción general del motor Stirling y se analizan sus distintas configuraciones. Por otro lado, se describe el ciclo termodinámico y se explica etapa a etapa el funcionamiento del motor.

El siguiente capítulo se corresponde con el cuerpo y desarrollo del presente proyecto. En él se comienza analizando el estado previo del modelo del motor Stirling, estudiando sus características más importantes. Posteriormente, se describe el proceso de simulación llevado a cabo para obtener el modelo funcional del motor Stirling, ayudándose de tablas y gráficas de los resultados más importantes. Finalmente, se analiza el proceso de obtención de un prototipo funcional de la máquina. Para ello se explica la creación de los distintos prototipos estudiados y las simulaciones realizadas. Los resultados se analizan y se concluye determinando el prototipo más viable.

A continuación se presentan las conclusiones extraídas tras la realización del proyecto y las futuras mejoras planteadas.

Finalmente se recoge la bibliografía referenciada y consultada a lo largo de la ejecución del proyecto.

La duración del presente trabajo de fin de grado es de cuatro meses, por lo que no se dispone del tiempo suficiente para cumplir el objetivo general en su totalidad. Sin embargo, se llevan a cabo todos los objetivos específicos y se establecen las directrices para futuros proyectos que terminen por desarrollar un prototipo real del motor Stirling con una potencia de 500 W.

# CAPÍTULO 2: INTRODUCCIÓN

A principios del siglo XIX la revolución industrial comenzó a cobrar protagonismo. La máquina de vapor, que ya contaba con algunos años de desarrollo, constituyó el símbolo de esta etapa histórica. Sin embargo, estas máquinas eran grandes, costosas e ineficaces. Además resultaban peligrosas, ya que las calderas explotaban frecuentemente al alcanzar altas presiones, causando muertes o graves quemaduras a las personas cercanas. Esto sucedía porque dichas máquinas estaban construidas a base de hierro dulce en lugar de acero. Por otro lado, aún no se habían desarrollado motores simples, accesibles para pequeñas industrias y de construcción económica.

Estos inconvenientes propiciaron que en 1816 el reverendo inglés Robert Stirling propusiese la idea de un nuevo motor que funcionase con un principio drásticamente diferente, conocido como "el motor de aire caliente". Esta máquina incorporaba un economizador de calor (hoy en día conocido como regenerador), dispositivo para mejorar el rendimiento térmico. Una diferencia importante era que este motor no explotaba a causa del vapor, ya que su medio de trabajo era aire a presión atmosférica, lo que lo convertía en una máquina mucho más segura.

Las primeras aplicaciones de este motor consistieron en fuentes de potencia de pequeñas máquinas, herramientas y bombas de agua. El inventor sueco John Ericsson diseño y construyó un barco movido por un motor Stirling y logró una patente para una bomba de agua accionada por esta máquina. Sin embargo, el perfeccionamiento de las máquinas de vapor, el posterior desarrollo del motor de combustión interna y la difusión de las redes eléctricas años después supusieron que el motor de aire caliente pasase al olvido durante años.

En la década de los '60 se recobró el interés en este tipo de máquinas. Philips desarrolló un generador portátil de energía eléctrica cuyo sistema de refrigeración producía agua caliente para uso doméstico. Posteriormente, debido a la crisis energética de principios de la década de los '70, se comenzó a investigar en nuevas fuentes de energía y en motores alternativos a los tradicionales. Algunas compañías automotrices desarrollaron vehículos basados en motores Stirling, mucho más eficientes energéticamente que los tradicionales. Sin embargo, una vez finalizada la escasez petrolera todas las innovaciones alcanzadas pasaron a un segundo plano.

En la actualidad se emplean máquinas de ciclo Stirling para generar energía eléctrica a partir de concentradores solares, ya que estos motores tienen el mayor rendimiento de conversión de energía calorífica del sol en electricidad de todas las tecnologías empleadas en plantas solares termoeléctricas.

![](images/6fc09b779d1b5ada4465e23a9e20ae0571ea6f9bfc7cd5ee0135f2b79ac07fb2.jpg)  
Figura 1. Colector solar con motor Stirling [1].

Por otro lado, este motor se emplea recientemente en la construcción de submarinos, debido a que emite muy poco ruido y tiene una gran autonomía. Además, motivados por el cambio climático, los grandes fabricantes de coches están investigando y evaluando la posibilidad de montar motores Stirling en vehículos híbridos.

Finalmente, se puede concluir que el motor Stirling es una apuesta fuerte en la búsqueda de motores alternativos que sean más eficientes y respetuosos con el medio ambiente. Por tanto, no es de extrañar que en un futuro se cuente con numerosos vehículos y sistemas de obtención de energía provistos de esta tecnología.

# CAPÍTULO 3: DYMOLA

Dymola, software desarrollado por la compañía sueca Dassault Systèmes AB, es una herramienta completa para la modelización y la simulación de sistemas complejos. Permite simular el comportamiento dinámico de los sistemas así como las interacciones entre ellos en diversos campos de la ingeniería, tales como: la mecánica, la electricidad, la termodinámica, los sistemas de control, etc.

Dymola está basado en el lenguaje abierto de Modelica, que consiste en que el usuario dispone de librerías de modelos en los diferentes ámbitos de la ingeniería ya mencionados, las cuales puede modificar o utilizar para la creación de nuevos sistemas de estudio. A continuación se describirá cómo es el entorno de modelización para la creación de estos modelos, así como el entorno de simulación para su estudio.

Para poder emplear todo el potencial de Dymola es necesaria la instalación de un compilador, como es C++ Visual Studio, tanto en la versión 2008 como la 2010, las cuales se encuentran gratuitamente en la página web de Microsoft Windows. Este compilador permitirá a Dymola ejecutar las simulaciones a nivel de visualización 3D y aplicar la resolución matemática al sistema.

Estas simulaciones se llevarán a cabo en una versión de Dymola de licencia educacional que se encuentra instalada en un ordenador facilitado por la Universitat Politècnica de Catalunya, el cual nos ofrece unos recursos de simulación superiores a los ofrecidos por ordenadores convencionales, ya que sus prestaciones o características técnicas son más elevadas.

Las características de esta máquina llamada PC186 son:

PC186 SGI-H2106, con una placa base que dispone de cuatro cpu's (AMD OPTERON 6140) de 8 núcleos (cores) cada cpu. Consta de un total de 64 GB de RAM. En estos momentos hay un disco principal de 1 TB (con RAID 1, espejo con un disco de las mismas características por cuestiones de seguridad) y dos discos secundarios de 2 TB, dándole una capacidad total de almacenamiento de 5 TB.

Tiene instalada la versión de Linux Ubuntu 11.04

<table><tr><td rowspan=1 colspan=8>CPUs, related to AMD Opteron 6140</td></tr><tr><td rowspan=1 colspan=1>Model</td><td rowspan=1 colspan=1>Cores /Threads</td><td rowspan=1 colspan=1>Freq.</td><td rowspan=1 colspan=1>L3cache</td><td rowspan=1 colspan=1>Multi-processing</td><td rowspan=1 colspan=1>TDP</td><td rowspan=1 colspan=1>Features</td><td rowspan=1 colspan=1>Price</td></tr><tr><td rowspan=1 colspan=1>Opteron 6140</td><td rowspan=1 colspan=1>8/8</td><td rowspan=1 colspan=1>2.6 GHz</td><td rowspan=1 colspan=1>12 MB</td><td rowspan=1 colspan=1>4</td><td rowspan=1 colspan=1>115 Watt</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>$989</td></tr></table>

Figura 2. Características CPU del PC186.

## 3.1. Modelización

A parte de realizar una modelización a través de Dymola, este software permite la comunicación con otros programas de creación de modelos, como Simulink o programas de diseño CAD. De este modo, Dymola permite la exportación de modelos o diseños que se quieran implementar al modelo bajo estudio.

Dymola tiene un entorno de modelización muy dinámico que permite la creación, modificación e interacción de modelos mediante diferentes vías. Con el objetivo de entender fácilmente dichas vías, se dividirá el área de modelización en seis partes.

![](images/83662c345a3914e02712bed9cd644755c9508f3c96499287107b1d79917f00de.jpg)  
Figura 3. Entorno de modelización de Dymola.

**1. Archivo (File):**

Aparte de poder realizar las acciones básicas con un archivo, como guardarlo, copiarlo, etc., si se accede a File->New se puede seleccionar qué archivo o componente del sistema se quiere crear: el modelo o sistema complejo¹, un conector del sistema, una función del sistema, una librería de modelos o componentes, etc.

**2. Paquete de librerías (Modelica):**

Aquí se encuentran librerías, sobre diversos campos de la ingeniería, de componentes y modelos que Dymola tiene creados. El usuario puede utilizarlos para la creación de su sistema o modificar los existentes para ajustarlos a sus necesidades.

**3. Área de diseño**

Como su nombre indica, aquí es donde se le puede dar un formato gráfico al componente o modelo que se está creando. A través de la combinación de los elementos de la barra de tareas, que se encuentran al lado del icono del área de diseño, se proporciona una imagen al archivo o sistema complejo que ayude a identificar de una manera visual cuál es su función.

**4. Área de interacción**

Se conoce como área de interacción a la parte del programa donde se pueden añadir los componentes de un sistema (variables, funciones, conectores, etc.) o de un sistema complejo (modelos, condiciones iniciales, conectores, etc.) y crear las conexiones entre estos.

**5. Área de código**

Parte del software que recoge, en lenguaje Modelica, todo lo que se lleva a cabo en el área de diseño y de interacción sobre el componente o modelo que se está creando. También permite añadir de manera manual, es decir, introduciendo código, las características del componente o del modelo que ayudan a describir mejor el comportamiento de éste, como pueden ser variables, ecuaciones, conexiones, condiciones iniciales, etc.

Para una buena comprensión de los conceptos explicados durante la memoria es necesario definir correctamente las siguientes palabras clave:

Parámetro: variable que Dymola interpretará como constante durante la simulación, por tanto el programa ya sabrá que las derivadas de esta variable respecto al tiempo son cero.

Variable: como su nombre indica, se refiere a un valor que cambiará de magnitud según las situaciones o la evolución del sistema. Se tendrá que especificar a Dymola cómo son sus derivadas respecto al tiempo para que éste pueda ir definiendo su nueva magnitud.

Condición inicial: Característica que se define sobre una variable no constante en el tiempo, de modo que se proporciona a Dymola la información de cómo se encuentra inicialmente esta variable y así, tanto el usuario del software como el propio Dymola, pueden interpretar si la evolución del sistema es correcta o no. Estas condiciones iniciales se encuentran definidas como “start=" al lado de una variable. Además, se puede especificar a Dymola si inicialmente la variable a la que se le ha definido la condición inicial tiene que alcanzar este valor indispensablemente o si la condición es sólo una magnitud orientativa del valor que ésta tendría que tomar al iniciarse el sistema. Esta especificación se lleva a cabo marcando la condición inicial como cierta (=True) o como orientativa (=Inherited).

$$
6 . \underbrace { \mathsf { C o m p o n e n t e s } ( \overbrace { \cdots } \underbrace { \mathsf { U n n a m e d } } _ { \begin{array} { c } { \scriptstyle { \mathsf { L } } } \end{array} } ) } _ { \begin{array} { c } { \scriptstyle { \mathsf { C o m p o n e n t e s } } ( \overbrace { \cdots } \underbrace { \mathsf { U n n a m e d } } _ { \begin{array} { c } { \scriptstyle { \mathsf { L } } } \end{array} } ) } \end{array} } .
$$

En este apartado se puede acceder y ver, rápida y estructuradamente, los modelos de un sistema complejo así como los componentes de cada modelo que lo componen.

Una herramienta que no se ha mencionado y que es muy útil dentro de la parte de modelización es el icono de información (), que se puede consultar para ver la descripción del funcionamiento del componente seleccionado, así como la definición de sus variables y sus correspondientes unidades. Esta herramienta ha sido de gran ayuda a la hora de entender los componentes del modelo mecánico reutilizados, los cuales se analizarán más adelante.

## 3.2. Simulación

Del mismo modo que la parte de modelización, la simulación en este software también soporta los modelos exportados de otros programas en la parte de modelización, pudiéndose ejecutar así animaciones CAD no sólo realizadas en Dymola. Este entorno también ofrece la posibilidad de exportar los resultados del sistema o, si se prefiere, los resultados de las variables que se quieren estudiar de éste, a otros programas de tratamiento o interpretación de datos.

El entorno de simulación de Dymola ofrece varias maneras de visualizar los resultados de la evolución de los sistemas, así como diversos métodos numéricos para la resolución de éstos. Para entender cómo realizar la visualización deseada y cómo seleccionar el método numérico a aplicar, así como el tiempo de estudio del sistema, se dividirá el entorno de simulación en seis partes.

![](images/d03b55505f1f7e14f7c6057472c8a03e538c39e1ce65fab3784ebbe080baee4b.jpg)  
Figura 4. Entorno de simulación de Dymola.

• Menú de simulación ( Simulation ):

En el interior de este menú se encuentran varias opciones de funciones para aplicar al sistema y diversos tipos de lecturas. Sin embargo, se analizarán únicamente las que sean de interés para este proyecto, que son dos:

a) Simulate $( { \bf \nabla } \mathbf { \mathcal { Y } } )$ : función que se encarga de simular el sistema y resolverlo mediante el método numérico que Dymola detecte por defecto, siempre y cuando no se haya especificado que emplee otro.

b) Setup $( \overleftrightarrow { \mathbf { t } _ { 0 } \mathbf { t } _ { 1 } } )$ : función que abrirá un submenú donde se pueden realizar elecciones del tipo: el método numérico por el cual se resolverá el sistema (Simulate->Setup->General->Integration->Algorithm-> listado de métodos que Dymola puede aplicar), los intervalos de tiempo de estudio de la función (Simulate->Setup->General->Simulation interval-> donde figuran el tiempo de inicio o start time y el tiempo final o stop time) o especificar a Dymola que envíe información al usuario sobre los mensajes de error de la simulación para identificar el porqué de este fallo (Simulate->Setup->Debug->Diversas opciones de información).

Menú gráficas (Plot):

Tal y como su nombre indica, este menú permite graficar las soluciones de las variables del sistema que se quieran estudiar. Por otro lado, ofrece una selección de recursos para manipular las gráficas y poder realizar el estudio de una manera más detallada.

• Menú animación (Simulation):

La animación es otro tipo de representación de la solución que Dymola ofrece. Esta representación consiste en una visualización 3D del modelo que tanto puede estar realizada con el mismo Dymola como con otro programa de diseño CAD con el que Dymola sea compatible (como por ejemplo Solidworks). La finalidad de esta representación es ayudar al usuario a entender mejor la funcionalidad del sistema, así como comprobar si éste realmente realiza su función de manera correcta.

Variables (Variables):

Espacio en el entorno de simulación en el que se encuentran todos los componentes o modelos que intervienen en el sistema y de entre los cuales se pueden seleccionar las variables que se quieran representar en las gráficas o el modelo del que se quiera obtener la animación (si esta ha sido diseñada y programada). Además se pueden modificar valores de las variables definidas como parámetros directamente desde este menú, sin necesidad de volver al entorno de modelización, y así volver a simular para observar los cambios en el sistema.

• Zona de representaciones ():

En esta área se abrirán las ventanas de las visualizaciones que Dymola represente. Por defecto, Dymola siempre genera una ventana de representación gráfica, pero accediendo a cualquiera de los menús mencionados y seleccionando new window se pueden abrir tantos espacios de representación como se desee.

• Zona de mensajes (Advanced):

En ese espacio Dymola muestra e informa en tiempo real de la simulación, así como de los posibles errores generales que encuentre durante ésta. Posteriormente, se puede identificar el origen de los errores con la función Debug mencionada.

# CAPÍTULO 4: MOTOR STIRLING

## 4.1. Descripción general

El motor Stirling es una máquina de combustión externa basada en el ciclo de Stirling. Desarrollado por primera vez en 1816 por Robert Stirling, este motor genera energía a partir de una diferencia de temperatura. El fluido de trabajo, que es típicamente aire, hidrógeno o helio, se calienta en un extremo y se enfría en el otro, provocando que el gas se expanda o se comprima, respectivamente. Además, esta expansión y compresión mueve dos pistones dentro del cilindro del motor, los cuales están acoplados a un mecanismo de accionamiento que produce una salida de potencia neta. Dicha salida de potencia es debida a que el proceso de calentamiento (expansión) se produce a una presión de trabajo mayor que el proceso de enfriamiento (compresión).

Esta máquina opera en un ciclo regenerativo cerrado y la transferencia de energía se produce a través de las pareces del cilindro del intercambiador de calor. Las variaciones de volumen ocasionadas cuando el fluido de trabajo se mueve por los pistones deben estar fuera de fase entre sí para que se genere energía.

El motor cuenta con dos pistones con funciones bien diferenciadas: el desplazador y el pistón de potencia. El desplazador es un pistón que se ajusta al interior de la cámara de trabajo dejando una pequeña distancia, llamada anillo, entre éste y las paredes del cilindro de manera que permite que el fluido de trabajo pase de la zona caliente a la zona fría, calentándose y enfriándose alternativamente. El pistón de potencia es el encargado de convertir la presión que almacena el fluido de trabajo en una fuerza neta. Debido a que el pistón de potencia y el desplazador se mueven fuera de fase el uno con el otro, el motor Stirling requiere un sistema de accionamiento convencional.

Este tipo de motores pierden eficiencia debido a las grandes diferencias de temperatura entre el fluido de trabajo y las zonas caliente y fría. A medida que el fluido pasa alrededor del desplazador va adquiriendo calor, de manera que llega a la zona fría a una temperatura más alta de lo necesario. Esto se produce en la situación contraria, cuando el fluido se mueve alrededor del desplazador en el camino de regreso, llegando a la zona caliente más frío de lo requerido.

Este problema se puede solventar mediante un regenerador o economizador, como le llamó Robert Stirling, desarrollado para aumentar la eficiencia de la máquina. El diseño era originalmente una masa de alambre de acero situada en el espacio anular, la cual absorbía el exceso de energía a medida que el fluido de trabajo pasaba a través de él.

El regenerador es un intercambiador de calor interno que tiene la función de absorber y ceder calor en las evoluciones a volumen constante del ciclo. Este sistema reduce tanto la cantidad de calor que se tiene que proporcionar al gas a partir de la fuente externa como la cantidad de calor desaprovechado que tiene que eliminar el sistema de refrigeración. Por tanto, se reduce el consumo de combustible y se mejora la eficiencia global del ciclo de trabajo.

Los motores pequeños no suelen llevar regenerador, sino que disponen de una holgura de algunas décimas de milímetro entre el desplazador y el cilindro para permitir el paso del aire. Los motores grandes incorporan un regenerador externo por el que debe pasar el aire en su camino de la zona fría a la caliente y viceversa.

Las ventajas que presenta este tipo de motor son su alta eficiencia, la gran variedad de fuentes externas de calor que se pueden emplear, el poco ruido que produce y sus bajas emisiones. Además, existen una serie de tecnologías potenciales en las cuales se podría incorporar un motor Stirling:

Sistemas de energía solar térmica con discos parabólicos y motores Stirling

• Coches híbridos eléctricos y con motor Stirling

• Motores micro-Stirling

• Unidades de ahorro de energía o regeneración del calor de desechos (waste heat regeneration)

• Dispositivos refrigerantes electrónicos de inicio automático

• Refrigeradores con motor Stirling de pistón libre (FPSC)

• Motores Stirling de hidrógeno

## 4.2. Configuraciones

En este apartado se describirán brevemente las diferentes configuraciones que presenta un motor Stirling, de acuerdo a los distintos diseños mecánicos disponibles.

### 4.2.1. Configuración Alpha


La configuración alpha está compuesta por dos cilindros, uno frío y otro caliente. Los dos pistones están conectados a través de un cigüeñal, pero sus movimientos están desfasados 90 grados. Esto supone que cuando un pistón está en el tope o al contrario, el otro se situará a medio camino.

![](images/89c8c05169161dd6b6c66f88f7f7f8b299b6b11d62367c93a7ee9bce95b6afb2.jpg)  
Figura 5. Motor Stirling de configuración Alpha [2].

### 4.2.2. Configuración Beta

El motor Stirling original tenía una configuración beta. Ésta consta de un cilindro con un extremo caliente y otro frío. En el interior del cilindro se sitúa el desplazador, cuya misión es pasar el aire de la zona fría a la caliente y viceversa. El pistón de potencia está colocado de manera concéntrica al desplazador. Mediante un cigüeñal especial, el movimiento del pistón y el desplazador están desfasados 90 grados, lo que permite el funcionamiento del motor.

Desde el punto de vista termodinámico es el motor más eficaz, pero su construcción es complicada, ya que el pistón debe de tener dos bielas y permitir el paso del vástago que mueve el desplazador.

![](images/c70eb9e1d125f843242d59bce230d9113f21b7b5748ea0b4da2015600aa923ed.jpg)  
Figura 6. Motor Stirling de configuración Beta [2].

### 4.2.3. Configuración Gamma

Este tipo de motor viene derivado de la configuración beta, pero es más sencillo de construir. Consta de dos cilindros separados, en uno de los cuales se sitúa el desplazador y en otro el pistón de potencia. Estos cilindros se encuentran desfasados 90 grados mediante un cigüeñal.

Desde el punto de vista termodinámico es menos eficaz que el tipo beta, puesto que la expansión de trabajo se realiza en su totalidad a menor temperatura y existe más volumen muerto.

![](images/6686f65c38b249f879226fd077880eea26fef80fb10114ce66fa324cdff3e4a5.jpg)  
Figura 7. Motor Stirling de configuración Gamma [2].

## 4.3. Ciclo termodinámico

El motor Stirling sigue un ciclo termodinámico conocido como ciclo Stirling, el cual proporciona teóricamente el rendimiento máximo teórico, conocido como rendimiento de Carnot. Esto supone que los motores Stirling sean los motores térmicos que presentan un mayor rendimiento.

Pese a que teóricamente este motor alcanza rendimientos altos, es necesario comentar que no serviría como motor de coche, ya que su potencia es baja y los altos rendimientos que alcanza se consiguen a bajas velocidades. Por otro lado, el rendimiento del ciclo es sensible a la temperatura exterior, por lo que el motor tendrá una mayor eficiencia en climas fríos que en cálidos.

Este ciclo consta de 4 etapas: dos procesos isócoros (un calentamiento y un enfriamiento a volumen constante) y dos isotermos (una compresión y una expansión a temperatura constante).

![](images/c4288d2cd5fc19cc95cca048dec0ee90657d2120149fe1caa3aaaab39cee46e2.jpg)  
Figura 8. Ciclo Stirling [3].

1-2: Compresión isoterma del gas a la temperatura inferior, cediendo el calor a la fuente fría.

2-3: Calentamiento a volumen constante provocado por el regenerador, lo cual implica un aumento de presión.

3-4: Expansión isoterma del gas a temperatura máxima, durante la cual el gas absorbe calor de la fuente caliente.

4-1: Enfriamiento a volumen constante, disminuyendo la temperatura del fluido hasta la temperatura mínima.

El rendimiento de un ciclo de Carnot se puede expresar de la siguiente manera, siendo ${ \sf T } _ { 1 }$ la temperatura de la fuente caliente de la que absorbe calor el proceso $\textsf { Y T } _ { 2 }$ la temperatura de la fuente fría que refrigera el fluido de trabajo.

$$
\begin{array} { r } { \eta = 1 - \frac { T _ { 2 } } { T _ { 2 } } } \end{array}\tag{1}
$$

## 4.4. Funcionamiento

A continuación se presentará el funcionamiento del motor en los diferentes estados de posición de los pistones, junto con un esquema explicativo de la máquina.

En el primer estado el pistón de potencia acaba de entregar la fuerza al eje, debido a que la presión del ciclo es máxima. Para reducir esta presión se necesita provocar el movimiento del desplazador hacia su punto muerto superior, desplazando así el aire hacia la zona fría del sistema y consiguiendo una reducción de presión. El volante de inercia facilitará el movimiento de bajada del pistón de potencia.

![](images/4c50d77d33d381a9094ce1b70cc5eddbb24309e846d5a408414cd5e442307ff7.jpg)  
Figura 9. Inicio de la disminución de presión del sistema.

En el segundo estado del motor se puede observar que el desplazador ha alcanzado su punto máximo, desplazando todo el aire hacia la zona fría y consiguiendo una reducción de la presión de sistema gracias al enfriamiento del gas.

![](images/65a46b9f92b6367f29fa88cc59222f392f3f68fc88c3600c3fdf60f44534c35f.jpg)  
Figura 10. Enfriamiento máximo del aire.

En el tercer estado de la máquina el pistón de potencia ya ha llegado a su punto muerto inferior y el desplazador comienza su descenso hacia el punto muerto inferior, volviendo a introducir el aire hacia la zona de calentamiento del sistema.

![](images/b21eaa497dd87e1cbcc9cfcef233177c4e252b8937f217b8ea7e52ebeb8e4f5c.jpg)  
Figura 11. Inicio del calentamiento del gas.

Por último, la última etapa del movimiento consiste en desplazar todo el gas a la zona caliente del motor, aumentando la presión hasta su valor máximo. La diferencia de presiones del fluido y el exterior de la máquina provocará la ascensión del pistón de potencia, el cual entregará fuerza al sistema.

![](images/db23ad82aa2910af0f987f8c8570b9f6f2a50bf80399e0d4bc9fa5f890c6f49c.jpg)  
Figura 12. Calentamiento máximo del aire.

En la siguiente imagen se representa el ciclo Stirling real. Se puede observar que se realiza trabajo en los procesos 2-3 y 4-1, pese a que en ciclo ideal dicho trabajo es nulo.

Una de las mayores causas de la ineficiencia del ciclo Stirling real es el regenerador. La adicción de este componente implica un aumento de fricción con el flujo del fluido de trabajo. Para que el ciclo real se pudiese aproximar al ciclo de Carnot, el regenerador tendría que alcanzar la temperatura del foco caliente del motor.

Otra de las mayores causas de ineficiencia en el ciclo Stirling real es que no todo el fluido de trabajo participa en el ciclo, sino que existe un volumen muerto. Dicho volumen comprende el volumen que no participa en el barrido de la carrera del pistón. Se han realizado estudios que afirman que la relación entre el porcentaje de volumen muerto en el sistema y la disminución en el trabajo realizado por el ciclo es lineal. Por tanto, si el motor tiene un 20% de volumen muerto la potencia de salida será un 80% de la obtenida si sino hubiese volumen muerto. En los motores actuales, el volumen muerto siempre estará presente debido a la adición de los intercambiadores de calor internos, espacios libres, tubos de transferencia y regeneradores, los cuales son necesarios para mejorar el intercambio de calor del sistema real.

![](images/9c9b026f7c1205590429f0e1b1a20e401a42c50d3b9ecf75a77097db12f50492.jpg)  
Figura 13. Ciclo Stirling real [4].

# CAPÍTULO 5: MODELIZACIÓN DEL MOTOR STIRLING

## 5.1. Estado previo

Tras haber analizado el funcionamiento del programa y del motor Stirling, se procede a estudiar el diseño e implementación de la máquina que se ha llevado a cabo en el software Dymola. El sistema a estudiar se puede dividir en dos modelos o subsistemas más sencillos: modelo mecánico y modelo termodinámico.

Debido a que la implementación del motor que se va a analizar ha sido desarrollada anteriormente por otro ingeniero, este apartado consistirá en un resumen de los aspectos más importantes, el cual se podrá complementar con la documentación del Anexo A, procedente de la memoria del trabajo final de carrera del ingeniero Albert García Prat (García Prat 2013).

### 5.1.1. Modelo mecánico

Tal y como indica su nombre, este modelo es el encargado de describir la parte mecánica del sistema. Su función es la de transformar la energía térmica en energía mecánica, de la cual se obtendrá posteriormente energía eléctrica.

Para llevar a cabo la modelización de este sistema no se ha creado ningún componente nuevo, sino que se han reutilizado modelos y componentes de librerías existentes de Dymola (de la librería Modelica->Mechanics).

El modelo mecánico está principalmente formado por cuatro componentes: el pistón de compresión, el pistón de expansión o desplazador, el cigüeñal y el cilindro o carcasa. En el anexo especificado anteriormente se recoge una descripción detallada de cada uno de los componentes, especificando las partes que los conforman. Además se incluyen imágenes aclarativas de cada una de las partes y de la interacción del conjunto de elementos.

El análisis del funcionamiento del modelo mecánico también se incluirá en los anexos de este trabajo.

A continuación se procederá a explicar la implementación del modelo mecánico en el software Dymola. Como ya se ha comentado anteriormente, no se ha creado ningún componente nuevo para este modelo, sino que se ha empleado un modelo existente en la librería de Dymola. De esta manera se evita tener que programar las variables, las ecuaciones, los conectores y demás elementos que describen el funcionamiento y la interacción entre las partes mecánicas.

Si se accede a Modelica->Mechanics->MultiBody->Examples->Loops->EngineV6, se encuentra un motor V6 del cual se puede aprovechar el modelo de uno de los pistones. A dicho modelo se le aplican unos pequeños cambios para ajustarlo al pistón de potencia y al desplazador del motor Stirling.

En la siguiente imagen aparece el pistón V6 de la librería, en el cual se resaltan las partes que se estudiarán y ajustarán en el modelo mecánico.

![](images/a55422c6d98c04ba21101b9071841d2c506b6cc9b987a1c2e32ff0686a235705.jpg)  
Figura 14. Componentes de un pistón modelados en Dymola.

De todas las partes remarcadas en la ilustración anterior sólo se tendrá que modificar el gas para ajustar el pistón del V6 a los pistones del motor Stirling. Para el caso del pistón de potencia se tendrá que sustituir el modelo termodinámico del motor V6 por el correspondiente modelo termodinámico del motor Stirling. En cuanto al desplazador, se tendrá que eliminar el modelo del V6, ya que este pistón no recibe ninguna fuerza debida a la presión, sino que sólo mueve los volúmenes de una zona a otra.

Las modificaciones aplicadas al modelo del pistón del V6, así como la creación del modelo mecánico (ModelMecanic\_Stirling) se pueden consultar en el apartado correspondiente de los anexos.

Una vez creado el modelo mecánico, el cual incorpora el desfase de $90 \textdegree$ entre los pistones, se le acoplarán una serie de componentes que permitirán llevar a cabo una simulación para comprobar su funcionamiento. Estos componentes son:

• El mundo (Modelica->Mechanics->MultiBody->World)

• Un rodamiento (Modelica->Mechanics->MultiBody->Joints->Revolute)

• Un volante de inercia (Modelica->Mechanics->Rotational->Components->Intertia)

El mundo proporciona la gravedad y los ejes de referencia del sistema, que coordinan el movimiento. El rodamiento permite la rotación del cigüeñal y el volante de inercia estabiliza esta rotación.

Los componentes mencionados quedan conectados de la siguiente manera:

![](images/bbbbe9887dc2e56ad90bbe5c24ecac4d53875ef03b3341ae9b107473ff20929d.jpg)  
Figura 15. Área de interacción del ModelMecanic\_Test.

En la siguiente imagen se muestra la animación 3D que genera Dymola.

![](images/f41ae25a176a56d4cc5fb3608e7f2015e97e5a837effce95a63fde7145afc73d.jpg)  
Figura 16. Animación 3D del modelo mecánico.

### 5.1.2. Modelo termodinámico

El modelo termodinámico es la parte más importante del motor, ya que se encarga de proporcionar la fuerza y las temperaturas de trabajo para que éste funcione correctamente. En este caso las librerías de Dymola no disponían de ningún modelo similar al ciclo Stirling con el cual trabaja el gas, por lo que se ha tenido que modelar desde cero.

En la implementación del modelo en el software se han diferenciado dos partes principales. En la primera parte se ha llevado a cabo una modelización del movimiento de las masas en función de los volúmenes que el movimiento del desplazador genera en cada zona a temperatura constante. La segunda parte consiste en el modelado del calentamiento y enfriamiento de las masas de las respectivas zonas, en función de los volúmenes disponibles en cada una de ellas.

**a) Primera parte:**

Partiendo de la construcción del modelo mecánico anterior se relacionarán las posiciones de los pistones que éste tiene con las posiciones de los pistones del modelo térmico, lo cual proporcionará los volúmenes disponibles en cada zona y devolverá una fuerza resultante.

Se creará un primer modelo, llamado ModelConnector\_Posicions\_Force, en el cual se relacionará la entrada de estas posiciones en el modelo termodinámico y la salida de la fuerza de éste modelo hacia el mecánico. La programación específica de este modelo aparece recogida en los anexos.

Una vez relacionadas las entradas y salidas del modelo se procederá a modelar el movimiento de los volúmenes, creando un nuevo modelo llamado ModelVolums. En este modelo se especificarán los movimientos de los pistones, así como los parámetros constantes del motor y cómo se relacionan entre un modelo y otro.

Por otro lado, también se definirán unas condiciones iniciales que ayuden a iniciar la simulación del modelo termodinámico y a identificar si ésta se está ajustando correctamente o no a la función deseada que tiene que llevar a cabo. Dichas condiciones iniciales son: la presión y temperatura inicial del sistema; los volúmenes iniciales en cada zona, que dependen de las posiciones relativas iniciales y cuya suma dará el volumen total del sistema; el número de moles de cada zona y el total del sistema, los cuales se pueden obtener a partir de la ecuación de gases ideales, ya que el gas de trabajo es aire.

La creación de dicho modelo, así como la programación de los parámetros geométricos, condiciones iniciales y parámetros del gas ideal se pueden consultar en los anexos.

A continuación se presentan las configuraciones del motor Stirling modelizado en Dymola en función de las distintas posiciones de los pistones de potencia y desplazamiento. En los esquemas siguientes aparecen representadas todas las variables que participan en la simulación de la máquina.

![](images/06d0b863d88d638fca3e0e22400c4fdbf7bd49a239feafc8fc99f6d5da67f0c8.jpg)

Figura 17. Inicio de la reducción de presión del sistema.  
![](images/4cdd9ae1e3325705c74ff759e65bbf914e914820450197b5c56e83f5cd50e8f6.jpg)  
Figura 18. Enfriamiento máximo del aire.

![](images/fea4fe4eb0d077a010191391734efe60f07c3849ba0b9c9e5567c0e3bc51722b.jpg)

Figura 19. Inicio del calentamiento del gas.  
![](images/de0a00b1365791e216a8b94b07ca0587ec0f6993d3b4afa20187bb3cbb306e14.jpg)  
Figura 20. Calentamiento máximo del aire.

Las ecuaciones que gobiernan el sistema, así como la evolución de las variables durante el estudio o funcionamiento de éste aparecen descritas en los anexos de este trabajo. También se describirá con detalle la ecuación de la continuidad que describe el movimiento de las masas en cada zona y la ecuación de la cantidad de movimiento, para describir la fuerza que actúa sobre el sistema.

Una vez definido el ModelVolums se procederá a probarlo, creando un nuevo modelo llamado ModelVolums\_Test. El diagrama de bloques de dicho modelo aparece en la imagen siguiente:

![](images/bb6ca9b255720d755152eed16931eebba26a08862ea7cf6d83c7e0879f02b320.jpg)  
Figura 21. Área de interacción del ModelVolums\_Test.

En los anexos se recoge el código en el que se introducen los parámetros y condiciones iniciales necesarias para poner en funcionamiento el modelo anterior. Además, se presentan las gráficas que muestran cómo varían los volúmenes en función de las posiciones, cómo varían las masas en función de éstos volúmenes y la fuerza resultante que entrega el modelo.

**b) Segunda parte:**

En esta parte se le añadirá al ModelVolums el calentamiento y enfriamento del sistema. Se volverá a estudiar el sistema, añadiendo los nuevos procesos, para ver qué parámetros y variables se generan.

Se creará un nuevo modeo, el ModelTermodinamic, el cual estará basado en el ModelVolums junto con la adición de dos nuevos parámetros y nueve nuevas variables. Al contar con dos nuevas entradas, se tendrá que sustituir el ModelConnectors\_Posicions\_Forces por un nuevo modelo que incorpore estas entradas, el cual se llamará ModelConnectors\_Posicions\_Temperatures\_Forces.

La programación del ModelTermodinamic y del ModelConnectors\_Posicions\_Temperatures\_Forces se podrá consultar en los anexos.

A continuación se procede a elaborar las ecuaciones que describirán el calentamiento y enfriamiento del sistema, así como la evolución de los intercambios energéticos en cada zona. Los pasos a llevar a cabo para obtener dichas ecuaciones e implementarlas en Dymola se recogen en los anexos.

Una vez definido el modelo termodinámico, se creará un modelo llamado ModelTermodinamic\_Test con el cual se comprobarán los intercambios energéticos producidos en las diferentes zonas del sistema. En este modelo se añadirán, además del modelo termodinámico existente, los modelos proporcionarán las temperaturas de calentamiento y enfriamiento, respectivamente.

El modelo que dará la temperatura caliente es una rampa (Modelica->Blocks->Sources->Ramp), que comenzará a temperatura ambiente (offset=293.73 K) y que aumentará en función de la altura especificada (height). La temperatura de enfriamiento equivaldrá a una constante, igualada a la temperatura ambiente.

![](images/2f0856df5cee837a4cb391b963a2b50df468aceaa22b3d95bca90cb329778758.jpg)  
Figura 22. Área de interacción del ModelTermodinamic\_Test.

En los anexos aparecen especificados los parámetros y condiciones iniciales que se tienen que implementar antes de simular el modelo anterior. Además, se presentan las gráficas de las temperaturas y transferencias de calor de las zonas del sistema que varían en función del movimiento de masas de una zona a otra durante la simulación del sistema.

Una vez implementados los dos grandes modelos que intervienen en el sistema se procede a acoplarlos con el objetivo de ver cómo funciona el sistema completo, el motor Stirling. El nuevo modelo se llamará Motor\_Stirling, en el que establecerá el ModelMecanic implementado anteriormente, aplicándole un par de modificaciones:

• Primera modificación: eliminar la función sinusoidal y en su lugar conectar el ModelTermodinamic.

Segunda modificación: colocar un sensor de posición (Modelica->Mechanics->Translational->Sensors->PositionSensor) en cada cilindro, el cual nos dará la "s" o posición relativa del pistón de potencia o desplazador respecto a su respectivo cilindro. Estos sensores se conectan desde el conector del cilindro a la entrada correspondiente del ModelTermodinamic.

![](images/d4572ed9fa4c39071c57217f46649f9c11aa0c9cd4dae29e977358ee153b62f2.jpg)  
Figura 23. Área de interacción del Motor\_Stirling.

Una vez creado el modelo del motor se procede a probarlo, incluyendo los mismos recursos que se emplearon en el test del modelo mecánico (mundo, rodamiento y volante de inercia) y añadiendo algunos otros para ayudar al arranque inicial del motor.

Por otro lado, para poder determinar la potencia que entrega el motor se añadirá un sensor que medirá la potencia resultante en el cigüeñal, además de imponerle un rozamiento al mismo. Para obtener una potencia adecuada se estipula que el rozamiento tendrá un valor aproximado de un sesenta por ciento respecto a la velocidad máxima del cigüeñal.

Los componentes del sistema de arranque forzado y la programación del sensor de potencia y del rozamiento aparecen descritos en los anexos de esta memoria.

![](images/7777f2b505b77c7f83bdd64625603d01a700fa178304807793b8d4cda5819c2c.jpg)  
Figura 24. Componentes para el test del Motor\_Stirling.

## 5.2. Verificación del modelo

### 5.2.1. Inicio de las simulaciones


Antes de comenzar a introducir modificaciones en la implementación del motor Stirling es necesario analizar el funcionamiento del modelo inicial para tratar de averiguar el origen de los problemas existentes.

El primer paso a llevar a cabo es estudiar detenidamente los modelos mecánico y termodinámico para detectar posibles errores en la implementación del código.

5.2.2.

### 5.2.2. Simulaciones de inercia y temperatura

Es preciso aclarar que en este apartado sólo se presentan las gráficas de las simulaciones más importantes, mientras que la totalidad de las gráficas están recogidas en el apartado B.2 de los anexos.

**a) Simulaciones de temperatura**

Una vez estudiados los modelos mecánico y termodinámico del motor diseñado por Albert, se procede a analizar el funcionamiento de la máquina mediante una visualización 3D. Tras dicha simulación se puede comprobar que el motor se para al cabo de cierto tiempo e incluso comienza a moverse en la dirección contraria, lo cual indica que hay un problema que debe solucionarse.

La primera modificación introducida para tratar de mejorar el funcionamiento del motor es aumentar la temperatura del foco caliente (Tc) para que entre más energía en el motor. Por otro lado, también se disminuirá la temperatura del foco frío para aumentar la diferencia de temperaturas. El valor inicial que toma el foco frío se corresponde con la temperatura ambiente (T = 293,15 K).

Para ello se accede a la función rampa que define la temperatura y, sin modificar el offset, se varía la altura de la función. Inicialmente se parte de un valor de altura de 230 y de un momento de inercia (J) de 2 kg/m².

Tabla 1. Simulaciones modificando la temperatura de los focos.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa temperatura</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Offset (K)</td><td>Height (K)</td></tr><tr><td>1</td><td>293,15</td><td>240</td><td>NO</td></tr><tr><td>2</td><td>293,15</td><td>250</td><td>NO</td></tr><tr><td>3</td><td>250</td><td>260</td><td>NO</td></tr><tr><td>4</td><td>250</td><td>280</td><td>NO</td></tr></table>

En las primeras dos simulaciones se aumenta la temperatura del foco caliente, manteniendo el foco frío a la temperatura ambiente. En las dos siguientes se continúa aumentando la temperatura del foco caliente, disminuyendo a su vez la temperatura del foco frío a 250 K.

![](images/eb28525d36184b8ba80507dc63aed541676fc01f3439f034ee9b44c03391806d.jpg)  
Figura 25. Caso de simulación nº4: velocidad angular.

En la gráfica anterior se puede apreciar el caso de simulación número 4, el cual refleja, al igual que los 3 casos anteriores, que el motor no funciona pese a las modificaciones de temperatura llevadas a cabo. Por tanto, tras las simulaciones realizadas se concluye que el aumento de la diferencia de temperaturas entre el foco caliente y el foco frío no es suficiente para asegurar el buen funcionamiento del motor. Por tanto, se vuelve a establecer el foco frío a temperatura ambiente.

**a) Simulaciones de inercia**

La siguiente modificación consiste en el aumento del momento de inercia (J), la cual surge de plantearse que quizás el momento de 2 $\mathsf { k g } / \mathsf { m } ^ { 2 }$ establecido inicialmente no es suficiente para asegurar que el motor de arranque provoque el arranque del motor Stirling. Esta decisión también está basada en el análisis de la gráfica de la velocidad angular, donde se puede observar que la máquina gira muy lentamente.

Tabla 2. Simulaciones modificando el volante de inercia.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Altura rampa temperatura</td><td>Momento de inercia (kg/m²)</td><td>Funciona (SI/NO)</td></tr><tr><td>5</td><td>80</td><td>(K) 240</td><td>5</td><td>SI</td></tr><tr><td>6</td><td>80</td><td>240</td><td>4</td><td>SI</td></tr><tr><td>7</td><td>80</td><td>240</td><td>3</td><td>SI</td></tr><tr><td>8</td><td>200</td><td>240</td><td>3</td><td>NO</td></tr></table>

En la primera simulación se establece un aumento considerable del momento de inercia para analizar el comportamiento del motor. Tras el experimento se comprueba que la máquina funciona durante el tiempo establecido, por lo que se va disminuyendo gradualmente el valor del momento mientras siga funcionando.

Finalmente se establece dicho valor en $\mathsf { J } { = } 3 ~ \mathsf { k g } / \mathsf { m } ^ { 2 }$ y se procede a simular durante 200 segundos para comprobar si el comportamiento se mantiene durante más de 80 segundos o si, por el contrario, el motor vuelve a pararse. Tras la simulación se puede observar que el motor se desestabiliza al cabo de 150 segundos, pero no llega a pararse.

![](images/6b6c9eafb0e98756c698091c5fd04bce9265ceadb5990436c82b93d6defde134.jpg)  
Figura 26. Caso de simulación nº8: velocidad angular.

### 5.2.3. Simulaciones del sistema de arranque y temperaturas

**a) Simulaciones de funcionamiento debido al motor de arranque**

Para comprobar la acción que ejerce la inercia de arranque sobre el movimiento de la máquina, se procede a simular el funcionamiento del motor debido únicamente a la inercia que proporciona el sistema de arranque. Por tanto, se igualan los focos de temperatura, $T _ { \mathrm { c } } = \mathsf { T } _ { \mathsf { F } } ,$ y se comienza a aumentar paulatinamente el tiempo de simulación con el objetivo de comprobar cuánto tiempo dura el efecto de la inercia en el motor.

Tabla 3. Simulaciones del funcionamiento de la máquina debido al motor de arranque.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Momento de inercia (kg/m²)</td><td>Funciona (SI/NO)</td></tr><tr><td>9</td><td>80</td><td>3</td><td>SI</td></tr><tr><td>10</td><td>200</td><td>3</td><td>SI</td></tr><tr><td>11</td><td>400</td><td>3</td><td>SI</td></tr><tr><td>12</td><td>600</td><td>3</td><td>NO</td></tr></table>

Como se puede deducir de la tabla anterior, la inercia de arranque del motor es suficiente para que éste funcione durante, al menos, 400 segundos. En el último de los casos el motor funciona hasta los 440 segundos, momento en el que se para completamente. En la siguiente gráfica podemos ver dicho comportamiento analizando la velocidad angular del motor.

![](images/53a0268426d3dacc25f5fde38f99ce8fff07dc6a1cacd03a21934e690f33d0eb.jpg)  
Figura 27. Caso de simulación $n ^ { o } 1 2 .$ : velocidad angular.

b) Comparaciones funcionamiento del motor de arranque y variación de temperaturas

A continuación se decide comparar el comportamiento del motor con una variación de temperatura entre los focos de 240 grados y el comportamiento debido únicamente al motor de arranque. Los resultados obtenidos se muestran en las siguientes gráficas. En la primera de ellas, el color azul se corresponde con el caso de simulación nº 8 y el color rojo al caso de simulación nº 10.

![](images/633515e9b094f61f1e66d71d8e33f4cf26ef10009029aed9df262c3f257ec611.jpg)  
Figura 28. Comparación de casos $\boldsymbol { n ^ { o } 8 }$ y $n ^ { o } 1 0 .$ : velocidad angular.

![](images/ad3f2ac72a65c73589644664e8216ff7bc89133dc52bcda21dd5a5c808359a93.jpg)

![](images/164a9c289b588ce3312b0f705275ece181d67afbd458a913424eed640c57ed81.jpg)

Figura 29. Comparación de casos nº8 (arriba) y nº10 (abajo): temperaturas.  
![](images/7753a963bfd01107e6aaf7396821cebc49429cb7207b3a858eb4c49f972cb621.jpg)

![](images/d9174ffed6ec3e92090de0b23ba5104c26fecffd49f32233fb0162609791507f.jpg)  
Figura 30. Comparación de casos nº8 (arriba) y nº10 (abajo): transferencias de calor.

Se puede observar que las transferencias de calor producidas se deben casi únicamente a las diferencias de presión existentes en el fluido entre la zona caliente y la fría. Además, la aceleración proporcionada al motor en el arranque, gracias al momento del volante de inercia $( \mathsf { J } { = } 3 \mathsf { k g } / \mathsf { m } ^ { 2 } )$ , suponen que el motor pueda funcionar sin necesidad de una variación de temperatura durante casi 500 segundos. Por tanto se puede concluir que, en este caso, el efecto de la diferencia de temperatura entre los focos es casi inapreciable y que existe un problema en el motor, ya que sin la ayuda del arranque forzado éste no funciona.

### 5.2.4. Modificación de la fuerza

Tras analizar detenidamente el comportamiento actual de la máquina se llega a la conclusión de que es posible que la fuerza que se transmite del sistema termodinámico al sistema mecánico tenga el signo cambiado, es decir, que en lugar de entrar al sistema mecánico de forma positiva, llegue de forma negativa. Por tanto, para probar si el motor funciona mejor con la fuerza negativa, se accede al área de código del sistema termodinámico y se modifica la ecuación de la fuerza resultante, introduciendo un signo negativo.

$$
\begin{array} { r l } & { \mathrm { / / { F o r } \varsigma a ~ \varsigma _ { G } \circ \varsigma _ { L } \circ \varsigma _ { C } \circ \varsigma _ { P } \circ 1 ~ \varsigma _ { L } \circ \varsigma _ { C } \circ \varsigma _ { C } \circ \varsigma _ { P } \circ \varsigma _ { C } \circ \varsigma _ { C } \circ \varsigma _ { C } } } ,  \\ &  \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm { ~ \ \ } \mathrm  ~  \end{array}
$$

Figura 31. Modificación de la ecuación de la fuerza resultante en el código del modelo termodinámico.

A continuación se comparará la presión resultante, la fuerza que llega al sistema mecánico del sistema termodinámico y la posición del pistón de potencia (sp) para los tres siguientes casos:

Tabla 4. Simulaciones modificando la rampa de temperatura y la fuerza.
<table><tr><td>Caso simulación</td><td>Tiempo simulación</td><td>Altura rampa temperatura</td><td>Momento de inercia</td><td>Fuerza</td><td>Color gráfica</td></tr><tr><td>13</td><td>(seg) 80</td><td>(K) 0</td><td>(kg/m²) 3</td><td>f</td><td>rojo</td></tr><tr><td>14</td><td>80</td><td>240</td><td>3</td><td>f</td><td>azul</td></tr><tr><td>15</td><td>80</td><td>240</td><td>3</td><td>-f</td><td>verde</td></tr></table>

### 5.2.5. Sistema de arranque forzado

El objetivo de las simulaciones es analizar la velocidad angular mínima (ω) del sistema de arranque para que funcione el motor, teniendo en cuenta la combinación de altura y duración de la rampa de aceleración.

Por otro lado, se tendrá que estudiar el calentamiento previo del motor que proporciona la temperatura del área caliente $( \mathsf { T } _ { \mathsf { c } } )$ necesaria para que el motor funcione correctamente.

De esta manera, se determinará la combinación óptima de tiempo de calentamiento, altura y duración de la rampa de aceleración.

Las simulaciones que vienen a continuación tendrán como objetivo conseguir las metas establecidas en los párrafos anteriores.

**a) Análisis del sistema sin arranque forzado**

El siguiente paso es simular el sistema aplicando la modificación de la fuerza y sin la ayuda del motor de arranque para comprobar si la máquina es capaz de moverse sin la ayuda del arranque forzado.

Para anular el efecto del motor de arranque se tiene que acceder al Step, el cual activa el embrague que frena la aceleración, e indicar que en lugar de comenzar a los 20 segundos (lo que supondría que se le daría una aceleración al motor de 20 seg) se active a los 0 segundos (lo que implica que el Step activa el embrague en el segundo 0, por lo que la aceleración no actúa).

Tabla 5. Simulación sin sistema de arranque forzado.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>16</td><td>80</td><td>20</td><td>240</td></tr></table>

Tabla 6. (Continuación) Simulación sin sistema de arranque forzado.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Step temperatura</td><td rowspan="2">Momento de inercia (kg/m²)</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td></td><td>Start Time (seg)</td></tr><tr><td>16</td><td></td><td>0</td><td>3</td><td>NO</td></tr></table>

![](images/94b9a5c9b198baea1f62cc97e95eec10d33a1f898b5985cb373bd4e1eac7b8d7.jpg)  
Figura 32. Caso de simulación $n ^ { o } 1 6 \cdot$ velocidad angular.

![](images/61ed0728977d6b1b1ef8bbfa9b6a853d7405d7d5a6aab037ed2059b66936f1d6.jpg)  
Figura 33. Caso de simulación nº16: presión.

![](images/84a5c35489eb86fd6b4f75bfcce8f463cacb79a1c5e9c5b25c1d3470debc6146.jpg)  
Figura 34. Caso de simulación $n ^ { o } 1 6 \cdot$ fuerza.

Como se puede comprobar en las gráficas realizadas, el motor no funciona correctamente, sino que va oscilando de un lado a otro sin completar una vuelta. Esto supone que se vaya acumulando presión en el cilindro y que la fuerza que actúa sobre el pistón de potencia vaya aumentando, sin ser suficiente para que se mueva el motor.

Por tanto, se puede deducir que el motor no funciona sin un sistema de arranque forzado, pero se puede tratar de disminuir la acción de dicho sistema para darle el impulso necesario a la máquina sin excederse.

**b) Análisis del sistema modificando el arranque forzado**

A continuación se llevarán a cabo una serie de simulaciones para determinar qué configuración del sistema de arranque es la óptima para máquina estudiada.

Todas las simulaciones presentadas se realizan en un tiempo de simulación de 80 segundos, con una diferencia entre los focos de temperatura de 240 grados y con un momento de inercia de $3 ~ \mathsf { k g } / \mathsf { m } ^ { 2 }$

Tabla 7. Simulaciones modificando el sistema de arranque forzado.
<table><tr><td>Caso simulación</td><td>Tiempo calentamiento (seg)</td><td>Duración aceleración (seg)</td><td>Funciona (SI/NO)</td></tr><tr><td>17</td><td>10</td><td>10</td><td>NO</td></tr><tr><td>18</td><td>12</td><td>10</td><td>NO</td></tr><tr><td>19</td><td>14</td><td>10</td><td>NO</td></tr><tr><td>20</td><td>16</td><td>10</td><td>NO</td></tr><tr><td>21</td><td>20</td><td>1</td><td>NO</td></tr><tr><td>22</td><td>20</td><td>4</td><td>NO</td></tr><tr><td>23</td><td>18</td><td>4</td><td>NO</td></tr><tr><td>24</td><td>18</td><td>6</td><td>SI</td></tr><tr><td>25</td><td>30</td><td>6</td><td>SI</td></tr><tr><td>26</td><td>30</td><td>4</td><td>NO</td></tr></table>

El tiempo de calentamiento se establece programando el Start Time de la rampa que inicia la aceleración. La duración de dicha aceleración se determina mediante el Start Time del Step que controla el embrague que frena la aceleración.

Tal y como indica la tabla anterior, las únicas simulaciones en la que el motor funciona son la nº24 y la nº25. Ambas coinciden en que la duración de la rampa de aceleración es de 6 segundos. Sin embargo, esta aceleración es demasiado larga, por lo que en el siguiente apartado se tratará de reducir el tiempo de funcionamiento del motor de arranque.

![](images/fa76eed556a38e697c7444934363e5f883ae051ed2287a73f4ca0621f019bc50.jpg)  
Figura 35. Caso de simulación nº24: velocidad angular.

![](images/12652c144f82af8314dbb0cec655dfdfc36639de5338b21abda526bc8b6e28cb.jpg)  
Figura 36. Caso de simulación nº25: velocidad angular.

**c) Análisis del sistema modificando la rampa de aceleración**

El objetivo es que se le proporcione al motor una aceleración suficiente para que se ponga en marcha, pero cuya duración no sea excesiva. Por tanto, se intentará combinar la altura de la rampa de aceleración con el tiempo de duración para conseguir que el motor se ponga en marcha, de modo que a medida que aumenta la altura de la rampa, disminuya su duración.

Sería adecuado obtener un sistema de arranque forzado cuya aceleración durase no más de 2 o 3 segundos. Se procederá a realizar diversas simulaciones para obtener la combinación adecuada. Todas ellas partirán de un calentamiento del motor de 20 segundos.

En la siguiente tabla se presentan las combinaciones establecidas:

Tabla 8. Simulaciones modificando la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo calentamiento (seg)</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>27</td><td>20</td><td>10</td><td>1</td><td>SI</td></tr><tr><td>28</td><td>20</td><td>5</td><td>2</td><td>SI</td></tr><tr><td>29</td><td>20</td><td>3</td><td>5</td><td>NO</td></tr><tr><td>30</td><td>20</td><td>4</td><td>5</td><td>SI</td></tr><tr><td>31</td><td>20</td><td>1</td><td>10</td><td>NO</td></tr></table>

Tras las simulaciones realizadas se puede comentar que el motor sólo se pone en marcha para las simulaciones nº27, 28 y 30, las cuales presentan una mayor duración de la aceleración.

![](images/4cd38d62892f831f70be3dab9989a5b76aa00236d1d9a03d3c178f75547ff97d.jpg)  
Figura 37. Caso de simulación nº27: velocidad angular.

![](images/18aaa86ca46bb678b1b0a809765c1900a76012505732ae168d979816236851d9.jpg)  
Figura 38. Caso de simulación nº29: velocidad angular.

Como ya se ha mencionado, el objetivo es reducir dicha duración, por tanto se llevarán a cabo nuevas pruebas aumentando el tiempo de calentamiento del motor para comprobar si ese aumento de temperatura es suficiente para que la máquina funcione correctamente con una aceleración más corta.

d) Análisis del sistema aumentando el tiempo de calentamiento y modificando la rampa de aceleración

A continuación se presentan las simulaciones realizadas aumentando el tiempo de calentamiento de 20 segundos a 30, 40 y 60 segundos. Todas ellas presentan diferentes combinaciones de altura y duración de la rampa de aceleración.

Tabla 9. Simulaciones aumentando el tiempo de calentamiento y modificando la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo calentamiento (seg)</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>32</td><td>40</td><td>1</td><td>10</td><td>NO</td></tr><tr><td>33</td><td>40</td><td>2</td><td>10</td><td>NO</td></tr><tr><td>34</td><td>40</td><td>3</td><td>10</td><td>SI</td></tr><tr><td>35</td><td>50</td><td>1</td><td>10</td><td>NO</td></tr><tr><td>36</td><td>50</td><td>2</td><td>10</td><td>NO</td></tr><tr><td>37</td><td>50</td><td>3</td><td>10</td><td>SI</td></tr><tr><td>38</td><td>60</td><td>1</td><td>12</td><td>NO</td></tr><tr><td>39</td><td>60</td><td>2</td><td>12</td><td>NO</td></tr></table>

La tabla anterior muestra que sólo las combinaciones que cuentan con una duración de 3 segundos de aceleración favorecen el funcionamiento del motor, independientemente del tiempo de calentamiento de la máquina o de la altura de la rampa de aceleración. La siguiente gráfica muestra el caso de simulación n⁰34, uno de los dos casos en los que el motor funciona.

![](images/b16479f6e81c0459c96871fe7ea05a85533bc2a2f39a75447547aef8ba263616.jpg)  
Figura 39. Caso de simulación nº34: velocidad angular.

Para tratar de disminuir la duración de la aceleración se llevarán a cabo pruebas aumentando el tiempo de simulación, el tiempo de calentamiento y modificando la rampa de aceleración.

e) Análisis del sistema aumentando la altura de la rampa de aceleración y el tiempo de simulación

Tras las pruebas anteriores se decide aumentar la altura de la rampa de aceleración a 15 y el tiempo de simulación a 200 seg, estableciendo un calentamiento previo de la máquina de 100 segundos. Esta modificación persigue el objetivo de obtener una diferencia de temperaturas entre los focos lo suficientemente grande para que el motor funcione durante 200 segundos, con una aceleración que favorezca el arranque de la máquina.

Tabla 10. Simulaciones aumentando el tiempo de simulación y la altura de la rampa de aceleración.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo simulación (seg)</td><td rowspan="2">Tiempo calentamiento</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>40</td><td>200</td><td>(seg) 100</td><td>1</td><td>15</td><td>NO</td></tr><tr><td>41</td><td>200</td><td>100</td><td>2</td><td>15</td><td>NO</td></tr><tr><td>42</td><td>200</td><td>100</td><td>3</td><td>15</td><td>SI</td></tr></table>

Una vez realizadas las simulaciones anteriores se determina que la máquina precisa de, al menos, tres segundos de aceleración para que pueda completar la primera vuelta, con una altura de 15. El comportamiento del motor con dichas especificaciones se puede observar en la siguiente gráfica:

![](images/9278ae5e99fefbe4d8eca84a662538f4c7c46ed1bcbbe3976f2d6df34db07fb8.jpg)  
Figura 40. Caso de simulación $n ^ { o _ { 4 2 } }$ : velocidad angular.

![](images/d9d3dd19a1407a335ee1fbbc08ed8d2abfa903f8fb2c45711ebc1977742e4679.jpg)  
Figura 41. Caso de simulación $n ^ { o _ { 4 2 } } .$ : temperaturas.

Como las temperaturas obtenidas en el foco caliente no son lo suficientemente elevadas, se procederá a aumentar la altura del Step de temperatura, de modo que la diferencia entre los focos caliente y frío sea mayor. Esta modificación está basada en la comprobación de que en una maqueta de un motor Stirling en funcionamiento, las temperaturas del foco caliente son mucho más elevadas que las obtenidas en las simulaciones mediante Dymola.

**f) Análisis del sistema aumentando la temperatura del foco caliente**

Se establece la altura del Step de temperaturas a 500, se determina un tiempo de calentamiento de 30 segundos y una rampa de aceleración cuya altura es de 15 y cuya duración es de 3 segundos.

Tabla 11. Simulación aumentando la temperatura del foco caliente.
<table><tr><td>Caso simulación</td><td>Tiempo</td><td>Tiempo simulación (seg) calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>43</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 12. (Continuación) Simulación aumentando la temperatura del foco caliente.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>43</td><td>3</td><td>15</td><td>SI</td></tr></table>

![](images/c9046fe94ffc12aecd71bffa07aa200644c90503415cbdcc080b726f0eb2a03d.jpg)  
Figura 42. Caso de simulación nº43: velocidad angular.

![](images/6805d7d136c50624f90f55cf0bfebfccd8e9fa6cd75da1227c5cdbeb22968dda.jpg)  
Figura 43. Caso de simulación nº43: temperaturas.

La simulación anterior funciona correctamente, pero la velocidad angular oscila mucho y no aumenta paulatinamente, sino que va decayendo poco a poco. Por tanto, para eliminar dicha oscilación se procede a aumentar el momento de inercia del motor (J).

**g) Aumento del momento de intercia (J)**

Se establece un momento de inercia de J=5 y se procede a simular el funcionamiento del sistema. Tras el experimento se comprueba que, efectivamente, la oscilación de la velocidad angular se reduce notablemente.

Tabla 13. Simulación aumentando el momento de inercia.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>44</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 14. (Continuación) Simulación aumentando el momento de inercia.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia  $( \log / \mathbf { m } ^ { 2 } )$ </td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td></tr><tr><td>44</td><td>3</td><td>15</td><td>5</td><td>SI</td></tr></table>

![](images/d29f64ef80ef59dac3f915b8d3f0e5d08fd3ed97ea2ebb6638b49ce49b6ddd6c.jpg)  
Figura 44. Caso de simulación nº44: velocidad angular.

![](images/a63dc21b5cadab0893bdc4d350fa6f04ab372236da2ece592e0d10e49fca673e.jpg)  
Figura 45. Caso de simulación nº44: temperaturas.

Sin embargo, pese a que la temperatura del foco caliente es elevada en los primeros instantes de la simulación, ésta va disminuyendo a lo largo del tiempo, lo que supone una degradación del funcionamiento de la máquina. Por tanto, se decide mejorar la refrigeración del sistema y la transferencia de calor del foco caliente aumentando los coeficientes de transferencia de calor $\mathsf { U } _ { \mathsf { C } } \ \mathsf { y } \ \mathsf { U } _ { \mathsf { F } }$

**h) Aumentar los coeficientes de transferencia de calor**

Inicialmente, los coeficientes tomaban valores de $\mathsf { U } _ { \mathsf { C } } = 1 0 \ \mathsf { y } \ \mathsf { U } _ { \mathsf { F } } = 1 0 0$ . Se realiza una primera prueba aumentando los valores a $\mathsf { U } _ { \mathsf { C } } = 1 0 0 \ \mathsf { y } \ \mathsf { U } _ { \mathsf { F } } = 1 0 0 0$ . En la imagen siguiente se presenta la zona del código donde se implanta la modificación de los coeficientes.

```matlab
animation=false) a;
Modelica.Mechanics.MultiBody.Interfaces.Frame_a
cylinder_al
a;
Modelica.Mechanics.MultiBody.Interfaces.Frane_a
cylinder_bl
a;
Modelica.Mechanics.MultiBody.Interfaces.Frame_a
crank_al
a;
Modelica.Mechanics.MultiBody.Interfaces.Frame_a
crank_b1
a;
Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
a;
Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensorl
a;
Modelica.Blocks.Sources.Constant TF(k=293.15)
a;
Modelica.Blocks.Sources.Ramp TC( duration=10,
offset=293.15,
height=500)
a;
ModelTermodinamic_Stirling
gasStirlingl(
Pl(fixed=true),
nt(fixed=true),
nl(fixed=true),
n2(fixed=true),
Uc=1000,
Uf=1000L
d2=Piston_potencia.diameter,
dl=Desplacador.diameter,
1_d=Desplacador.length,
dc=0.18,
Vm1=0.002,
Vm2=0.0015) a;
ModelConnectors_Forces modelConnectors_Forces a;
```  
Figura 46. Modificación de los coeficientes de transferencia de calor en ModelMecanic\_Stirling.

Tabla 15. Simulaciones modificando los coeficientes de transferencia de calor.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración (seg)</td><td>Altura</td><td>Uc</td><td>UF</td></tr><tr><td>45</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr><tr><td>46</td><td>3</td><td>15</td><td>5</td><td>1000</td><td>1000</td><td>NO</td></tr></table>

![](images/3541489218e3aef0eed98b2660f8674ca5ef37a1dfac4171ea09a369ca564917.jpg)  
Figura 47. Caso de simulación nº45: velocidad angular.

![](images/b8222d86fd33fef9ee2860e78f73a360a64750bb8c1cb9781719d023136a9d7f.jpg)  
Figura 48. Caso de simulación $n ^ { o } 4 5 \cdot$ temperaturas.

Como se comprueba que funciona, se decide aumentar el valor de $\mathsf { U } _ { \mathsf { C } }$ a 1000. Tras la simulación se observa que esta modificación no es válida, puesto que la máquina no funciona.

i) Aumentar el tiempo de simulación con la modificación de los coeficientes de transferencia de calor

Se pretende comprobar si el motor funciona correctamente durante más tiempo, por lo que se aumenta el intervalo de simulación a 300 segundos, manteniendo la combinación de coeficientes de calor a $\mathsf { U } _ { \mathtt { C } } = 1 0 0 \ \mathsf { y } \ \mathsf { U } _ { \mathtt { F } } = 1 0 0 0$

Tabla 16. Simulación aumentando el tiempo de simulación y modificando los coeficientes de transferencia de calor.
<table><tr><td>Caso simulación</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td colspan="2">Coeficientes transferencia calor</td><td>Funciona (SI/NO)</td></tr><tr><td>47</td><td>300</td><td>30</td><td> ${ \bf u } _ { \mathsf { c } }$  100</td><td> $\theta _ { F }$  1000</td><td>SI</td></tr></table>

![](images/3bd9ce3f683802db087cc079793c6211c4c93072c02a557cf08123a85df82dea.jpg)  
Figura 49. Caso de simulación nº47: velocidad angular.

![](images/fbaa91b92d73c7d44eecf8009d455550e86ed8c2d10086f72d64da10f59fe2d7.jpg)  
Figura 50. Caso de simulación nº47: temperaturas.

Se comprueba que la velocidad angular se mantiene prácticamente constante y se determina que el modelo actual cuenta con unas características que permiten el correcto funcionamiento del motor. Sin embargo, no es un modelo interesante para constituir una máquina con una aplicación real, ya que la velocidad angular es muy baja y oscilante.

Por tanto, se decide que en lugar de modificar esta máquina se procederá a crear un prototipo formado por dos bloques o cuatro bloques, cada uno de los cuales será un motor Stirling en sí, prototipo que proporcionará un funcionamiento continuo. De este modo se podrá caracterizar una máquina que, aunque no sea la más óptima, será una máquina funcional.

## 5.3. Desarrollo de un prototipo

En el apartado anterior se determinaron las características con las que debía contar el modelo del motor Stirling para funcionar adecuadamente, tras una serie de simulaciones llevadas a cabo en Dymola.

A continuación se expondrán los distintos prototipos estudiados para el motor Stirling. Dichos prototipos están basados en la conexión de bloques, dentro de los cuales se encuentra un motor con un pistón de potencia y un desplazador. Las máquinas creadas estarán formadas por dos y cuatro bloques.

### 5.3.1. Máquina de dos bloques

Esta máquina consiste en la conexión de dos motores con un desfase de 180º entre ellos.

En primer lugar, se accede al área de interacción del motor Stirling y se selecciona el bloque llamado stirling, tras lo cual se copia y se pega en la misma pantalla. El nuevo bloque creado se llamará stirling1. A partir de ahora, en esta memoria se conocerá como bloque 1 (o motor 1) al stirling, y bloque 2 (o motor 2) al stirling1.

A continuación se procede a conectar directamente ambos bloques y a averiguar en qué lugar se debe programar el desfase de 180º entre los bloques y el desfase de 90º entre los cilindros que conforman cada bloque.

![](images/673d38139a133e8c1f71109ea9f58e4ec3bc78bd45affb9fdb9d90500a77c0b5.jpg)  
Figura 51. Conexión de la máquina de dos bloques en el área de interacción del motor Stirling.

Si se da doble click en el bloque del motor 1, se abre una ventana en la que es posible programar el desfase entre el pistón de potencia y el desplazador. Los parámetros modificados son:

• Pistón de potencia: cylinderInclination = 0 deg

•Desplazador: cylinderInclination1 = 90 deg

![](images/8e75fb568ed80119a018e99091c39422894bd0b9f55b9f852c2512b418a7805a.jpg)  
Figura 52. Programación del desfase entre pistón de potencia y desplazador del motor 1.

En cuanto al motor 2, el procedimiento es similar. Se accede al bloque stirling1 y se programa tanto el desfase entre los cilindros como el desfase de 180º entre un bloque y otro. Los parámetros a modificar son:

• Pistón de potencia: cylinderInclination = 180 deg

• Desplazador: cylinderInclination1 = 270 deg

![](images/13d551ef53ae65d373c91e39495bbbc80c468a3f5c01700730cba89611a0c0d3.jpg)  
Figura 53. Programación del desfase entre los cilindros del motor 2 y entre el motor 1 y 2.

La siguiente imagen muestra la animación 3D que Dymola genera para el prototipo de máquina de 2 bloques.

![](images/3eabd4eacfd10776da1423815cef41fdb1f0d4c892038b797aca12fe78017cd8.jpg)  
Figura 54. Visualización 3D de la máquina de 2 bloques.

Una vez conexionados los dos bloques y programados los desfases pertinentes, se procede a simular con Dymola. En el primer intento de simulación, Dymola advierte mediante un mensaje que hay una condición escalar de sobra. Dicha condición escalar sobrante es la inicialización de la posición del cilindro del pistón de potencia de los motores 1 y 2.

En la imagen siguiente se muestra la localización del cilindro del pistón de potencia en el modelo mecánico del motor Stirling implementado.

![](images/9d16886147c56ba6ba57dff57dfb9b7b5ae301c59a867315d8783293007c3ab4.jpg)  
Figura 55. Localización del cilindro del pistón de potencia en el área de interacción del ModelMecanic\_Stirling.

Inicialmente, el pistón de potencia de los motores 1 y 2 estaba programado con una posición inicial de 0.09 m. Para que el prototipo de 2 bloques funcione, el pistón de potencia de ambos bloques tiene que estar inicializado a 0 m.

A continuación se presenta la modificación de dicha condición, que consiste en abrir la ventana del cilindro de potencia del motor 1 y del motor 2 y eliminar la selección de la inicialización de posición, s.start. Como se puede observar en la imagen, no hay ningún tick marcado en la casilla.

![](images/ff3ab9828cab3df3c41e777c2664af312119ff4812c8947c02775d60f43c823f.jpg)  
Figura 56. Modificación de la inicialización de posición del cilindro de potencia.

Una vez programada la modificación anterior se procede a simular la máquina con las condiciones establecidas en el apartado anterior, las cuales aparecen recogidas en la siguiente tabla:

Tabla 177. Simulación de la máquina con 2 bloques con las condiciones establecidas.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura (K)</td></tr><tr><td>48</td><td>2</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 18. (Continuación) Simulación de la máquina con 2 bloques con las condiciones establecidas.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración</td><td>Altura </td><td>Uc</td><td>UF</td></tr><tr><td>48</td><td>(seg) 3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr></table>

![](images/bc05d568f72cbd6d373d37681e5cb9b5d4e6eb5d64b33899bbbc4590fe094b4a.jpg)  
Figura 57. Caso de simulación nº48: velocidad angular.

En la siguiente gráfica aparecen representadas las temperaturas de los focos caliente y frío de ambos motores.

• Motor 1: $\mathsf { A z u l } = \mathsf { T } _ { \mathsf { C } } , \mathsf { R o j } 0 = \mathsf { T } _ { \mathsf { F } }$

• Motor 2: $\mathsf { V e r d e } \mathrm { = } \mathsf { T } _ { \mathsf { C } } ,$ Fuccia= TF

![](images/9b0414b2ec17f98eff5d4dcba32b4af42ee9f997af0a9a57d4abc29089018eee.jpg)  
Figura 58. Caso de simulación nº48: temperaturas.

La siguiente simulación llevada a cabo incluye la modificación del tiempo de simulación, para observar si la máquina funciona correctamente durante 300 segundos.

Tabla 18. Simulación de la máquina con 2 bloques aumentando el tiempo de simulación.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación (seg)</td><td>Tiempo calentamiento (seg)</td><td>Altura rampa temperatura</td></tr><tr><td>49</td><td>2</td><td>300</td><td>30</td><td>(K) 500</td></tr></table>

Tabla 19. (Continuación) Simulación de la máquina de 2 bloques aumentando el tiempo de simulación.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia (kg/m²)</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona (SI/NO)</td></tr><tr><td>Duración</td><td>Altura</td><td>Uc</td><td>UF</td></tr><tr><td>49</td><td>(seg) 3</td><td>15</td><td>5</td><td>100</td><td>1000</td><td>SI</td></tr></table>

![](images/8e57241c0368286c3e1cfa4adf886c6410e655397261c0d0ceb4f50c6275720a.jpg)  
Figura 59. Caso de simulación nº49: velocidad angular.

![](images/7330cd67a1f20dc84b54324ef82723705224a7d667c71f285f3796abc4dd786a.jpg)  
Figura 60. Caso de simulación nº49: temperaturas.

Como se puede observar en las graficas anteriores, el motor Stirling de dos bloques funciona correctamente durante 300 segundos.

A continuación se compararán las simulaciones realizadas para la máquina de 1 bloque y para la máquina de 2 con las mismas condiciones, de modo que se puedan analizar las mejoras que trae consigo el motor de dos bloques.

![](images/9831beb05465771a3f716dd2462d3eeca76e11ff5fe3250f824e58c0992ee8f5.jpg)  
Figura 61. Comparación de la máquina de 1 bloque (azul) y 2 bloques (rojo): velocidad angular.

La gráfica anterior muestra que la máquina de 2 bloques presenta una velocidad angular mucho más estable, con menos oscilaciones que la del motor de 1 solo bloque. Además, el valor medio de la velocidad coincide en ambos motores.

Por tanto, queda comprobado que la creación de un motor Stirling con dos bloques es una mejora considerable, ya que se consigue una mayor estabilidad en el sistema.

La siguiente gráfica compara las temperaturas de los focos de la máquina de 1 bloque y la máquina de 2 bloques:

Máquina de 1 bloque: $\mathsf { A z u l } = \mathsf { T } _ { \mathsf { C } } , \mathsf { R o j } 0 = \mathsf { T } _ { \mathsf { F } }$

• Máquina de 2 bloques:

$$
\begin{array} { r l } { \circ } & { { } M o t o r \ 1 : \ { \mathsf { V e r d e } } = { \mathsf { T } } _ { \mathsf { C } } , { \mathsf { F u c c i a } } = { \mathsf { T } } _ { \mathsf { F } } } \end{array}
$$

$$
\begin{array} { r l } { \circ } & { { } M o t o r \ 2 \colon \mathsf { N e g r o } = \mathsf { T } _ { \mathsf { C } } , \mathsf { A } \mathsf { z } \mathsf { u } | \ \mathsf { x } = \mathsf { T } _ { \mathsf { F } } } \end{array}
$$

![](images/576b86fd6eb91cb938aff54f79832d9371aa1b4bf267780388573e5aa8057230.jpg)  
Figura 62. Comparación de la máquina de 1 bloque y 2 bloques: temperaturas.

La temperatura del foco caliente del motor con un bloque oscila mucho más que la del motor con dos bloques. Sin embargo, el motor con 1 bloque alcanza una temperatura de foco caliente más elevada.

En cuanto a la temperatura del foco frío, ambas máquinas presentan oscilaciones similares y un valor medio de temperatura semejante.

La siguiente modificación que se le aplica al modelo es la de establecer los focos de temperatura $T _ { \mathsf { C } } \mathsf {  ~ y ~ T _ { F } ~ }$ fuera de los bloques de los motores.

Se procede a eliminar los bloques de los focos de dentro de los motores y ponerlos en el área de interacción global.

A continuación se crean dos conectores para $T _ { \mathsf { C } } \ \mathsf { y } \ \mathsf { T } _ { \mathsf { F } }$ dentro de cada bloque del motor. Para ello se tiene que sacar una línea de conexión del punto de entrada de temperatura en el modelo termodinámico y, con el botón derecho, seleccionar Create connector. De este modo se generan dos conectores de forma triangular en el área de interacción global. Dichos conectores se tienen que conectar a los bloques de temperatura $T _ { \mathsf { C } } ~ \mathsf { y } ~ \mathsf { T } _ { \mathsf { F } } ,$ tras lo cual se dispone de un modelo que funciona exactamente igual que en el caso anterior, pero que permite una modificación de la temperatura de los focos mucho más sencilla y práctica.

![](images/c02a65e9000833c93ff4c0e651cc0fc83a0a2350efa5f4090c1672ac7efa34ff.jpg)  
Figura 63. Conexión de la máquina de dos bloques en el área de interacción del motor Stirling con los focos de temperatura fuera de los bloques de los motores.

Como ya se ha comentado anteriormente, el objetivo de este proyecto es obtener un modelo funcional del motor Stirling que produzca una potencia adecuada para su uso en la vida real. Por tanto, es interesante conocer la potencia generada por el modelo creado hasta el momento. Para ello se analizará la potencia obtenida en el componente Damper, el cual aplica el rozamiento al eje del motor. El valor actual del Damper es ${ \mathsf { d } } { = } 0 . 0 1$

![](images/b9012562d4d2a52eee2fa595982c7bb610fc2385bb5c86193704045eee489d1f.jpg)  
Figura 64. Potencia de la máquina de 2 bloques para d=0.01.

En la gráfica anterior se puede comprobar que la potencia obtenida es muy baja, alrededor de unos 0.2 W. Como esta potencia no es la deseada, se procederá a aumentar paulatinamente el valor del Damper y analizar la potencia generada.

Tabla 20. Simulaciones de la máquina de 2 bloques variando el Damper.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación</td><td>Damper</td><td>Potencia generada LossPower (W)</td><td>Funciona (SI/NO)</td></tr><tr><td>50</td><td>2</td><td>(seg) 300</td><td>0.1</td><td>1.5</td><td>SI</td></tr><tr><td>51</td><td>2</td><td>300</td><td>0.5</td><td>5</td><td>SI</td></tr><tr><td>52</td><td>2</td><td>300</td><td>1</td><td>0</td><td>NO</td></tr><tr><td>53</td><td>2</td><td>300</td><td>0.6</td><td>5.2</td><td>SI</td></tr><tr><td>54</td><td>2</td><td>300</td><td>0.8</td><td>7</td><td>SI</td></tr></table>

![](images/592fc8712bc2335f3122ebdacef00aff2bf8af4879bb96740dc46b6f7901685a.jpg)  
Figura 65. Caso de simulación nº50: potencia generada.

![](images/c473cb48509e3b04504b06b7be34927dda1ce79891022cb23864acdfe3ac43ea.jpg)

Figura 66. Caso de simulación nº51: potencia generada.  
![](images/b9acddf9868d612f335bc0db401ddf0f5ee97398ff59da1aca49a9ef6d5714cb.jpg)  
Figura 67. Caso de simulación nº52: potencia generada.

![](images/f95dca84f42c2bd9b109a50c42d6aee231d5138be0e5a4e8aff444dd95e18ac7.jpg)  
Figura 68. Caso de simulación nº53: potencia generada.

![](images/62e49003f5b314933bdb46120a2b1dbcadcf1b4a8d219ae1bae415df739465c4.jpg)  
Figura 69. Caso de simulación nº54: potencia generada.

En la tabla anterior aparece recogida la potencia generada por la máquina para cada caso. Con un valor de 0.8 en el Damper se obtiene una potencia media de 7W. Sin embargo, se puede observar que la potencia generada no es constante y el valor obtenido no es suficiente para que el motor Stirling pueda ser competente en la vida real.

Por otro lado, la velocidad del motor es muy baja, alrededor de una vuelta por segundo. Si la máquina con 2 bloques fuese más revolucionada, no sería necesario configurar una nueva máquina de 4 bloques. Sin embargo, debido a la lentitud de la máquina de 2 bloques se decide crear un modelo de motor de 4 para obtener una potencia más adecuada.

Debido a esto se decide comenzar a simular con un motor de 4 bloques, con el objetivo de obtener un funcionamiento más continuo y una semejanza a un motor de un vehículo (motor de 4 tiempos).

### 5.3.2. Máquina de cuatro bloques

Siguiendo el procedimiento aplicado para la creación del modelo de la máquina de dos bloques, se creará un nuevo modelo para el motor de cuatro bloques. Dicho modelo estará programado con los focos de temperatura externos a los bloques de los motores. Además, será necesario establecer los desfases existentes entre cada uno de los bloques.

![](images/8d3ab7a611b775ebcdd8166c571f268d840906271c37939439cfcd5254f45456.jpg)  
Figura 70. Conexión de la máquina de cuatro bloques en el área de interacción del motor Stirling.

A continuación se programarán los desfases entre los cilindros de cada uno de los motores y el desfase existente entre los bloques.

Los parámetros modificados para el motor 1 son:

• Pistón de potencia: cylinderInclination = 0 deg

• Desplazador: cylinderInclination1 = 90 deg

![](images/1e9e44d7cae2e974b1f90360e20e1cd645e1aff4361fdbbe57a95c811cdd4ca5.jpg)  
Figura 71. Programación del desfase entre el pistón de potencia y el desplazador del motor 1.

Los parámetros modificados para el motor 2 son:

• Pistón de potencia: cylinderInclination = 90 deg

• Desplazador: cylinderInclination1 = 180 deg

![](images/8779f496cb2b995e510600ba81f7dee12b81bcc4e27faa5c192fe3dc7a05fd5c.jpg)  
Figura 72. Programación del desfase entre los cilindros del motor 2 y entre el motor 1 y 2.

Los parámetros modificados para el motor 3 son:

• Pistón de potencia: cylinderInclination = 180 deg

• Desplazador: cylinderInclination1 = 270 deg

![](images/afa529d3471976cf915d03062f765e9a228950bf89563d4b86469c0e99bad1fa.jpg)  
Figura 73. Programación del desfase entre los cilindros del motor 3 y entre el motor 2 y 3.

Los parámetros modificados para el motor 4 son:

• Pistón de potencia: cylinderInclination = 270 deg

•Desplazador: cylinderInclination1 = 360 deg

![](images/63a91b6af3975b93a4c7d124f81b5f25ba0796e9c8b7229a1fd00c0bfd2b0389.jpg)  
Figura 74. Programación del desfase entre los cilindros del motor 4 y entre el motor 3 y 4.

En la imagen siguiente se puede observar la visualización en 3D del prototipo de máquina de 4 bloques en la animación que Dymola genera.

![](images/1fb9cf93144e8210f726b17647e2ac771dcd50c2b2ff7adbda2eff63d5c3ef61.jpg)  
Figura 75. Visualización 3D de la máquina de 4 bloques.

A continuación se realizarán una serie de simulaciones variando el valor del Damper y analizando la velocidad angular resultante y la potencia generada. Tras dichas simulaciones se tratará de caracterizar la curva de potencia de la máquina de 4 bloques.

Tabla 21. Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td>Caso simulación</td><td>No bloques</td><td>Tiempo simulación</td><td>Tiempo calentamiento</td><td>Altura rampa temperatura</td></tr><tr><td>55</td><td>4</td><td>(seg) 80</td><td>(seg) 30</td><td>(K) 500</td></tr><tr><td>56</td><td>4</td><td>300</td><td>30</td><td>500</td></tr><tr><td>57</td><td>4</td><td>80</td><td>30</td><td>500</td></tr></table>

Tabla 22. (Continuación) Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td rowspan="2">Caso simulación</td><td colspan="2">Rampa aceleración</td><td rowspan="2">Momento de inercia  $( \log / \mathbf { m } ^ { 2 } )$ </td><td colspan="2">Coeficientes transferencia calor</td></tr><tr><td>Duración (seg)</td><td>Altura</td><td> $\mathbf { u } _ { \mathsf { c } }$ </td><td> $\theta _ { F }$ </td></tr><tr><td>55</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td></tr><tr><td>56</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td></tr><tr><td>57</td><td>3</td><td>15</td><td>5</td><td>100</td><td>1000</td></tr></table>

Tabla 23. (Continuación) Simulaciones de la máquina de 4 bloques variando el Damper.
<table><tr><td>Caso simulación</td><td>Damper</td><td>Potencia generada LossPower (W)</td><td>Velocidad angular (rad/s)</td><td>Funciona (SI/NO)</td></tr><tr><td>55</td><td>0.5</td><td>3,8</td><td>2,8</td><td>SI</td></tr><tr><td>56</td><td>1.0</td><td>5,6</td><td>2,4</td><td>SI</td></tr><tr><td>57</td><td>1.5</td><td>7,2</td><td>2,2</td><td>SI</td></tr><tr><td>58</td><td>2.0</td><td>8,2</td><td>2,0</td><td>SI</td></tr></table>

Las gráficas siguientes representan la velocidad angular y la potencia generada para cada una de las simulaciones anteriores.

![](images/5a4f1ea674f3e0e764e5b138b20dc4086b7bb31e4ecc74aef10795117a15b461.jpg)  
Figura 76. Caso de simulación nº55: velocidad angular.

![](images/640272daa7ed35cb7c62ae3fc5bcbf77fecfb0e51e47fd0ca5e48bd1a68db256.jpg)  
Figura 77. Caso de simulación nº55: potencia generada.

![](images/3e4ef73bc601cde83981e9bd0c4cff57aff8910f6b177fdf0367a1b4b1d00d74.jpg)  
Figura 78. Caso de simulación nº56: velocidad angular.

![](images/9ed0100d1f62ea60eb3b4bb332625272c6e0f871e7c0c476cf807a360835665c.jpg)  
Figura 79. Caso de simulación nº56: potencia generada.

![](images/2faac14ec85addec5eebb93b9e3e53a99a5eb55ad77bcd641bc8d011e11bff91.jpg)  
Figura 80. Caso de simulación nº57: velocidad angular.

![](images/5692a21619d5adb3d8aa2dc13cb36b39058994b28c72ea388c31ff0c141e615b.jpg)  
Figura 81. Caso de simulación nº57: potencia generada.

![](images/a9a9795de463916b0a2a2f6b23efeea2ca0f773a1c7ae0515f11cdc286a20545.jpg)  
Figura 82. Caso de simulación nº58: velocidad angular.

![](images/c4196ec14913deba832cb57e028dbb55f33bcc89590efe28a931482b27fc69b8.jpg)  
Figura 83. Caso de simulación nº58: potencia generada.

Para poder definir más a fondo la máquina que se está diseñando, se tratará de elaborar una curva característica aproximada de la potencia generada por este modelo.

![](images/c287f60101dfe0bb905972c325a4ea6f3f62c2ad0c50909762a1226586716e3d.jpg)  
Figura 84. Curva característica de potencia de la máquina de 4 bloques.

Tal y como se aprecia en la curva característica realizada, la máquina con 4 bloques puede soportar dampers más grandes y proporcionar más potencia que la máquina de 2 bloques, la cual con un damper de 1 ya no funciona correctamente.

La curva característica proporciona una buena visión de conjunto de la máquina en si, por lo que en estudios posteriores se realizará un barrido para distintos valores de dámper y se obtendrán varios puntos de velocidad angular y potencia promedios, con los cuales se podrá determinar una curva característica mucho más fiable.

# CAPÍTULO 6: CONCLUSIONES

Durante el proceso llevado a cabo para cumplir el objetivo de estudiar y modelizar un motor Stirling, se han conseguido las siguientes metas:

• Se ha comprendido a fondo el funcionamiento mecánico y termodinámico del motor.

• Se han adquirido conocimientos de programación y simulación con la herramienta Dymola.

• Se ha estudiado la modelización total del motor en su estado previo.

• Se ha evaluado dicha modelización en busca de los errores que imposibilitaban su correcto funcionamiento.

• Se ha llevado a cabo un exhaustivo proceso de simulación que ha finalizado con la obtención de un modelo funcional de la máquina.

• Se han estudiado distintas posibilidades de obtener un prototipo del motor más estable y con una mayor generación de potencia mecánica.

Este proyecto comenzó partiendo de un modelo semi-funcional del motor Stirling, el cual se ha corregido y optimizado para finalmente obtener un modelo caracterizado de un motor de 4 bloques.

Además de desarrollarse un prototipo funcional del motor con mejores características técnicas, se han sentado las bases para futuras mejoras de la máquina.

Sin embargo, el paso de optimización no es demasiado viable en el modelo actual. Se debería mejorar la programación para poder llevar a cabo un estudio paramétrico efectivo.

Pese a frustraciones y problemas ocasionales, la realización de este proyecto ha sido muy satisfactoria, ya que me ha aportado conocimientos sobre simulación de sistemas físicos y el uso de distintos métodos numéricos de cálculo. He aprendido a resolver problemas en nuevos entornos en los que antes no había trabajado y a consolidar muchos otros conocimientos adquiridos previamente. Además, este proyecto me ha permitido conocer de cerca la tecnología del motor Stirling, cuya aplicación en el ámbito de las energías renovables ha sido siempre una motivación para seguir trabajando.

# CAPÍTULO 7: FUTURAS MEJORAS

Una de las posibles mejoras a implementar en el modelo, que ya se introdujo en el capítulo de conclusiones, es la optimización del modelo a nivel de programación, de manera que se facilite la interacción del área de diseño para poder realizar un estudio paramétrico efectivo. Este estudio estaría destinado a la caracterización de una máquina con un mejor comportamiento de potencia y velocidad de giro.

Por otro lado, también sería interesante la creación de una tabla en el área de interacción donde se recogiesen los parámetros más influyentes en el funcionamiento del motor. Dicha tabla sería el único punto donde los parámetros podrían ser modificados, quedando automáticamente establecidos a todos los niveles del modelo.

Otro de los objetivos a largo plazo sería modelar un prototipo de motor con los valores obtenidos en el estudio paramétrico, el cual tuviese un rendimiento más alto y cuyo funcionamiento se ajustase más a la realidad de un motor Stirling.

# CAPÍTULO 8: BIBLIOGRAFÍA

## 8.1. Referencias de bibliografía

García Prat, Albert. Sistema autònom de generació elèctrica basat en motor Stirling. EUETIB, Universitat Politècnica de Catalunya, 2013.

## 8.2. Bibliografía de consulta

Bachmann, Bernhard. Modelica Tutorial for Beginners. Exercises with Dymola. University of Applied Sciences. Bielefeld(Germany). http://www.isa.uma.es/C15/SeminarioModel (último acceso: 3 de Febrero de 2014).

Brill, Anna. Optimization of Stirling Engine Power Output Through Variation of Choke Point Diameter and Expansion Space Volume. http://www.scientiareview.org/pdfs/168.pdf (último acceso: 7 de Febrero de 2014).

Desarrollos de motores Stirling. http://mstirling.wordpress.com/category/aplicaciones/(último acceso:20 de Mayo de 2014).

Dulin, Josua, Matthew Hove, y Jonathan D. Lilley. Stirling Engine - Bringing Electricity to Remote Locations. Faculty of the Mechanical Engineering Department. California Polytechnic State University, San Luis Obispo, June 2013.

Dymola. Dynamic Modeling Laboratory. Getting started with Dymola. Chapter 2. 2011. http://www.3ds.com/fileadmin/PRODUCTS/CATIA/DYMOLA/PDF/Getting-(último acceso: 3 de Febrero de 2014).

Electropedia. The Stirling Engine. http://www.mpoweruk.com/stirling\_engine.htm(último acceso: 13 de Febrero de 2014).

He, Mike, y Seth Sanders. Design of a 2.5kW Low Temperature Stirling Engine for Distributed Solar Thermal Generation. University of California - Berkeley, Berkeley, CA, 94720, USA. http://power.eecs.berkeley.edu/publications/he\_design\_stirling\_engine.pdf (último acceso: 10 de Febrero de 2014).

Jiménez Abete, Aitziber. Testing and optimizacion of the performance of a Stirling engine. http://academica-e.unavarra.es/handle/2454/7466(último acceso:9 de Marzo de 2014).

Modelica. Modelica - A Unified Object-Oriented Language for Physical System Modeling. Tutorial. https://www.modelica.org/documents/ModelicaTutorial14.pdf (último acceso: 3 de Marzo de 2014).

Moran, M.J., y H. Shapiro. Fundamentos de la Termodinámica Técnica. Barcelona: Reverté, 2005.

Morash, Alex, Andrew McMurray, Bryan Neary, Kristian Richards, Dominic Groulx, y Angus. MacPherson. Team 04 Stirling. http://poisson.me.dal.ca/\~dp\_08\_04/Theory.html (último acceso: 21 de Mayo de 2014).

Normani, Franco. Stirling Engine Manual. 2013. http://www.real-world-physicsproblems.com/support-files/stirling\_manual\_sample.pdf (último acceso: 8 de Febrero de 2014).

Revilla Vázquez, Maurici. Sistema de generación de energía basado en un motor Stirling aprovechando energías renovables. PFC. Universitat Politècnica de Catalunya, 2009.

Snyman, H., T.M. Harms, y J.M. Strauss. «Design analysis methods for Stirling engines.» Journal of Energy in Southern Africa, August, 2008: Vol. 19, No. 3.

Stirling Engines Mechanical Configurations. http://www.ohio.edu/mechanical/stirling/engines/engines.html (último acceso: 8 de Marzo de 2014).

Tarawneh, M., F. Al-Ghathian, M.A. Nawafleh, y N. Al-Kloub. «Numerical Simulation and Performance Evaluation of Stirling Engine Cycle.» Jordan

Journal of Mechanical and Industrial Engineering, 2010: Volume 4, Number 5.

Tecmotor. Página web sobre motores Stirling. http://tecmotor.wordpress.com/ (último acceso: 20 de Mayo de 2014).

University, Ohio. Stirling Cycle Machine Analysis. http://www.ohio.edu/mechanical/stirling/me422.html (último acceso: 5 de Marzo de 2014).

Walsh, Dr. John. Basic principles of operation and applications of the Stirling engine from its invention in 1816 to its modern uses. 2012. http://etta.ie/engineering/Ic/special\_topics/Etta\_Special\_Topic\_2012.pdf (último acceso: 8 de Febrero de 2014).

## 8.3. Bibliografía de imágenes

[1] Ruiz Gutiérrez, José Manuel. VENTANA DE LA CIENCIA. http://ventanadelaciencia.blogspot.com.es/2007/12/el-motor-stirling-enaplicaciones-de.html (último acceso: 22 de Mayo de 2014).

[2] Motores de ciclo Stirling. http://personales.able.es/jgros/tipos.htm (último acceso: 12 de Abril de 2014).

[3] Tecmotor. Página web sobre motores Stirling.   
http://tecmotor.wordpress.com/ (último acceso: 20 de Mayo de 2014).

[4] Morash, Alex, Andrew McMurray, Bryan Neary, Kristian Richards, Dominic Groulx, y Angus. MacPherson. Team 04 Stirling. http://poisson.me.dal.ca/\~dp\_08\_04/Theory.html (último acceso: 21 de Mayo de 2014).

Volumen II Presupuesto

# TRABAJO DE FINAL DE GRADO

![](images/15bdb00f35cd4df912e36e223491c2aa6fdf3513cdbc02f7bae485a1c06a7943.jpg)  
Barcelona, 11 de Junio de 2014

Tutor proyecto: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE GENERAL

# ÍNDICE MEMORIA

Índice memoria ...   
Índice de figuras......   
Índice de tablas....   
Resumen ...   
Resum...   
Abstract ..   
Agradecimientos ...   
CAPÍTULO 1: Justificación, objetivos y alcance......   
1.1. Justificación .   
1.2. Objetivos..   
1.2.1. Objetivo general ....   
1.2.2. Objetivos específicos .....   
1.3. Alcance.....   
CAPÍTULO 2: Introducción...   
CAPÍTULO 3: Dymola....   
3.1. Modelización ..   
3.2. Simulación ...   
CAPÍTULO 4: Motor Stirling ..   
4.1. Descripción general....   
4.2. Configuraciones ...   
4.2.1. Configuración Alpha...   
4.2.2. Configuración Beta ..   
4.2.3. Configuración Gamma....   
4.3. Ciclo termodinámico...   
4.4. Funcionamiento ...   
CAPÍTULO 5: Modelización del motor Stirling   
5.1. Estado previo .   
5.1.1. Modelo mecánico..   
5.1.2. Modelo termodinámico .   
5.2. Verificación del modelo..   
5.2.1. Inicio de las simulaciones.   
5.2.2. Simulaciones de inercia y temperatura..   
5.2.3. Simulaciones del sistema de arranque y temperatura .   
5.2.4. Modificación de la fuerza   
5.2.5. Sistema de arranque forzado .   
5.3. Desarrollo de un prototipo .   
5.3.1. Máquina de dos bloques..   
5.3.2. Máquina de cuatro bloques ...   
CAPÍTULO 6: Conclusiones   
CAPÍTULO 7: Futuras Mejoras.   
CAPÍTULO 8: Bibliografía..   
8.1. Referencias de bibliografía.   
8.2. Bibliografía de consulta..   
8.3. Bibliografía de imágenes.

# ÍNDICE PRESUPUESTO

Índice presupuesto ...   
Capítulo 1: Presupuesto   
Capítulo 2: Bibliografía..   
2.1. Bibliografía de consulta....

# ÍNDICE ANEXOS

Índice anexos...   
Capítulo 1: Anexo A. Resumen TFG Albert García ...   
1.1. Anexo A.1. Modelo mecánico ..   
1.2. Anexo A.2. Modelo termodinámico .   
Capítulo 2: Anexo B. Resultados ...   
2.1. Anexo B.1. Tabla global simulaciones apartado 5.2. Verificación   
del modelo. .   
2.2. Anexo B.2. Gráficas apartado 5.2. Verificación del modelo. ...

![](images/401ec0a488b8ebf6ce1067d9ea6ec9b34bc437900692bbe5cc0be99e46673105.jpg)  
Barcelona, 11 de Junio de 2014

Director: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE PRESUPUESTO

Índice presupuesto .....   
Capítulo 1: Presupuesto ... .3   
Capítulo 2: Bibliografía ... 7   
2.1. Bibliografía de consulta....

# CAPÍTULO 1: PRESUPUESTO

A continuación se presenta el presupuesto económico de este proyecto, el cual está dividido en un apartado de trabajo de ingeniería y otro de recursos informáticos. Dichos recursos están valorados sobre 6 meses, tiempo durante el cual se ha desarrollado este trabajo de fin de grado.

Tabla 1. Presupuesto económico.
<table><tr><td>Descripción</td><td>Unidades</td><td>Precio</td><td>TOTAL (€)</td></tr><tr><td>TRABAJO DE INGENIERÍA</td><td></td><td></td><td></td></tr><tr><td>Costes de personal</td><td></td><td></td><td></td></tr><tr><td>Introducción al proyecto y estudios previos</td><td>120,00 h</td><td>27,00 €/h</td><td>3.240,00</td></tr><tr><td>Desarrollo de las herramientas de simulación</td><td>300,00 h</td><td>27,00 €/h</td><td>8.100,00</td></tr><tr><td>Comprobación y validación</td><td>30,00 h</td><td>27,00 €/h</td><td>810,00</td></tr><tr><td>Elaboración de la documentación</td><td>150,00 h</td><td>27,00 €/h</td><td>4.050,00</td></tr><tr><td>Subtotal</td><td></td><td></td><td>16.200,00</td></tr><tr><td>RECURSOS INFORMÁTICOS</td><td></td><td></td><td></td></tr><tr><td>(Valorado en 6 meses)</td><td></td><td></td><td></td></tr><tr><td>Laptop Toshiba Satellite A660-1EM</td><td>0,2</td><td>736,86</td><td>147,40</td></tr><tr><td>Ratón inalámbrico SWEEX MI421</td><td>0,2</td><td>12,00</td><td>2,40</td></tr><tr><td>Máquina PC186 SGI-H2106</td><td>0,1</td><td>1.500,00</td><td>150,00</td></tr><tr><td>Licencia Dymola®</td><td>0,5</td><td>800,00</td><td>400,00</td></tr><tr><td>Licencia C++ Visual Studio Profesional 2010</td><td>0,25</td><td>550,00</td><td>137,50</td></tr><tr><td>Licencia Microsoft Office® 2007</td><td>0,5</td><td>158,00</td><td>79,00</td></tr><tr><td>Licencia AutoCAD®2012</td><td>0,1</td><td>2.370,00</td><td>237,00</td></tr><tr><td>Subtotal</td><td></td><td></td><td>1.153,30</td></tr><tr><td></td><td>Total bruto</td><td></td><td>17.353,30</td></tr><tr><td></td><td>I.V.A.</td><td>21%</td><td>3.644,20</td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td></td><td>Total Presupuesto</td><td>€</td><td>20.997,50</td></tr></table>

De acuerdo con el contenido desglosado en la tabla anterior, el presupuesto de ejecución material sube a la cantidad de diecisiete mil trescientos cincuenta y tres con treinta céntimos (17.353,30 euros).

Por lo tanto, el presupuesto de ejecución por contrato (con IVA del 21% incluido) sube a la cantidad de veinte mil novecientos noventa y siete con cincuenta céntimos (20.997,50 euros).

Barcelona, Junio de 2014

Autor del proyecto:

Antía Varela Souto

# CAPÍTULO 2: BIBLIOGRAFÍA

## 2.1. Bibliografía de consulta

Microsoft. Licencia C++ Visual Studio Profesional 2010. http://social.msdn.microsoft.com/Forums/es-ES/75f14fb0-78d7-44b5-8101- beb4eb8a4f58/precio-del-visual-studio-2010-y-su-licencia?forum=vsgenerales (último acceso: 2 de Junio de 2014).

tuexpertoIT. Licencia AutoCAD 2012. http://www.tuexpertoit.com/2011/03/22/autocad-2012-nueva-version-delprograma-de-autodesk-para-el-diseno-grafico/ (último acceso: 2 de Junio de 2014).

TWENGA. Licencia Microsoft Office 2007. http://www.twenga.es/microsoft-officeversion-2007.html (último acceso: 2 de Junio de 2014).

Volumen III Anexos

# TRABAJO DE FINAL DE GRADO

![](images/3acedc39c709d01627957e1dcff46c0e010cb021cf5f7fb3a21589a797feb224.jpg)  
Barcelona, 11 de Junio de 2014

Tutor proyecto: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE GENERAL

# ÍNDICE MEMORIA

Índice memoria ...   
Índice de figuras....   
Índice de tablas.....   
Resumen ...   
Resum...   
Abstract ..   
Agradecimientos...   
CAPÍTULO 1: Justificación, objetivos y alcance......   
1.1. Justificación .   
1.2. Objetivos..   
1.2.1. Objetivo general ....   
1.2.2. Objetivos específicos .....   
1.3. Alcance.....   
CAPÍTULO 2: Introducción....   
CAPÍTULO 3: Dymola .....   
3.1. Modelización ..   
3.2. Simulación ...   
CAPÍTULO 4: Motor Stirling ..   
4.1. Descripción general...   
4.2. Configuraciones ...   
4.2.1. Configuración Alpha...   
4.2.2. Configuración Beta ..   
4.2.3. Configuración Gamma....   
4.3. Ciclo termodinámico...   
4.4. Funcionamiento ...   
CAPÍTULO 5: Modelización del motor Stirling   
5.1. Estado previo .   
5.1.1. Modelo mecánico..   
5.1.2. Modelo termodinámico .   
5.2. Verificación del modelo ..   
5.2.1. Inicio de las simulaciones.   
5.2.2. Simulaciones de inercia y temperatura..   
5.2.3. Simulaciones del sistema de arranque y temperatura .   
5.2.4. Modificación de la fuerza   
5.2.5. Sistema de arranque forzado ..   
5.3. Desarrollo de un prototipo .   
5.3.1. Máquina de dos bloques..   
5.3.2. Máquina de cuatro bloques ...   
CAPÍTULO 6: Conclusiones   
CAPÍTULO 7: Futuras Mejoras.   
CAPÍTULO 8: Bibliografía..   
8.1. Referencias de bibliografía.   
8.2. Bibliografía de consulta..   
8.3. Bibliografía de imágenes.

# ÍNDICE PRESUPUESTO

Índice presupuesto ...   
Capítulo 1: Presupuesto   
Capítulo 2: Bibliografía..   
2.1. Bibliografía de consulta....

# ÍNDICE ANEXOS

Índice anexos...   
Capítulo 1: Anexo A. Resumen TFG Albert García ...   
1.1. Anexo A.1. Modelo mecánico ..   
1.2. Anexo A.2. Modelo termodinámico .   
Capítulo 2: Anexo B. Resultados ...   
2.1. Anexo B.1. Tabla global simulaciones apartado 5.2. Verificación   
del modelo. .   
2.2. Anexo B.2. Gráficas apartado 5.2. Verificación del modelo. ...

Anexos

![](images/e45d602bf34a03f70c1aeb57092d9cd9efdfaa1dff6c7abb509769521a76bdb3.jpg)

Barcelona, 11 de Junio de 2014

Director: Joan Grau Barceló Departamento de Mecánica de Fluidos (MF) Universitat Politècnica de Catalunya (UPC)

# ÍNDICE ANEXOS

Índice anexos.   
Capítulo 1: Anexo A. Resumen TFG Albert García 3   
1.1. Anexo A.1. Modelo mecánico . ..4   
1.2. Anexo A.2. Modelo termodinámico .5   
Capítulo 2: Anexo B. Resultados.. 7   
2.1. Anexo B.1. Tabla global simulaciones apartado 5.2. Verificación del   
modelo. . .7   
2.2. Anexo B.2. Gráficas apartado 5.2. Verificación del modelo. . ..8

# CAPÍTULO 1: ANEXO A. RESUMEN TFG ALBERT GARCÍA

A continuación se recoge el desarrollo de la implementación del modelo del motor Stirling llevado a cabo en el trabajo de fin de grado de Albert García. Esta documentación sirve como complemento y aclaración del apartado 5.1. Estado previo.

Este capítulo se divide en dos partes: el desarrollo del modelo mecánico y el desarrollo del modelo termodinámico.

1.1. Anexo A.1. Modelo mecánico

## 3.4. Models.

Ara que ja hem entès com funciona el motor i que coneixem el programa, podem passar al disseny o implementació d’aquest en Dymola. Per tal de simplificar tant la creació com l’explicació del sistema, hem dividit aquest en dos models o subsistemes més senzills anomenats: model mecànic i model termodinàmic.

### 3.4.1. Model Mecànic.

Com el seu nom indica és el model que s’encarrega de descriure la part mecànica del sistema. Per al modelatge d’aquest sistema no s'ha creat cap nou component ni model, sinó que s'han reutilitzat models i components de llibreries existents de Dymola (exactament les de Modelica->Mechanics).

La funció del model mecànic és la de transformar l’energia tèrmica, en energia mecànica de la qual posteriorment en farem energia elèctrica.

El model mecànic, està principalment format per quatre components: El pistó de compressió, el pistó d’expansió o desplaçador, el cigonyal i el cilindre o carcassa.

**• Pistó de compressió.**

És l’element encarregat de rebre la pressió interior del cilindre, que es tradueix en una força sobre el pistó, i que provoca el moviment de tot el sistema. Es troba situat en la part freda del motor. Els elements que el composen són els següents:

![](images/42740455e3adfc6a2fd00c5544a568bcca77d561920150e914cd8ffe18b29832.jpg)  
Il-lustració 11 Ensamblatge d’un pistó.

elèctrica basat en motor Stirling"

a) Cap del pistó: És la part més pesada i amb més secció del pistó . Hi trobem els anells i el buló. Els anells serveixen per pressuritzar la cambra entre pistó i cilindre. El buló és l’element que ens permetrà unir el cap amb la biela.

![](images/573f4bf26066210edba851a62e29331117fbee3f8440870b86551f6302dab67f.jpg)  
Il-lustració 12 Cap del pistó.

b) Biela: Element que uneix el cap del pistó amb el colze de cigonyal o manivela i que traspassa el moviment lineal del cap al cigonyal, per tant trobarem que aquest element ha de ser capaç de suportar esforços de compressió i flexió. Un factor important a I'hora de dissenyar la biela és que la longitud d’aquesta, ha de ser dos cops el diàmetre de gir descrit per la manivela.

![](images/d3dbefb3d2136db884040611e966cede631874a087f3670f6f2e7a9ad99f9e3d.jpg)  
Il-lustració 13 Biela.

c) Rodaments: Elements d’unió que redueix la fricció entre un eix i la peça connectada a ell per mitjà d’una rodadora. Serveix de suport i facilita el desplaçament d’un envers de l’altre. Els trobem entre buló - biela i entre biela - cigonyal.

![](images/2254f36d65acadc1341f40b7110f609fe717f38a3519f01537d001ad9d30f91e.jpg)  
Il-lustració 14 Vista seccionada d’un rodament.

**• Pistó d'expansió o desplaçador.**

Element del model mecànic que s’encarrega de desplaçar l’aire de una zona a l’altre. Com que el pistó de compressió dona un moviment al cigonyal, aquest el transmet anàlogament al desplaçador. Aquest moviment tindrà el mateix període que el de compressió però desfasat 90º tal i com les especificacions d’un motor beta ens indica.

Els components que formen el desplaçador són els mateixos que el del pistó de potència.

**• Cigonyal**

Part del motor que connecta als dos pistons. Rep la força d’explosió del pistó de compressió i el transforma en moviment rotatiu. Aquest moviment rotatiu es transfereix com a moviment lineal al desplaçador quedant lligades així les posicions d’un pistó en funció de l’altre.

![](images/8535909144145c5d48a335c91e541e778fa2b603e6983dce6b4a73e072895d12.jpg)  
Il-lustració 15 Cigonyal del motor Stirling.

**• Cilindre.**

Definim com a cilindre, la carcassa o element protector del motor que s’encarregarà de protegir-lo dels afers exteriors, de acabar de definir la geometria del motor i de transferir les calors de l’exterior al gas del interior.

Un cop identificades les diferents parts del motor podem entendre I' interacció del conjunt.

![](images/368a7e0c0349d6b74864c25bc204ada8f3c72cb621ad5f3215a0bd5b67248e95.jpg)  
Il-lustració 16 Vista en planta de la configuració mecànica.

![](images/7296b7e31aa5cc96cfd1705c3bb449ae57d6c96e3b75da94e5e4ad904e19704e.jpg)  
Il-lustració 17 Vistadeperfil de la configuració mecànica.

Anàlisis del funcionament del model mecànic:

La força exercida per la pressió provoca un moviment lineal del cap del pistó de compressió, des de un punt inferior (PMI) a un superior (PMS) que es tradueix en el cigonyal com un moviment circular

![](images/a205fff2f193f4882996d46ca1f5a5024f680c363432a3f0f58404af5b1fa815.jpg)  
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

![](images/7b45d5b69158d01b4ecf3067e710185285303540bb40184a3161df4312e0c59a.jpg)  
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

aquest model ja que no rep cap força deguda a la pressió, sinó que només ens mou els volums d’una zona a l’altre (el moviment dels volums provocat pel desplaçador ho definirem dins del model termodinàmic que descriurem en la secció 3.4.2. ).

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

Un cop tenim el ModelConnectors\_Forces, podem anar a crear el ModelMecanic\_Stirling. On copiem dos pistons V6, a l’àrea d’interacció del nou model, i realitzem les modificacions ja esmentades. Substituir el model del gas actual en el pistó de potència per el ModelConnectors\_Forces creat i eliminar el model gas en el desplaçador.. On de moment, per tal de poder fer una simulació i comprovar que el nou sistema mecànic es mou, equiparem la entrada de la força, que ens entregarà el model termodinàmic Stirling, a l’entrada d'una força sinusoïdal. Això s'aconsegueix connectant una funció sinusoïdal (Modelica->Blocks->Sources->Sine) a l’entrada que hem creat. Quedant el ModelMecanic\_Stirling (provisional) de la següent manera.

![](images/3cde6e70b8caed891af0230ed78e789452479129744becd437c783e3b85d123e.jpg)  
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

![](images/f2c16f835e060f71a663c15f5e41e3044638607c940fae75cce68bf01a3af314.jpg)  
Il-lustració 24 Area d’interacció del ModelMecànic\_Test.

Quan simulem el model mecànic podem comprovar visualment tant per animació com per gràfics que els pistons es mouen, per l’acció d’una força sinusoïdal (li donem una amplitud de dotze mil i una freqüència de trenta herzs), amb un desfasament de 90º entre ells. Les variables que ens permeten veure aquest moviment gràficament són "s", dins de Cilindre\_pistó\_potencia, i "s", dins de Cilindre\_Desplaçador, que corresponent a la posició relativa del pistó de potència i del desplaçador respectivament. Entenen per posició relativa la llargada del volum disponible següent aquest la diferència entre el volum del cilindre i el volum del pistó en moviment de la mateixa zona.

Obtindríem els següents resultats:  
![](images/b1da1dad158d7f5ba9d19c48463d1dfb2d943ce68885e0b4f9b8afaf789a0070.jpg)  
Il-lustració 27 Gràfica de les posicions relatives dels pistons.

![](images/adfda2ac7768e0bac0e8f757d9547feef215b37b67ea43ffdcae5f90e4a98e0b.jpg)  
Il-lustració 28 Força exercida sobre el pistó de potència.

![](images/f3aa727a875ace19a2bc1276a1e4b57e20bb63aa6f583544c80b6d3144c1578f.jpg)  
Il-lustració 29 Animació 3D del model mecànic.

El model termodinàmic és la part més important del motor ja que és la que ens donarà la força així com les temperatures de treball. Aquesta part s'ha modelat des de zero, ja que Dymola no disposa de cap model que s’assimili al cicle Stirling amb el qual treballa el gas.

Per a I’ implementació d’aquest model s’han diferenciat dues parts. La primera on només modelem un moviment de masses, en funció dels volums que el moviment del desplaçador ens atorgarà a cada zona, a temperatura constant. I una segona on modelarem l’escalfament i el refredament, de les masses de les respectives zones, en funció dels volums disponibles en cada una d’elles.

**• Primera part, moviment masses:**

Partint de la construcció del model mecànic anterior sabem que necessitarem relacionar les posicions dels pistons que aquest té amb les posicions dels pistons en el model tèrmic que ens donarà els volums disponibles en cada zona i ens retornarà una força resultant. Per tant necessitarem un primer model que anomenarem ModelConnector\_Posicions\_Force que ens relacioni l’entrada de aquestes posicions al model termodinàmic i la sortida de la força d’aquest model cap al mecànic.

![](images/85c9958cefbcf9a2378bfe4d54075af7a7fc3499b774ca877ee7c4a2bae89324.jpg)  
Il-lustració 30 Codi del ModelConnectors\_Posicions\_Forces.

On:

u = Entrada posició relativa del pistó de potència .

u1 = Entrada posició relativa desplaçador.

fo = Sortida força entregada per el model termodinàmic.

Un cop tenim relacionades les entrades i sortides del model passem a modelar el moviment dels volums creant un nou model anomenat ModelVolums. Observant les gràfiques resultants de l’estudi del model mecànic veiem que aquestes posicions descriuen un moviment sinusoïdal desfasat 90º entre un i l’altre, on el desplaçador es troba a la seva posició màxima i el pistó de potència a la meitat de la seva posició màxima. Com que de moment estudiem els models per separat ajustarem l’entrada d’aquestes posicions com una constant, multiplicada pel temps, que transformarem en una sinusoide i a una de les dos la desfasarem 90º (pi mitjos) respecte de l’altre.

Quedant descrit aquest moviments de la següent manera:

![](images/7a60bc136ab55f530f5a35989faf6e0add7e372178d54e5e592e8f8d52b50584.jpg)  
Il-lustració 31 Codi entrada de posicions del ModelVolums.

Se li suma 1 al valor del sinusoide per tal de fer-la tota positiva i es divideix el valor de les dues entrades per 10 per ajustar la magnitud del valor a un valor més real. Conseqüentment, un cop sabem com es descriuen aquestes posicions relatives i observant la geometria inicial del model mecànic, podrem saber quins paràmetres constants tenim i com es relacionen aquestes entre un model i l’altre.

![](images/53628f61bc3e7d2c5231ec1613e932383a9c6c9548b0e87c48be6c6ba2bd495c.jpg)  
Il-lustració 32 Esquema de la configuració del model.

Així podrem marcar també unes condicions inicials que ajudin a iniciar la simulació del model termodinàmic i a identificar si aquest s'està ajustant-se correctament o no a la funció desitjada que ha de desenvolupar. Aquestes condicions inicials són la pressió i temperatura inicial del sistema que serà igual en tot ell. Els volums inicials en cada zona, que depenen de les posicions relatives inicials que coneixem ja que les hem marcat el model mecànic, la suma dels quals ens donarà el volum total del sistema. I el nombre de mols en cada zona, així com en el total del sistema, que podem treure a partir de l’equació dels gasos ideals ja que el gas de treball és aire. També caldrà incloure òbviament certs paràmetres d’aquest gas ideal.

**A partir de I’ imatge anterior podem definir:**

Paràmetres geomètrics:

model ModelVolums\_Only   
extends ModelConnectors Posicions Forces;   
//Sub model que intercanvia l'entreda de les posicions i la sortida de la força"   
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

![](images/83ad2f01343757d2e6463e8a95237d42f18734fd8f8125916a13065bcaf19f69.jpg)  
Il-lustració 33 Esquema de la zona calenta.

![](images/9b24a43e946e26804382a5faf6616d0adc215bc6fabb9e9ada73dba377b4c2b3.jpg)  
Il-lustració 34 Esquema de la zona lateral.

![](images/304bf7568fcc802100e182a9ee148aa8c3e9305d75ae60fc711c878344b629b6.jpg)  
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

//Equació dels gassos ideals aplicada a les dues zones.

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

![](images/8e47bbf243ffb96483f2a378528d5d43e9e911f94172b4ef76783e7620b68ea5.jpg)  
Il-lustració 36 Moviment de masses en zona calenta durant el descens.

El caudal màssic que entra (mq1) tal i com observem a la imatge prové del lateral per tant serà el resultat de:

$$
m q 1 = c ^ { * } A \_ a n ^ { * } r o \_ l ;
$$

Per la zona 2 tenim-> me=0 i ms=mq2;

![](images/9cbb6d64b2ddf46b2b2120536c056f701f1d2cf8cf57d722e16618c133600908.jpg)  
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
![](images/8a8fb87095e232743f0c4aa8689a2c27688301b28429e035fd1920f4d2bbde33.jpg)  
Il-lustració 38 Moviment de masses en zona calenta durant l’ascens.

El caudal màssic que surt (mq1) tal i com observem a la imatge prové del la mateixa zona 1 per tant serà el resultat de:

$$
m q 1 = c ^ { * } A \_ a n ^ { * } r o 1 ;
$$

Per la zona 2 tenim $\scriptstyle \cdot > { \mathrm { ~ m e = m q } } 2 { \mathrm { ~ i ~ } } \ m s = 0$

$$
\frac { \mathrm { d } { \mathrm { m } } 2 } { \mathrm { d t } } { \mathrm { = } } m e = m q 2 ;
$$

![](images/53280a90f7507f47d11346c644d45cc2300479e405c3d9fd72a36c930d984505.jpg)  
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

![](images/a6986e975979ceb8847a30f4407e5ba19130581202bfd411c3b9e191a37c719d.jpg)  
Il-lustració 40 Àrea d’interacció del ModelVolums\_Test

Abans de simular, hem d’introduir els següents valors i activar les condicions inicials següents (P1, n1, n2, nt) com a fixes.

```matlab
model ModelVolums Test
Modelica.Blocks.Sources.Constant const(k=1)
a ;
ModelVolums
modelVolums(
d1= 0.15,
1_d=0.1,
d2= 0.12,
dc=0.18,
P1 (fixed=true),
n1(fixed=true),
n2 (fixed=true),
nt (fixed=true))
a ;
equation
connect(const.y, modelVolums_Bo.u1) a;
connect(const.y, modelVolums_Bo.u) a;
a;
end ModelVolums_Test_Only;
```

**Il-lustració 41 Codi del ModelVolums\_Test amb paràmetres i condicions inicials.**

Amb el test podem comprovar gràficament com els volums estan variant en funció de les posicions, com les masses varien en funció d’aquests volums i que el model ens entrega una força resultant.

elèctrica basat en motor Stirling"  
![](images/1200e4568dab38574d04e25cbc69272e0721344ebd02e3191268a5b8cc78819e.jpg)

![](images/b52979794bc308c8d4280a2b1c064afe8c3ffd2bc0a65187c4b8d30f3d7e00a8.jpg)  
Il-lustració 42 Variacions de volums en funció de les posicions.

![](images/59957a3cf866039a469bab9b66d7e56b6a54d66a84de76c0d70ac20a12a1c542.jpg)

![](images/ea1ce92ced56c3ac7ef50ffdb08051094f91256a81c6e2ea9eaf5ad40f039447.jpg)  
Il-lustració 43 Variacions de les masses en funció dels volums disponibles.

![](images/097a35ec0bff7dc23e88702d52f29c38a44ac6340c617e5118351ee9836e6406.jpg)  
Il-lustració 44 Força exercida sobre el pistó de potència.

**• Segona part, escalfament:**

Ara afegim al ModelVolums, l’escalfament i refredament del sistema. Tornem a analitzar el sistema afegint aquests nous processos per veure quins nous paràmetres i variables tenim.

![](images/d1adb3512a9df676b808d13cb137e2cf5c12f1a2d183aefd3b629efd7b16e343.jpg)  
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

![](images/d873313ce068497b4b9920001e4984b95d6656ff5424c26856d985a0ff5978d5.jpg)  
Il-lustració 47 Variació del calor en la zona 1 durant el descens del desplaçador.

On tenint en compte el signe de la velocitat i sabent que mq1 prové de la zona lateral, finalment ens queda:

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e = Q p c - m p { \ a } ^ { * } c \nu ^ { * } T \_ l ;
$$

Si $\mathtt { C } { > } 0$ tenim $\scriptstyle - > \mathrm { Q e } = \mathrm { Q p c ~ i } \mathrm { Q } s = \mathsf { m q 1 } ^ { * } \mathrm { c v } ^ { * } \mathsf { T 1 }$

$$
\frac { \mathrm { d } \mathrm { Q c } } { \mathrm { d t } } = Q e - Q s ;
$$

![](images/886778b8523046d43863c3c994423f6b3a43f83745ab54a6823c98fde45851c2.jpg)  
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

![](images/03cbce7ddc95e1ede2560d2bbafed2d8c53dcf0f90721c1843860546b2b30d92.jpg)  
Il-lustració 49 Variació del calor en la zona 2 durant el ascens del pistó.

On tenint en compte el signe de la velocitat, el signe de la transferència de calor per la paret i sabent que mq2 prové de la zona $2 .$ ,finalment ens queda:

$$
\frac { \mathrm { d Q f } } { \mathrm { d t } } = - Q s = Q p f + m q 2 ^ { * } c \nu ^ { * } T 2 ;
$$

Si c>0 tenim $\ b { \Sigma } > \mathrm { Q e } = \boldsymbol { \Pi } \ b { \mathrm { q } } \ b { 2 } ^ { * } \ b { \mathrm { C V } } ^ { * } \ b { \mathrm { T } } \_ { \mathrm { l } } \mathrm { ~ i ~ } \ b { \mathrm { Q } } \ b { \mathrm { s } } = \ b { \mathrm { Q p f } }$

$$
\frac { \mathrm { d } { \mathrm { Q f } } } { \mathrm { d t } } = Q e - Q s ;
$$

![](images/f2e47e817a1476e018796fe3ac644899f183eb662921ab48819952178b0fcb23.jpg)  
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

![](images/c0cb499501227bae7ee5ef1fbfff9defbb5c3343c04c2153f7e3d84079f8cd1c.jpg)  
Il-lustració 51 Variació del calor en la zona lateral durant el descens del desplaçador.

On tenint en compte el signe negatiu de la velocitat ens queda:

$$
\frac { \mathrm { d } \mathrm { Q } \_ { } } { \mathrm { d t } } = Q e - Q s = - m q 2 ^ { * } c { \nu } ^ { * } T 2 + m q 1 ^ { * } c { \nu } ^ { * } T \_ l ;
$$

![](images/7d145ef39b868358d72ba27656ac61119c4c84123e5b9c037d7fce1df3a6f817.jpg)  
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

Abans de simular cal ajustar els següents valors i condicions inicials.

model ModelTermodinamic\_Test   
Modelica.Blocks.Sources.Ramp TC( duration=10,   
offset=293.73,   
height=200)   
a ;   
Modelica.Blocks.Sources.Constant TF(k=293.73)   
a;   
Modelica.Blocks.Sources.Constant const(k=1)   
a ;   
ModelTermodinamic\_Only modelTermodinamic\_Only(   
d1=0.15,   
1\_d=0.1,   
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

Il-lustració 54 Codi del ModelTermodinamic\_Test amb paràmetres i condicions inicials. Podem observar gràficament com les temperatures i calors de les zones del sistema van variant en funció del moviment de les masses d’una zona a l’altre durant la simulació del sistema.

![](images/962734265c5405de095d5d9aaf15d0a6bcdea6c54d7690e0742ea73b7e78a03b.jpg)  
Il-lustració 55 Variacions de calors en el sistema.

Albert Garcia Prat  
![](images/a84ab0584ba0b2e7d89e6872e5b230b3a3ced016ca03a7780832dd142223d995.jpg)  
Il-lustració 56 Variacions de calors en les parets del sistema.

![](images/57c1aceead002ca20e56e539202088d3ece6fa3873055ee94e7fef17ede24018.jpg)  
Il-lustració 57 Variacions de les temperatures del sistema.

Aquest sistema d’arrancada esta format per una acceleració (Modelica->Mechanics->Rotational->Sources->Accelerate) que se li entrega a un embrague i que s’activara a través d’una rampa (Modelica->Blocks->Sources->Ramp) aquesta rampa s'activa al cap de trenta segons despres d'haver començat la simulació, per tal de que el sistema s'hagi escalfat bé, i té una durada de deu segons. L'embrague (Modelica->Mechanics->Rotational->Components->Clutch) esta embragat des de el principi de la simulació al cigonyal i s’encarregarà de transmetre l’acceleració durant els deu segons que aquesta dura i desprès es desembraga del cigonyal per l’acció d’un escalor unitari (Modelica->Blocks->Sources->Step) que el fara passar de un estat d’activat a un de desactiva (d’un offset de valor 1 a una alçada de valor -1 respecte l’offset que és igual a zero al cap de quarante segons).

Per poder mesurar la potència que aquest motor ens està entregant afegirem al test un sensor de potència (Modelica->Mechanics->Rotationa->Sensors->PowerSensor) que mesurara la potència resultant entre l’entregada al cigonyal i un fregament (Modelica->Mechanics->Rotational->Components->Damper) que l'imposssem a aquest. La posició d’aquest fregament és fixa (Modelica->Mechanics->Rotational->Components-Fixed). Per obtenir una bona potència s’estipula que el fregament a de tenir un valor aproximat d’un seixanta per cent respecte de la velocitat màxima del cigonyal.

![](images/caf44ad962baaefeeae5314ab80ca7ef00fe17ad8f853e5d47ed5d0024d28124.jpg)  
Il-lustració 59 Exemple dels components per el test del Motor\_Stirling.

# CAPÍTULO 2: ANEXO B. RESULTADOS

2.1. Anexo B.1. Tablaglobal simulaciones apartado 5.2. Verificación del modelo.

En este apartado se presenta una tabla global que recoge todas las simulaciones realizadas en el capítulo 5.2 de la memoria del proyecto. En dicha tabla se especifican todas las modificaciones llevadas a cabo en cada una de las simulaciones.

Tabla 1. Simulaciones capítulo 5.2.
<table><tr><td rowspan="2">Caso simulación</td><td rowspan="2">Tiempo simulación</td><td rowspan="2">Tiempo calentamiento</td><td colspan="2">Rampa temperatura</td><td rowspan="2">Momento de</td><td rowspan="2">Fuerza</td><td colspan="2">Step temperatura</td><td rowspan="2">Rampa aceleración</td><td colspan="2">Coeficientes transferencia calor</td><td rowspan="2">Funciona</td></tr><tr><td></td><td></td><td>Start Time (seg)</td><td>Duración (seg)</td><td></td><td>UF</td></tr><tr><td></td><td>(seg)</td><td>(seg)</td><td>Offset (K)</td><td>Height (K)</td><td>inercia (kg/m²)</td><td></td><td></td><td></td><td>Altura</td><td>Uc</td><td></td><td>(SI/NO)</td></tr><tr><td></td><td>80808080808080</td><td></td><td>293,15</td><td></td><td></td><td></td><td></td><td>101010 0 10 10 10 10 10101010 10 10 10 10 10101010144664 1053411231231212333333</td><td>1111</td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293,15</td><td>2400</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>250</td><td>260</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>250</td><td>280</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293,15</td><td>240 240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100 100</td><td></td></tr><tr><td></td><td>200</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td>80</td><td></td><td></td><td>24</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td>200</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td>400</td><td></td><td>293,1</td><td>24</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293,</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td>123456789 10121314151617 8 1920 212 23 24 25 2627 282930313234 53637 383940414345 4647</td><td></td><td></td><td>司调装</td><td>0</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293,15</td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293,15</td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td>NNNNOSSSNSSSNOSSSNNNNNNNNSSNSSNOSNNNSNNSNNNNSSSSNOS</td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293</td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>240</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td>293, 293,</td><td>24</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>24 </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td>92 2</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>240 4</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>24</td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>100</td><td></td></tr><tr><td></td><td></td><td>000000010000002010214162083002220204000555060600</td><td></td><td>24 </td><td>22225433333333333333333333333333333333333335555</td><td>fffffffffffffffffffffffffffffffffff</td><td>220202002020200202020242621424363430253421414235256160109</td><td></td><td>1111111112551010101010101012125555551515</td><td>01000000000000000000000000000000000000000000 0</td><td>100 100</td><td></td></tr><tr></table>

## 2.2. Anexo B.2. Gráficas apartado 5.2. Verificación del modelo.

En el presente apartado se recogen todas las gráficas creadas a partir de las simulaciones realizadas sobre el modelo del motor Stirling.

![](images/d72dfea8cd5f24670dc9214e1255d0e6387202fdfaa7801ecfce3bbb8defafaf.jpg)

![](images/b65516ee131272bff0d30fb9d94cb6cdc9282607ff7560d74b56cdb7cc019e39.jpg)  
Figura 1. Modelo del estado previo: velocidad angular.

![](images/89907287b509e09ca44057e925b21280697f4462d7c060f7a23eb7f999fd99ca.jpg)

Figura 2. Modelo del estado previo: temperaturas.  
![](images/b3301f8f5109a90c5f965729a0689457a9bb435ae87a525161adaf09f4962add.jpg)  
Figura 3. Modelo del estado previo: transferencias de calor.

![](images/7f53671ce6f79fcea49d4bff8f8f4d20189c0f246eab91515d5af289e762f818.jpg)

Figura 4. Caso de simulación nº1: velocidad angular.  
![](images/c247725e3e0da178c3c50a4ae49646eb008bbda8462b7db628aa0b7b83ece001.jpg)

Figura 5. Caso de simulación nº1: temperaturas.  
![](images/169516b32e8b04c11d9c731aa66168a0ceea67a5ecad8e499a3832fa7b9450c7.jpg)  
Figura 6. Caso de simulación nº1: transferencias de calor.

![](images/051731a26bd2ba38e349bfe9c78cc0822e430fb0ed357c0f9f0483bce8a2c863.jpg)

Figura 7. Caso de simulación $n ^ { o } 2 .$ :velocidad angular.  
![](images/3f6b541f8c830e6c82c8e2d66fec5dd8c3c16938c90cebff0d7018a00d2bd63a.jpg)

Figura 8. Caso de simulación $n ^ { o } 2 .$ : temperaturas.  
![](images/e2a4719593322ac8509ba7a7a5288920b1e13bedb617a3a1624ec92eb08c414c.jpg)  
Figura 9. Caso de simulación $n ^ { o } 2 .$ : transferencias de calor.

![](images/fa1e20d4c951d0aee3d0df76c10f5f7c68999719a8406539a5397d711b4936d6.jpg)

Figura 10. Caso de simulación nº3: velocidad angular.  
![](images/aab01119dafad677d6cdf2deff19ef064235fee6c704f59f880aa9ad3ecd0cb0.jpg)

Figura 11. Caso de simulación nº3: temperaturas.  
![](images/82002691d5ea6c154414fca98f3b619051de37c9868a8537c371292ed5b4210c.jpg)  
Figura 12. Caso de simulación nº3: transferencias de calor.

![](images/a9c007c177c3f021b0576210c79102f984c29a0215287ef3e157b17d1a84de25.jpg)

Figura 13. Caso de simulación nº4: velocidad angular.  
![](images/c6a2a0b1a7b834186b71984801e03915212131c247666a0811a9f3cfc08e3931.jpg)

Figura 14. Caso de simulación nº4: temperaturas.  
![](images/f8757bc8126360e2a330dd17906e2c67755ef3f00960935c74ba67a7827612a2.jpg)  
Figura 15. Caso de simulación nº4: transferencias de calor.

![](images/df20b076e49ddca21da0a5998b93619d41212773d9ae543eee8c92e7ffe91257.jpg)

Figura 16. Caso de simulación nº5: velocidad angular.  
![](images/455bb376692d1e95fe1a711643ebe5d553900c0724449a713cee474466bdf210.jpg)

Figura 17. Caso de simulación nº5: temperaturas.  
![](images/351a081e8326ea43f2b988ecead6c30b5e1cdd76c19bd89ea9512b8bc59fc483.jpg)  
Figura 18. Caso de simulación nº5: transferencias de calor.

![](images/13c39661dfbc6c817d2e062857fa36bb85d11ad562e9f8d0ccc8f7a2024be27c.jpg)

Figura 19. Caso de simulación nº6: velocidad angular.  
![](images/c7974a3e91f5bf4b499848c3faa91089ebaacf49f8dcfd11b715fc4cb5bcec66.jpg)  
Figura 20. Caso de simulación nº6: temperaturas.

![](images/cc9c3de3d15f4fe24d7bfbca5e1285457acc5ccf3aee8dae1ad42991f3268f74.jpg)  
Figura 21. Caso de simulación nº6: transferencias de calor.

![](images/494d34b686b2b688cdad8d59f9bbce79fa1b04fcee0e6645db9c18627ecc85a1.jpg)

Figura 22. Caso de simulación nº7: velocidad angular.  
![](images/84aeb7c8d395b97a182f735c6e7277e58eb839e83a688b7e9c2c15251f2056fe.jpg)

Figura 23. Caso de simulación nº7: temperaturas.  
![](images/08065f86721c6324e1cf2353c7661d12219ce72bdee11da1692c8c7296af5335.jpg)  
Figura 24. Caso de simulación nº7: transferencias de calor.

![](images/6765feb625109295b5813849de96d57e5a717555ad7eb1177a7380a942fb5ce4.jpg)

Figura 25. Caso de simulación nº8: velocidad angular.  
![](images/bd78eced2d9487493325bc39ea703cf019cd33522449566ea323dc088d7d5a72.jpg)  
Figura 26. Caso de simulación nº8: temperaturas.

![](images/4a1a2a7cddf4720539ce2b635c47deda9df1b46459df7a025e9001a923270b6f.jpg)  
Figura 27. Caso de simulación $n ^ { o } 8 ;$ transferencia de calor.

![](images/af06f82c8cd95f9a6ca7da7887e2e9aa000eded48ef517d81c964eb99ff162a0.jpg)

Figura 28. Caso de simulación nº9: velocidad angular.  
![](images/8572aea235424b48377afa6965cbec6636411c23a1a02101f370e6c06eb477bd.jpg)

Figura 29. Caso de simulación nº9: temperaturas.  
![](images/17762472b794215a731dc2d1a09c291ccc722fdcc0484a62fd5c9d1319e58892.jpg)  
Figura 30. Caso de simulación nº9: transferencias de calor.

![](images/34b3cc30589ba025273b225c8b434dcc128e12791294fb81c0b596ae76c52d12.jpg)

Figura 31. Caso de simulación nº10: velocidad angular.  
![](images/c936b4c90cfb96e52e2847d105c479a418b6cc9a5f42ee12440d67c6bf206e1f.jpg)

Figura 32. Caso de simulación nº10: temperaturas.  
![](images/855c686573b94aa4126f5c2fdfea8f654af88753bc5b0b9f2aad79f3d7b362c0.jpg)  
Figura 33. Caso de simulación nº10: transferencias de calor.

![](images/1b9b84f5a2ad14c3586625e45d5a2513779231f75971ee75e42d25eb4b526f07.jpg)

Figura 34. Caso de simulación nº11: velocidad angular.  
![](images/5f1d8d045f22e6b8741d3924efcdfa038e4b058566c13d6ecdfaab88c11c8bca.jpg)

Figura 35. Caso de simulación nº11: temperaturas.  
![](images/c1a3de4d4ddcda3b18f85c0da3e5d38c2f3c853c71b5dcf30c3590aa79874a8f.jpg)  
Figura 36. Caso de simulación nº11: transferencias de calor.

![](images/db4de4b73b10fb4283eda9695404a59e850d5bf7c3effbac478788b5bf122432.jpg)

Figura 37. Caso de simulación $n ^ { o } 1 2 \cdot$ velocidad angular.  
![](images/edf5d972f461605d78bd4509e6e48da1bdad4b7617edbaf7032ae3686c82cdce.jpg)  
Figura 38. Caso de simulación $n ^ { o } 1 2 \cdot$ temperaturas.

![](images/ea3fdd1bcdae45097dd4f3832fea6c426c21ff1b07ce0e62b3f427bace536550.jpg)  
Figura 39. Caso de simulación nº12: transferencias de calor.

![](images/b868fafdb8f6898f929eebc7a3184d1331afd5ca021a90a0610575436074034f.jpg)

Figura 40. Comparación de casos $n ^ { o } 8$ (azul) $\gamma \ : n ^ { o } \ : 1 0$ (rojo): velocidad angular.  
![](images/603cf93c34c3a528f2b90e312b9a6736ce1f1bbd1e84227b4e698bd864603331.jpg)

![](images/f6670a813f80343d42bd99a0b1be219e8537c5581023fef9dc35bd402c7a1791.jpg)  
Figura 41. Comparación de casos $n ^ { o } 8$ (arriba) $\yen 10$ (abajo): temperaturas.

![](images/b8d62d79d79e3b3c3818e3189a3e96b77125337cfc1efcc41761ebf55adafb11.jpg)

![](images/1896ae39ada8646daac1d432a16f589c01dfb48bff60dcc71380f182d1c96c6d.jpg)  
Figura 42. Comparación de casos nº8 (arriba) y nº10 (abajo): transferencias de calor.

![](images/491dc17a9688ce4367808dc44ef9ac5912591f10aacc0014b2f0b18eef609523.jpg)

Figura 43. Comparación de casos nº13 (rojo), nº14 (azul) y nº15 (verde): velocidad angular.  
![](images/afec47b31f5ac902ac2e5d94a872c8c933ce7734ddb9ccca093afe3168066a58.jpg)  
Figura 44. Comparación de casos nº13 (rojo), nº14 (azul) y nº15 (verde): presión.

![](images/6dbdf1efdab7f8f1600acc321670ad5aa3f319ca1d775df409cdbf9d1d0fa945.jpg)  
Figura 45. Comparación de casos nº13 (rojo), $n ^ { o } 1 4$ (azul) y nº15 (verde): fuerza.

![](images/f936770cf2d3db1ce53f38be599dad8d6f874e3ad0f06028dc3322bf1c846b9e.jpg)

Figura 46. Caso de simulación $n ^ { o } 1 6 .$ : velocidad angular.  
![](images/5887e93af5d031eda8bedb7c8fc21e83fe8a24fc22a6644594a31702f375268d.jpg)  
Figura 47. Caso de simulación $n ^ { o } 1 6 \cdot$ presión.

![](images/c8c1adc38714925f9a30711e6a673939c152a6f9ea2ff3248440500252d7b7a4.jpg)

Figura 48. Caso de simulación nº16: fuerza.  
![](images/da16b1c565996e085d586114b2b9bfd35afdf1ea46212b79fb97c75bcfedacfd.jpg)  
Figura 49. Caso de simulación nº17: velocidad angular.

![](images/d2be3d8796d6fb75ba4b8938bcfcec6d1beaa94d15f20df7d938bf08a8ce5b00.jpg)  
Figura 50. Caso de simulación $n ^ { o } 1 7 \cdot$ presión.

![](images/026126814547fbc6fe44da15287b79fe57660306207e7e57f40cf3f74a7f4562.jpg)

Figura 51. Caso de simulación nº17: fuerza.  
![](images/f083ecbddad208cbd2d9269b0a326620dc74ad66f0ca67aada340ecd6b5a4039.jpg)  
Figura 52. Caso de simulación nº18: velocidad angular.

![](images/673f5e735786ddfe02cf7008fb3488430079080f217920e8a90d732e6685a9af.jpg)  
Figura 53. Caso de simulación $n ^ { o } 1 8 .$ presión.

![](images/0b73a5b6cda4b9fd28224c619563a88b43639c8eeae05514f77527d74af4903b.jpg)

Figura 54. Caso de simulación nº18: fuerza.  
![](images/61b36e8fc130c18a50011b1f616760d0ede3624226a814b2117b260f6bd70330.jpg)

Figura 55. Caso de simulación nº19: velocidad angular.  
![](images/bb86f63e3ae1555096031f03fe648bbe9ecef2e92ec1d28b4063a92470f86893.jpg)  
Figura 56. Caso de simulación nº19: presión.

![](images/a440d5fed9d6792d2e1be8dba4a8282a657bca687ca4a130f7079c6fd36807a9.jpg)

Figura 57. Caso de simulación nº19: fuerza.  
![](images/47d1fe473c8c2499866472622526b69dfde468bccb7219efacc4d088ee68f8b3.jpg)

Figura 58. Caso de simulación nº20: velocidad angular.  
![](images/1050311f4c6644efce363201c0ee3c9bccc742f4516c3413aa23a29045b62f61.jpg)  
Figura 59. Caso de simulación nº20: presión.

![](images/08cf9e81d38f408e6669fdf050918aeeab486ab32c816c4f0e253228c42d2230.jpg)

Figura 60. Caso de simulación nº20: fuerza.  
![](images/d5207fff6aaca124155f0d4a9872fe95fa43bbf4c6773bd9f8797a725513da84.jpg)

Figura 61. Caso de simulación nº21: velocidad angular.  
![](images/cbdeaf2e891451b9ad2ae60388167bd8cc9feb58093963ccf352cd11f777a316.jpg)  
Figura 62. Caso de simulación nº21: presión.

![](images/34e4dbfa932ea20959f5c41da6233ce1ada1af46b5392638ff2e140bbde97e19.jpg)

Figura 63. Caso de simulación nº21: fuerza.  
![](images/511e20e79a5953365c5fc4791c75ea69839608d1b2a3d05bfd2d5b5182151401.jpg)

Figura 64. Caso de simulación nº22: velocidad angular.  
![](images/d6d6aee754c9736f03d30fa997f5632370fffa2b47696fb2b4c3bc990c9517e1.jpg)  
Figura 65. Caso de simulación nº22: presión.

![](images/87c904ffbb3880d1003c7ebbf009ec7d696906304059eeae07f35c0d3e8c91f3.jpg)

Figura 66. Caso de simulación nº22: fuerza.  
![](images/e128b1e48358357d42a6084369415f41803e4dd3ed9bf4afe0c30fd15d2e570e.jpg)

Figura 67. Caso de simulación nº23: velocidad angular.  
![](images/ddd627becdc7b40c35ad7c3a69dc4b96a68097615c0ab627dcb8feebfa5a2992.jpg)  
Figura 68. Caso de simulación nº23: presión.

![](images/29f498fbe814c89aca3ac6251c892dd77a62bab2fb8637543b744a424d4681e4.jpg)  
Figura 69. Caso de simulación nº23: fuerza.

![](images/dbaa8d38b78958e0565d182074ad26c30d6be63c3d08fda769f0cb49f04f6209.jpg)

Figura 70. Caso de simulación nº24: velocidad angular.  
![](images/1ea51e24a88179627ea20b75e3b9249909c900f2e57e4045a32aeff849e2fd51.jpg)  
Figura 71. Caso de simulación $n ^ { o } 2 4 .$ presión.

![](images/87aa99bfbf76bd832a90370ad8e08e7bacd09bc07d8c0bd41a00d8db354cd6b7.jpg)

Figura 72. Caso de simulación nº24: fuerza.  
![](images/f5cdb97ce13a8b54ad630388e55233745681798c6eda8f2233aeeab1c050b114.jpg)

Figura 73. Caso de simulación nº25: velocidad angular.  
![](images/306ab3e19b7307a6019ce85dad8eab56e7ef38cfdc20c362e6908f32854b6b47.jpg)  
Figura 74. Caso de simulación nº25: presión.

![](images/3254e46cf0c74129ece909ffa8f2e0c50be6512407b4496587efae42c60c1654.jpg)

Figura 75. Caso de simulación nº25: fuerza.  
![](images/e5952d4de2f8abe7450c3855904f5644f31d89c74470d12b76f72c9429409812.jpg)

Figura 76. Caso de simulación nº26: velocidad angular.  
![](images/ae777be67941c795f2e615f9ed0d3c1bf25ce98078b84f177657b9e2f2ce83c2.jpg)  
Figura 77. Caso de simulación nº26: presión.

![](images/28b59c5c27d3aff08139d58ddbb621540c12d27868fc3356706efa67fce40d66.jpg)  
Figura 78. Caso de simulación nº26: fuerza.

![](images/709d6dfd78e5c3d459836824b6f61bea3242ca7ab5877ceb55eb658360895a2c.jpg)  
Figura 79. Caso de simulación nº27: velocidad angular.

![](images/71cbdd689be725e68a464caef2fd31aa50a235a7566f32fba3739a0ffe71bd56.jpg)  
Figura 80. Caso de simulación nº27: presión.

![](images/ea1f747df8d02ed119032b6d9a8a514eb9c1b6210be875fbb3f4cfc5482396f1.jpg)

Figura 81. Caso de simulación $n ^ { o } 2 7 \div$ fuerza.  
![](images/5b2d4cb628acdeda1543dd89c0bc7cd2524971bfe7f3d04357b4904bb1aa87a9.jpg)

Figura 82. Caso de simulación nº28: velocidad angular.  
![](images/f29c19758b7d63402dbcd98717b36d945a7cf146d12bf23199706709e4fa4791.jpg)  
Figura 83. Caso de simulación $n ^ { o } 2 8 \div$ presión.

![](images/dbfb402f4c67c42b8d27cd5a03a9335420d7495546aaed208996517234272730.jpg)  
Figura 84. Caso de simulación nº28: fuerza.

![](images/6c17beb0eb3754b19d1c82dfcde55c93378606a18f348426ae4c97f056d74109.jpg)

Figura 85. Caso de simulación nº29: velocidad angular.  
![](images/2d9c2ee9372194ac1c4120de5d589f6ca39dbaa2566e7097ab9aca9f9b447ed2.jpg)  
Figura 86. Caso de simulación nº29: presión.

![](images/b18987de94b420c87c6e906ce745959fb8532066222078b2c8f0368ebd0f926d.jpg)  
Figura 87. Caso de simulación nº29: fuerza.

![](images/22e9a1a62c9a26f873687c2085d2b63a6ac94919e57b7b78bbe173c592af2501.jpg)

Figura 88. Caso de simulación nº30: velocidad angular.  
![](images/d231d364fbee1d9a9e0f39af3b82c778367d5c204c09fe754111066434c2e811.jpg)  
Figura 89. Caso de simulación nº30: presión.

![](images/6e36293287d13617ecff330b7af0a6b604b878fa30b45baa64d0103e54a737c3.jpg)

Figura 90. Caso de simulación nº30: fuerza.  
![](images/3a4a3273f781f6381434661629eaf6a6522a0fb6769b301e9e91b88690675e64.jpg)  
Figura 91. Caso de simulación nº31: velocidad angular.

![](images/93ed6eb84bb7ab375ca6733785202ce5bc31ecdf61949cd0bea8ced4910965b6.jpg)  
Figura 92. Caso de simulación nº31: presión.

![](images/d377372607c6db9b86c49adc7243759b0ef1a4ff60d0bbbd23a4e2584bf0fb28.jpg)  
Figura 93. Caso de simulación nº31: fuerza.

![](images/cb869b4699a9c9a14481c616a953ce50228d64f34388747bfb3906a232d4922e.jpg)  
Figura 94. Caso de simulación nº32: velocidad angular.

![](images/f992e035bdde02ac1c47b7c7be9a1d6cc28acd236638029a6396a84375be0888.jpg)  
Figura 95. Caso de simulación nº32: presión.

![](images/7052333e6ef59f6243cc593ca4471ede65f9b9b111dc98ab99ec34d83464416f.jpg)  
Figura 96. Caso de simulación nº32: fuerza.

![](images/de95c9548437798d755a137773d049d5159f63e9907340fa3ba062150a7eeb82.jpg)

Figura 97. Caso de simulación nº33: velocidad angular.  
![](images/4219623e0fbac60aec9313adab9f7d3cac3bb865a7e990f2a1a561a7ea23756c.jpg)  
Figura 98. Caso de simulación nº33: presión.

![](images/df1ac0923feecc095ebb2e5d9bb960e268e79ceb1dd486ad770adc801ee28cea.jpg)

Figura 99. Caso de simulación nº33: fuerza.  
![](images/312f8240e8b740a5e37b2778d58ab1b0eead0e2031dd133f17239d6693979ade.jpg)

Figura 100. Caso de simulación nº34: velocidad angular  
![](images/8f0433d8c78503a44256cc4cbd08361312b22baeae8f77139516241061ca8e7f.jpg)  
Figura 101. Caso de simulación nº34: presión.

![](images/261fe674aa48ea7fa4d6079064ea18b9ada1c360ae0bfb5aeb9206febc0a37fa.jpg)  
Figura 102. Caso de simulación nº34: fuerza.

![](images/613d398965e5d938eafaa35976058df3f4067ff9414f6c2e4673722b435389bb.jpg)

Figura 103. Caso de simulación nº35: velocidad angular.  
![](images/5865c791749bc7ba06960756db633d5ef568dd926924c29eab904c4e059b0879.jpg)  
Figura 104. Caso de simulación nº35: presión.

![](images/1840949418ab1476cdb33c14032ac375485673954cb7e8856d95aca457a31820.jpg)

Figura 105. Caso de simulación nº35: fuerza.  
![](images/f6fff89f3d2b7c3e620beea71445ecda569159f3f26bbd9aef9642f6375fb9b8.jpg)

Figura 106. Caso de simulación nº36: velocidad angular.  
![](images/345a2d082788c0ee010d3532436de0e078aaf30b7ecb8e3c2898c2db2901f75c.jpg)  
Figura 107. Caso de simulación $n ^ { o } 3 6 \cdot$ presión.

![](images/900da49596c9f13886992553eff5a63cc7606dcc945739a6812cb3ce78829dc4.jpg)  
Figura 108. Caso de simulación nº36: fuerza.

![](images/0790f6d825affa29c9b51c3ac7c3a6dd9afe3320c2b8bf07fb8971b772739b04.jpg)

Figura 109. Caso de simulación nº37: velocidad angular.  
![](images/68aaa6ca2132a4601e9f8f54e86386662be4d16fb43c650db01ee8577c6a6c67.jpg)  
Figura 110. Caso de simulación nº37: presión.

![](images/c027aff852e077727c2f13ac9805620d6a21c03d90643e591053d38cdfe33c08.jpg)  
Figura 111. Caso de simulación nº37: fuerza.

![](images/e4b40b024f33ee8e5cdaddd3c91887c31d5067ce533f602dacec9f2ed113d6e7.jpg)

Figura 112. Caso de simulación nº38: velocidad angular.  
![](images/c57c02740e3925d9f558f0767752e5eee7006a7e2918e026f37f3b0f3a6b0083.jpg)  
Figura 113. Caso de simulación nº38: presión.

![](images/c8ccbdea4b4b4695c5e9395d26726cebe6c118d3bcf3630d6b27b29031837287.jpg)

Figura 114. Caso de simulación nº38: fuerza.  
![](images/71b5974fab2148c3c93a36dca1e7a7c505d740c0776b8a3648c1f8f9347d6378.jpg)

Figura 115. Caso de simulación nº39: velocidad angular.  
![](images/b77542e7b0e579ce98817007e550e20fadd1c05826ab659d8a3dd064c7adae21.jpg)  
Figura 116. Caso de simulación nº39: presión.

![](images/417932afb053ee1c9a9e022f76b006a019f89c194234b1a108f5fd80087805de.jpg)  
Figura 117. Caso de simulación nº39: fuerza.

![](images/d489da91c559191691882db71819055ef3f0fbb74e1275bf573c0e16decdd85a.jpg)

Figura 118. Caso de simulación $n ^ { o } 4 0 \cdot$ velocidad angular.  
![](images/165dfe854e81caf214e8caaccabe1505eccf8d9646619ac5158f7ad9714fce9a.jpg)  
Figura 119. Caso de simulación $\Pi ^ { o _ { 4 } 0 . }$ : temperaturas.

![](images/4858608c1e053223cb7af99160351c1ecd2f96b529284a2dcc84ccb426b8217b.jpg)  
Figura 120. Caso de simulación nº41: velocidad angular.

![](images/374cbfdd0b4efe60d159c1bed79e12d3991a2bdc8537e3df3687dd742637ec5b.jpg)

Figura 121. Caso de simulación nº41: temperaturas.  
![](images/f2ae25c1007e266d1ca462a5251c653520fc0b9c1c95bc4dcf09df15ac0f5a6d.jpg)  
Figura 122. Caso de simulación nº42: velocidad angular.

![](images/705a0615ab83c886d477070a7eb8e20f5af1aa994960d28fac5b0821c75c9d4a.jpg)  
Figura 123. Caso de simulación nº42: temperaturas.

![](images/de81f0e157a99ddf91213917362877d66de532132dadae5e9c6f004dd3485c62.jpg)

Figura 124. Caso de simulación nº43: velocidad angular.  
![](images/efed48cc22c78a0acd3c1300ed0b3df3d9d1968c068e3ba41858a0bacfe88f8d.jpg)  
Figura 125. Caso de simulación nº43: temperaturas.

![](images/dbf46753ca0e621acc4cd7f1035c61db77ab409dff8409b72716ca8658511331.jpg)  
Figura 126. Caso de simulación nº44: velocidad angular.

![](images/fdb19a823c219f185e1246b65ce1dd161ef33fdaa57e60a4aa6bc406d377c02b.jpg)

Figura 127. Caso de simulación nº44: temperaturas.  
![](images/3fdebed2f4b96e8be63e572e76c8309d3be7e9461e92d6bda65d8a07af7051bb.jpg)  
Figura 128. Caso de simulación nº45: velocidad angular.

![](images/639950e1659a58ae9585dc268016bc965633b29a7a6d8de50490ce2993390003.jpg)

Figura 129. Caso de simulación nº45: temperaturas.  
![](images/be8c4f1c79c2aac97aab8a244bf1724cd9c69ec6c2eb7e539160a7cdf3b49ed0.jpg)

Figura 130. Caso de simulación nº46: velocidad angular.  
![](images/67d09182eccc8fbc601d1af9bc01b3b0f089459a18e875de2c7e33fa61c40a0f.jpg)  
Figura 131. Caso de simulación nº46: temperaturas.

![](images/ca82c050b4cc445157d8b0f169afd23ed292b0bdc6c2e6fbd47519f3486a7378.jpg)

Figura 132. Caso de simulación $n ^ { o } 4 7 \cdot$ velocidad angular.  
![](images/ea947bb345dbaf9928c336cd1d89cebe2ec7de45cf2dba7ac8961abe035b000e.jpg)  
Figura 133. Caso de simulación $n ^ { o } 4 7 \cdot$ temperaturas.