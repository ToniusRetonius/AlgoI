# ejercicio 1 #

def pertenece (s : list, x : int) -> bool:
    for i in s:
        if x == i:
            print(True)
        else:
            pass  
pertenece([1,2,3,4,5,6], 6)

def divide_todos (s : list, x : int) -> bool:
    for i in s:
        if i % x == 0:
            res =  True
        else: 
            res = False
    print(res)
divide_todos([1,2,3,4,5], 2)

def suma_total (s : list) -> int:
    res = 0
    for i in s:
        res += i
    print(res)
suma_total([1,2,3,4,5,6])

def ordenados (s : list) -> bool:
    for i in range(len(s) - 1):
        if s[i] <= s[i + 1]:
            res = True
        else:
            res = False
    return res

def palabra_larga (s : list) -> bool:
    res = False
    for i in s:
        if len(i) > 7:
            res = True
        else:
            pass
    print(res)
palabra_larga(["hola", "mundo", "mismiiiisimo"])  

def invertir_cadena(cadena : list):
    cadena_invertida = ""
    for letra in cadena:
        cadena_invertida = letra + cadena_invertida
    return cadena_invertida

def capicua (p : str) -> str:
    res = invertir_cadena(p)
    return res

def es_palindromo (p : str) -> bool:
    if p == invertir_cadena(p):
        res = True
    else: 
        res = False
    print(res)
es_palindromo("menem")

def minuscula (p : str) -> bool:
    res = False
    for i in p:
        if True and ("a"<= i <="z"):
            res = True
        else: 
            pass
    return res

def mayuscula (p : str) -> bool:
    res = False
    for i in p:
        if True and ("A"<= i <="Z"):
            res = True
        else:
            pass
    return res

def numerito (p : str) -> bool:
    res =  False
    for i in p:
        if True and ("0" <= i <= "9"):
            res = True
        else:
            pass
    return res

def fortaleza (p : str) -> str:
    if (len(p) > 8) and minuscula(p) and mayuscula(p) and numerito(p):
        print("VERDE!")
    elif len(p) < 5:
        print("ROJA")
    else:
        print("AMARILLA")
fortaleza(p= input("Decime tu password: "))

def saldo (s : list) -> int:
    res = 0
    for i in range(len(s)):
        if s[i][0] == "I":
            res += s[i][1]
        else:
            res -= s[i][1]
    print(res)
saldo([("I",3000),("I",100),("R",1500)])

def vocales (p : str) -> list:
    vocales = []
    for i in p:
        if i == 'a':
            vocales.append(i)
        elif i == 'e':
            vocales.append(i)
        elif i == 'i':
            vocales.append(i)
        elif i == 'o':
            vocales.append(i)
        elif i == 'u':
            vocales.append(i)
        else:
            pass
    return vocales

def saca_repetidos (s : list) -> list:
    lista = []
    for i in s:
        if i not in lista:
            lista.append(i)
    return lista

def vocales_3 (p : str) -> bool:
    if len(saca_repetidos(vocales(p))) >= 3:
        res = True
    else:
        res = False
    print(res)
vocales_3("amendosoo")

# ejercicio 2 #

# Entrada y salida (IN-OUT): al salir de la funcion o procedimiento, la
# variable pasada como parametro tendra un nuevo valor asignado
# dentro de dicha funcion o procedimiento. Su valor inicial SI importa
# dentro de la funcion o procedimiento en cuestion.

def ceros_pos_par (s : list) -> list:
    p = 0
    while p < len(s):
        s.remove(s[p])
        s.insert(p,0)
        p += 2
    print(s)
ceros_pos_par(s= [1,2,3,4,5]) 

# como se trata de una lista tipo IN : al salir de la funcion esta variable tiene su valor original
def ceros_par (s : list) -> list:
    p = 0
    lista = list()

    for i in s:
        lista.append(i)

    while p < len(s):
        lista.remove(lista[p])
        lista.insert(p,0)
        p += 2

    print(s)
    print(lista)
ceros_par(s= [1,2,3,4,5])  

def pertenece (x, s : list) -> bool:
    for i in range(0, len(s), 1):
        if x == s[i]:
            return True
        else:
            i += 1

