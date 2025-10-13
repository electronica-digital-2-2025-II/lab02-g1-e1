
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=20837015&assignment_repo_type=AssignmentRepo)
# Lab02 - Unidad Aritmético-Lógica.

# Integrantes
1. Jose Luis Ocoro Banguera
2. Miguel Lopez
3. Angel Ramires

# Informe

Indice:

1. [Diseño implementado](#diseño-implementado)
2. [Simulaciones](#simulaciones)
3. [Implementación](#implementación)
4. [Conclusiones](#conclusiones)
5. [Referencias](#referencias)

## Diseño implementado

### Descripción
En este laboratorio se trabajó en el diseño e implementación de diferentes módulos digitales en Verilog, con el objetivo de construir paso a paso una ALU de 4 bits totalmente funcional.
Primero se desarrollaron los bloques básicos: sumador, restador, compuerta AND, registro de corrimiento y multiplicador, para luego integrarlos dentro del módulo principal de la ALU.

Finalmente, se realizó la simulación completa a través del testbench de la ALU, verificando el correcto funcionamiento de cada operación según el valor del selector (SEL) y observando la salida general del sistema.
### Diagrama
* Sumador de 4 bits: 
![sumador de 4 bit diagrama](https://github.com/user-attachments/assets/d863b44f-815a-4ebf-8569-86df93a965a7)
En este diagrama se observa el sumador de 4 bits, el cual está compuesto por la conexión de cuatro sumadores de 1 bit que trabajan de forma encadenada. Cada uno toma el acarreo del anterior y lo pasa al siguiente, permitiendo así realizar la suma completa de dos números binarios de 4 bits. Este diseño es la base para operaciones más complejas dentro de la ALU, ya que a partir de este mismo principio se pueden construir circuitos como el restador o el multiplicador.

* Restador de 4 bits:
<img width="801" height="292" alt="restador de 4 bit circuito" src="https://github.com/user-attachments/assets/45c22935-c23d-4e9c-a42b-b1b86c06f436" />
Este es el restador de 4 bits, el cual se basa en el mismo principio del sumador de 4 bits. La diferencia está en que, en lugar de propagar un acarreo entre las etapas, aquí se propaga un préstamo (borrow). Cada bloque de 1 bit realiza la resta de los bits correspondientes de A y B, junto con el préstamo recibido del bit anterior. El resultado final entrega la diferencia de los 4 bits y el préstamo final, permitiendo restar dos números binarios de forma completa.

* Multiplicador (FSM de 3 bits):
<img width="502" height="174" alt="multiplicador" src="https://github.com/user-attachments/assets/053099a2-accc-4dd2-927d-5259f05db3f9" />
Luego tenemos el multiplicador, que en este caso trabaja con una máquina de estados finitos (FSM). A diferencia de las operaciones anteriores, aquí la multiplicación se hace de forma secuencial, controlada por señales de reloj, reinicio e inicio. El circuito produce un resultado de 6 bits y una señal “done” que indica cuando la operación termina. Este diseño muestra cómo se puede implementar una multiplicación binaria paso a paso dentro de un sistema digital.

* AND de 4 bits:
<img width="1024" height="1024" alt="and_4bit_block" src="https://github.com/user-attachments/assets/f9f57a61-1e6f-49b2-9abb-ec6876e2f089" />
A continuación se observa el módulo AND de 4 bits, el cual está compuesto por cuatro compuertas AND conectadas en paralelo. Cada compuerta recibe un par de bits correspondientes de las entradas A y B, generando una salida en el vector final únicamente cuando ambos bits de entrada son ‘1’. De esta forma, el módulo produce una salida de 4 bits que representa la operación lógica AND entre A y B. Este bloque hace parte de la ALU y permite realizar operaciones lógicas además de las aritméticas.

* Shift Right de 4 bits:
![registro de desplazamiento de 4 bit](https://github.com/user-attachments/assets/67079501-13d4-41fe-8f81-a0f4f9b75960)
Finalmente, se incluye el módulo de corrimiento a la derecha. Este circuito toma la entrada A y la desplaza hacia la derecha tantas posiciones como indiquen los bits menos significativos de B. Con esto se pueden realizar operaciones de división por potencias de dos o mover información dentro de los registros, algo común en procesadores y ALUs.

* ALU de 4 bits:
<img width="1536" height="1024" alt="alu diagrama" src="https://github.com/user-attachments/assets/5330ba25-b998-49ce-ab9e-93cc4be55559" />
En este diagrama se observa la ALU de 4 bits, que integra todos los módulos anteriores: suma, resta, multiplicación, operación AND y corrimiento. A través del selector SEL se elige qué operación realizar, mientras que las señales de reloj y control permiten el funcionamiento del multiplicador FSM. La salida Y, de 8 bits, muestra el resultado final. Este circuito resume todo el trabajo de los módulos anteriores en una sola unidad funcional.

## Simulaciones 

## Implementación

## Conclusiones

## Referencias
