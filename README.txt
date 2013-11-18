**************** PRÁCTICA 10 - LENGUAJES Y PARADIGMAS DE PROGRAMACIÓN ******************

Autores: 
- Noelia Rodríguez Martín
- Juan Manuel Ramos Pérez
           
OBJETIVO

Acabar el código de las matrices densas y diespersas de la práctica pasada.
Desarrollar métodos para calcular el máximo y el mínimo de los elementos de una matriz.
Construit la gema (gem build).
Considerar su publicación (gem push).

CLASE MATRIZ (MADRE)

Es un clase abstracta, por tanto no tiene métodos. 


CLASE DENSA (HIJA)

MÉTODOS

Los métodos que se han implementado son los siguientes:

-- Método initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor


-- Método to_s(*args) --
Debe: mostrar la matriz

 
-- Método +(other) --
Debe: calcula la suma de dos matrices 


-- Método -(other) --
Debe: calcula la resta de dos matrices 


-- Método  *(other) --
Debe: calcula la multiplicación de dos matrices 


-- Método minimo --
Debe: calcula el número menor de todos los elementos de la matriz 


-- Método maximo --
Debe: calcula el número mayor de todos los elementos de la matriz 



CLASE DISPERSA (HIJA)

MÉTODOS

Los métodos que se han implementado son los siguientes:

-- Método initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor



-- Método calcularFilCol(numElem) --
Cálcula las filas y las columnas.

 
-- Método minimo --
Debe: calcula el número menor de todos los elementos de la matriz 


-- Método maximo -- 
Debe: calcula el número mayor de todos los elementos de la matriz 


-- Método to_s --
Debe: mostrar la matriz


-- Método +(other) --
Debe: calcula la suma de dos matrices 


-- Método -(other) --
Debe: calcula la resta de dos matrices 


