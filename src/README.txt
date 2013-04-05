Agregados los cuadruplos para expresiones aritmeticas. Aun no se pueden utilizar arreglos ni llamadas
a funciones, ya que aun nos se ha programado dichas caracteristicas. El compilador es capaz de reco-
nocer las scopes de las variables y si no estan definidas en todo el programa. En cuanto a las
operaciones, verifica los tipos de datos sin realizar 'casting'. Por motivos de simplicidad, los
cuadruplos incluyen la informacion completa (mas no actualizada) de las variables. 

Se corrigio tambien un problema con las tablas de variables, ya que se generaban hasta terminar de
procesar todas las funciones lo cual es impractico para los fines del curso. Se adjunta tambien el
archivo de salida al procesar el codigo fuente 'test.txt'.

Para ejecutar los analizadores use el siguiente comando:

ruby SimpleParser.rb test.txt
INSTALACION:
  Para hacer uso de esta herramienta, es necesario instalar el lenguaje de
programacion Ruby, el cual se puede conseguir en la pagina:
    http://www.ruby-lang.org/
  Si lo que se desea es generar el compilador, se debe instalar el paquete de
Java llamado ANTLR, el cual es un generador de parsers multiplataforma y con
soporte para varios lenguajes de programacion. Para ello, siga las instrucciones
que se adaptan a su sistema operativo en la pagina:
    http://www.antlr.org/
Adicionalmente, se debe instalar la Gema para Ruby llamada 'antlr3', para
mayores detalles, consulte la pagina:
    http://antlr.ohboyohboyohboy.org/GettingStarted.html
Una vez que se cuenta con estas herramientas, la generacion del compilador se
consigue con el comando:
    $ antlr4ruby Simple.g
Donde 'Simple.g' es el archivo que define la gramatica y el compilador en
general.

EJECUCION:
  Para ejecutar los analizadores use el siguiente comando:
    $ ruby SimpleParser.rb --rule=programa < test.txt
Se desplegaran los tokens reconocidos entre los caracteres '<' y '>'; mientras
que las reglas gramaticales se desplegaran entre los caracteres '[' y ']'.
