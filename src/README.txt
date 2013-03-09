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
