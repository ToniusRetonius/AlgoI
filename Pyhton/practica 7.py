# los comentarios se hacen con "#" 
# hay que usar la notacion de tipado en todas las variables  :: 
# def funcion (numero : int) -> Bool :

# ejercicio 1 #
## la funcion ROUND en python me permite definir a que valor decimal redondear
# en este ejercicio tenemos que importar math
import math
def raizDe2():
    num = round(math.sqrt(2), 4)
    print(num)
raizDe2()

def imprimir_hola():
    print ("Hola!")
imprimir_hola()

def imprimir_un_verso():
    verso = "Tomo para no enamorarme "
    print(verso)
imprimir_un_verso() 

def factorial_de_2 ():
    num = 2 * 1 * 1
    print(num)
factorial_de_2()

def factorial_de_3():
    num = 3 * 2 * 1 * 1
    print(num)
factorial_de_3()

## hasta el 7 es lo mismo con distinto numero ##

# ejercicio 2 #

def imprimir_saludo (nombre: str)->str:
    print("Hola " + nombre)
imprimir_saludo(nombre= input("Decime tu nombre crack! "))   

def raiz_cuadrada (numero: int) -> float:
    print(math.sqrt(numero))
raiz_cuadrada(numero= int(input("Dame un numero crack! ")))

estribillo = "Tomo para no enamorarme"
def imprimir_dos_veces (estribillo : str) -> str:
    print(estribillo + "\n" + estribillo)
imprimir_dos_veces(estribillo)

## el "\n" se usa en python para realizar un salto de linea 

def multiplo_de (n : int , m : int) -> int:
    if n % m == 0 :
        print("Es multiplo!")
    else : 
        print("No es multiplo!") 
multiplo_de(n= int(input("Dame un numero n ")), m= int(input("Dame un numero m ")))

def es_par (num : int) -> bool: 
    if num % 2 == 0 :
        print("Es par!")
    else : 
        print("No es par!")
es_par(num= int(input("Dame un numero pantera: ")))

def cant_de_pizzas (comensales : int, minima_cant : int) -> int: 
    porciones = 8
    minima = comensales * minima_cant

    while porciones < minima:
        porciones += 8
    
    pizza = porciones / 8

    print(pizza)

cant_de_pizzas(comensales= int(input("Cuanta gente va a morfar pizza? ")), minima_cant= int(input("Cuanto morfa aprox cada uno? ")))

# ejercicio 3 #

def alguno_es0 (a : float, b : float) -> bool: 
    valor = (a == 0 or b == 0)
    print(valor) 
alguno_es0(0,7)

def ambos_0 (a : float, b : float) -> bool: 
    valor = (a == 0 and b == 0)
    print(valor)
ambos_0(8,9)

def nombre_largo (nombre : str) -> bool: 
    if  3 <= len(nombre) <= 8:
        print("Es largo tu nombre")
    else: 
        print("No es largo tu nombre")
nombre_largo("Tomas")

def es_bisiesto (año : int) -> bool:
    valor = (año % 400 == 0) or ((año % 4 == 0) and (año % 100 != 0))
    print(valor)
es_bisiesto(2023)
es_bisiesto(2024)

# ejercicio 4 #
# usando MIN y MAX de Python ...
def peso_del_pino(altura : int) -> int:
    return min(altura,300) * 3 + (max(altura,300) - 300) * 2  

def peso_pino (altura : int) -> int:

    if altura < 300:
        peso1 = altura * 3
        print(peso1)
    else:
        peso1 = 300 * 3
        altura2 = altura - 300
        peso2 = peso1 + (altura2 * 2)
        print(peso2)
peso_pino(500)

def es_peso_util (peso : int) -> bool:
    valor = 400 < peso < 1000
    return valor
es_peso_util(600)

def sirve_pino (altura : int) -> bool:
    peso = peso_del_pino(altura)
    utilidad = es_peso_util(peso)
    return utilidad
print(sirve_pino(200))

# ejercicio 5 #

def devolver_doble_si_es_par (num : int) -> int:
    if num % 2 == 0:
        print (num * 2)
    else:
        print(0)
devolver_doble_si_es_par(3)

def devolver_valor_si_es_par_sino_el_siguiente (num : int) -> int:
    if num % 2 == 0:
        print(num)
    else:
        print(num + 1)
devolver_valor_si_es_par_sino_el_siguiente(5)

def devolver_doble_3_triple_9 (num : int) -> int:
    if num % 9 == 0: 
        print(num * 3)
    elif num % 3 == 0:
        print(num * 2)
    else:
        print(num)
devolver_doble_3_triple_9(6)

def nombre_long (nombre : str) -> str:
    if len(nombre) < 5:
        print("Tu nombre tiene menos de 5 letras!")
    else:
        print("Muchas letras bro! ")
nombre_long(nombre= input("Decime tu nombre maquina: "))

# ejercicio 6 #

def uno_10 () -> int:
    i = 0
    while i < 11:
        print(i)
        i += 1
uno_10()

def diez_40 () -> int:
    i = 10
    while i < 41:
        print(i)
        i += 2
diez_40()

def eco () -> str:
    i = 0
    while i < 11:
        print("eco")
        i += 1
eco()

def despegue (a :int) -> int:
    i = 0
    while i < a:
        print(a)
        a -= 1
    print("Despeguee!")
despegue(10)

def viaje_tiempo (partida : int , llegada : int):
    while partida > llegada:
        print('Viajó un año al pasado, estamos en el año ' + str(partida-1))
        partida -= 1
    print("Llegamos a Narnia muchachos!")
viaje_tiempo(2024,2000)

def viaje_aristotelico (partida : int):
    while partida > 384:
        print('Viajó un año al pasado, estamos en el año ' + str(partida-20))
        partida -= 20
    print("Llegamos a la casa del doctor!")
viaje_aristotelico(2024)

# ejercicio 7 #
# implementamos la funcion RANGE(I,F,P) donde 
# Cuando se le pasa un único argumento n, la sucesión empieza desde el cero y culmina en n-1.
# Si se especifican dos argumentos, el primero pasa a indicar el inicio de la sucesión.
# Un tercer argumento indica el intervalo entre dos números de la sucesión resultante.

for num in range(1,11):
    print(num)

for num in range(10,41):
    print(num)

for e in range(10):
    print("Eco")

# ejercicio 8 #
# todo lo hago x consola