def es_vocal (p : str) -> bool:
    if pertenece(p,['a','e','i','o','u']):
        return True
    else:
        return False
    
def texto_sin_vocales (p : str) -> str:
    text = ""
    for i in p:
        if not es_vocal(i):
            text += i
        else:
            pass
    print(text)
texto_sin_vocales(p= "hola muchachos!")

def reemplaza_vocales (s : list) -> list:
    lista = []
    for i in s:
        text = ""
        for m in i:
            if not es_vocal(m):
                text += m
            else:
                pass
        lista.append(text)
    print(lista)
reemplaza_vocales(s= ["hola", "como va", "tengo hambre"])

def daVueltaStr(s : list):
    cadena_invertida = ""
    for letra in s:
        cadena_invertida = letra + cadena_invertida
    return cadena_invertida

# ejercicio 3 #

def alumnos () -> list([str]):
    lista = list()
    nombres = input("Decime el nombre del alumno: ")

    while nombres != "listo":
        lista.append(nombres)
        nombres = input("Decime el nombre del alumno: ")

    return lista
print(alumnos())

def sube (paso : str) -> list:
    credito = 0
    c = ("C", credito)
    d = ("D", credito)


    if paso == "C":
        monto = int(input("Que monto queres cargar? "))
        print("Cargaste " + str(monto) + " !" )
        credito =+ monto

    elif paso == "D":
        monto = int(input("Cuanto queres gastar? "))
        if credito < monto:
            print("No tenes guita bro! ")
        else:
            print("Gastaste " + str(monto) + " !")
            credito -= monto
        
    elif paso == "X":
        print("El programa ha finalizado! ")

    else: 
        print("No es un comando valido! ")
    
sube(paso= input("Puede elegir: \n 'C' \n 'D' \n 'X' \n"))
    
import random

def pertenece2 (x, s : list) -> bool:
    for i in range(0, len(s), 1):
        if x == s[i]:
            return True
        else:
            i += 1

def suma_total2 (s : list) -> int:
    res = 0
    for i in s:
        res += i
    return res

def siete_y_medio () -> list():
    lista = list()
    res = input("Queres un numero o te plantas? ")

    while res != "me planto":
        num = random.randint(1,12)
        if pertenece2(num, [8,9]):
            num = 0
            res = input("Queres un numero o te plantas? ")
        elif pertenece2(num, [10,11,12]):
            num = 0.5
            lista.append(num)
            if suma_total2(lista) > 7.5:
                print("Te pasaste crack")
            res = input("Queres un numero o te plantas? ")
        else:
            lista.append(num)
            if suma_total2(lista) > 7.5:
                print("Te pasaste crack")
            res = input("Queres un numero o te plantas? ")
    
    if suma_total2(lista) > 7.5:
        print("Te pasaste crack")
        print(lista)
    else:
        print(lista)
siete_y_medio()

def pertenece_a_cada_uno (s : list([list]), e : int) -> list([bool]):
    lista = list([])
    for i in s:
        if pertenece2(e,i):
            lista.append(True)
        else:
            lista.append(False)
    print(lista)

pertenece_a_cada_uno(s=([1,2,3],[1],[0],[2,3,4]), e= 1)

def es_matriz (s: list([])) -> bool:
    lista = list([])
    for i in s:
        l = len(i)
        lista.append(l)
    
    if lista.count(lista[0]) == len(lista):
        return True
    else:
        return False
        
print(es_matriz(([1,2,3],[1,2,4],[1,2,6],[1,2,6,9])))

def ordenados2 (s : list) -> bool:
    for i in range(len(s) - 1):
        if s[i] <= s[i + 1]:
            res = True
        else:
            res = False
    return res

def filas_ordenadas (s : list([])) -> bool:
    for i in s:
        if es_matriz(s):
            if ordenados2(i):
                res = True
            else:
                res = False
        else:
            res = False
    return res
print(filas_ordenadas(([1,2,5],[1,5,6],[0,8,9])))

#####################################

lista = [('Toto','Frozono','Messi'),(7,9,0)]

# i representa las filas de la matriz
for i in range(len(lista)):
    for j in range(len(lista[i])):
        print("Ganadores[ " + str(i) + "]["+ str(j)+"] = " + str(lista[i][j]))


#####################################