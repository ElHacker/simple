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
