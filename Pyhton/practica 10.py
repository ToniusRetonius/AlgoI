## PRACTICA 10 ##

# TEORIA 
# trabajamos con archivos de texto en esta primer parte
# funciones
# open(< (FILE) ruta del archivo >,< (MODE) caracter que indica aquello q quiero hacer con este archivo >)
# mode ::
    #1 - "r" (read)
    #2 - "a" (add)
    #3 - "w" (write)
    #4 - "x" (create)
    #5 - "t" (text mode)
    #6 - "b" (binary mode)

# por default viene open(file) en "rt" (abrir para leer el texto)

# puedo trabajar tambien con un OBJETO ARCHIVO con atributos
# ej :
# f = open("nombres.txt", "a")
# print (f.mode) --> res = "a"
# el atributo MODE nos dice el modo usado para abrir el archivo
# print(f.name) --> res = nombres
# print(f.closed) -->  nos devuelve TRUE si el archivo esta cerrado, FALSE caso contrario

# tenemos el metodo de lectura file.READ() que retorna todo el contenido del archivo como una cadena de caracteres
# podemos tambien definir el tamaño f.read([tamaño]) cantidad de caracteres leidos

#podemos usar la función type() para confirmar que el valor retornado por f.read() es una cadena de caracteres

# el metodo .close() debe ser utilizado luego de terminar la tarea

# .readlines() retorna una lista que contiene todas las líneas del archivo como elementos individuales de la lista (cadenas de caracteres)
# f = open("nombres.txt")
# print(f.readlines()) --> ['Lucas\n', 'Gino\n', 'Tomi\n', 'Flor']  :: fijarse que cada cadena de caracteres termina con un carácter de salto de línea \n, excepto la última
# f.close()

# Para modificar (cambiar el contenido) de un archivo, debes usar el método write() o append

# El modo "a" (append) te permite abrir un archivo para agregar contenido al final del contenido existente.
# f = open("datos/nombres.txt", "a")
# f.write("\nLínea Nueva") --> usamos \n antes de la línea para indicar que mi intención es que la línea nueva se agregue como una línea separada y no como una continuación de la línea actual.
# f.close()

# También podemos eliminar todo el contenido de un archivo y reemplazarlo completamente con contenido nuevo.
# con el método write() si abrimos el archivo en el modo "w" (write).
# f = open("datos/nombres.txt", "w")
# f.write("Contenido nuevo")
# f.close()

# Si deseamos escribir varias líneas a la vez, llamamos al método writelines()
# f = open("datos/nombres.txt", "a")
# f.writelines(["\nlínea1", "\nlínea2", "\nlínea3"])
# f.close()


# Ejercicio 1

# existen los métodos rstrip() y lstrip().
# rstrip() devuelve una nueva cadena con los espacios en blanco del final eliminados. 
# lstrip() devuelve una nueva cadena sin los espacios en blanco del principio.

def contarLineas ( nombre_archivo : str) -> int:
    file = open(nombre_archivo)
    lista = file.readlines()
    return len(lista)


def sacarSalto (nombre_archivo : str) -> list:
    file = open(nombre_archivo)
    lista = list(file)
    lista_sin_saltos = list()

    for i in lista:
        # usamos el metodo .rstrip(<aquello que queremos eliminar>)
        i = i.rstrip("\n")
        lista_sin_saltos.append(i)

    return lista_sin_saltos

def existePalabra ( palabra : str , nombre_archivo : str) -> bool:
    palabras = sacarSalto(nombre_archivo)

    for i in palabras:
        if i == palabra:
            return True
    
    return False


def cantApariciones ( palabra : str , nombre_archivo : str) -> int:
    lista = sacarSalto(nombre_archivo)
    apariciones = 0 

    for i in lista:
        if i == palabra:
            apariciones += 1

    return apariciones

    
# Ejercicio 2 

def clonarSinComentarios (nombre_archivo : str):
    datos = sacarSalto(nombre_archivo)
    lista_sin_comentarios = list()

    for dato in datos:
        a = dato[0]    
        if a == "#" or a == " ":
            pass
        else:
            lista_sin_comentarios.append(dato)
        
    archivo_clonado = open("clonado.txt", "w")

    for i in lista_sin_comentarios:
        archivo_clonado.write(i)
    
    return archivo_clonado


def sacarEspacios (nombre_archivo : str) -> list:
    file = open(nombre_archivo)
    lista = list(file)
    lista_sin_espacios = list()
    
    for i in lista:
        i = i.lstrip()
        lista_sin_espacios.append(i)

    return lista_sin_espacios

# Ejercicio 3 
# el corte extendido ( invertir una lista en Python)
# La sintaxis de corte admite un tercero opcional paso argumento. 
# Los valores negativos se pueden usar para hacer una copia de la misma lista en orden inverso.

def reversoLineas (nombre_archivo : str):
    lineas = sacarSalto(nombre_archivo)
    rev = lineas[::-1]

    archivo_reverso = open("reverso.txt", "w")

    for nombre in rev:
        archivo_reverso.write(nombre + '\n')

    return archivo_reverso



# Ejercicio 4

# para agregar info a un archivo sin crear uno nuevo, como vimos en la parte teorica : 
# El modo "a" (append) te permite abrir un archivo para agregar contenido al final del contenido existente.
# con el Método writelines() podemos pasarle una lista
def fraseAlFinal ( nombre_archivo : str , frase : str):
    archivo = open(nombre_archivo, "a")
    archivo.write("\n"+ frase)

    return archivo

       
# Ejercicio 5 

# El método join() en Python es una función integrada de las cadenas de texto (strings) que se utiliza para concatenar elementos de una lista o una tupla en una sola cadena de texto. 
# Toma como argumento la secuencia de elementos que deseas unir y devuelve una cadena de texto en la que los elementos están separados por el delimitador especificado.

def fraseAlPrincipio (nombre_archivo : str , frase : str):
    archivo = open(nombre_archivo)
    frase = frase + '\n'

    lista = archivo.readlines()
    lista.insert(0,frase)
    
    archivo.close()
    archivo = open(nombre_archivo, "w")
    archivo.writelines(lista)

    return archivo


# Ejercicio 6 

def lecturaBinario (nombre_archivo  : str):
    archivo = open(nombre_archivo, "rb")
        # .read(n) con n cant de bytes
    contenido = archivo.read()
        # dado que tengo que conocer la posicion en la q estoy si quiero modificar el archivo
        # usamos archivo.tell() que indica la cantidad de bytes desde el inicio del archivo
        # para cambiar la posicion uso archivo.seek(inicio, fin)
    print(contenido)

# Ejercicio 7 
import csv
def lecturaCSV (archivo_CSV : str):
    file = open(archivo_CSV)
    lectura = csv.reader(file)
    return lectura

def promedioAlumno (LU : str):
    lectura = lecturaCSV("notas.csv")
    notas = list()

    for fila in lectura:
        if fila[0] == LU:
            notas.append(fila[3])
    n = 0
    for i in notas:
        n += float(i)

    promedio = n / len(notas)
    return promedio 

# PILAS #

from queue import LifoQueue as Pila


# Ejercicio 8

import random

def generarNrosAzar (cantidad_nros : int ,desde : int , hasta : int) -> list[int]:
    lista = list()
    for i in range(desde,hasta,1):
        lista.append(i)

    lista_random = random.sample(lista,cantidad_nros)

    return lista_random

# Ejercicio 9

def crearPilaNrosAzar (n : int , desde : int, hasta: int):
    lista = generarNrosAzar(n,desde,hasta)
    p = Pila()

    for i in lista:
        p.put(i)
    
    return p


# Ejercicio 10

def crearPilaAzarDeNElementos (n : int) -> Pila:
    lista = random.sample(range(1,100), n)
    p = Pila()

    for i in lista:
        p.put(i)

    return p


p = Pila()
p.put(1)
p.put(2)
p.put(3)
p.put(4)

def dePilaALista (p : Pila) -> list:
    lista = list()
    elem = 0
    while p.empty() == False:
        elem = p.get()
        lista.append(elem)
    return lista


# tomo una pila como una lista pues si le voy quitando los elementos, el contador llega a 0 y pila desaparece
def cantidadElem (pila : Pila) -> int:
    pila = dePilaALista(pila)

    cant_elementos = len(pila)

    return cant_elementos

# Ejercicio 11 

# pasa lo mismo, la paso a lista y veo el max

def maxPila(p : Pila) -> int:
    return max(dePilaALista(p))

# Ejercicio 12

def estaBalanceada ( formula : str) -> bool:
    return 0

# COLAS

from queue import Queue as Cola

cola = Cola()
cola.put(1)
cola.put(2)
cola.put(3)
cola.put(4)


# Ejercicio 13

def colaAzar (n : int):
    lista = random.sample(range(1,220), n)
    c = Cola()

    for i in lista:
        c.put(i)
    
    return c

# Ejercicio 14

def deColaALista (c : Cola) -> list:
    lista = list()
    elem = 0
    while c.empty() == False:
        elem =  c.get()
        lista.append(elem)
    return lista


def cantidadElementosCola (c : Cola) -> int:
    return len(deColaALista(c))

# la diferencia es el orden en que se van agregando los elementos 

# Ejercicio 15 
# el pre me dice que son todos int ... asiq no hay drama con el tipo de dato
def maximoCola (c : Cola) -> int:
    return max(deColaALista(c))
# es lo mismo

# Ejercicio 16 

def carton ()-> list[int]:
    carton  = random.sample(range(0,99), 12)
    return carton

def secuenciaBingo () -> Cola[int]:
    lista_random = random.sample(range(0,99),12)
    cola = Cola()

    for i in lista_random:
        cola.put(i)
        
    return cola

def jugarCarton (carton : list[int], bolillero : Cola[int]) -> int:
    acierto = 0 
    cant_jugadas = 0

    while cant_jugadas < 12:
        if bolillero.get() in carton:
            acierto += 1
        cant_jugadas += 1
    
    return acierto

print(jugarCarton(carton=carton(),bolillero=secuenciaBingo()))

# Ejercicio 17
# en una cola vamos a almacenar los datos de un paciente segun :
    # 1 - prioridad medica (1-10)
    # 2 - nombre 
    # 3 - especialidad 

def nPacientesUrgentes (pacientes : Cola) -> int:
    # convierto a lista con 
    pacientes = deColaALista(pacientes)
    # tengo una lista con [(int, str, str), ...] quiero recuperar i[j][0] y mandarlo a otra lista y ver cuantos hay de prioridad [1-3]
    lista = list()

    for i in pacientes:
        lista.append(i[0])
    
    apariciones = 0
    for i in lista:
        if i in [1,2,3]:
            apariciones += 1

    return apariciones

#pacientes = [(1,"Nestor", "Ginecologia"), (2, "Lucas", "Urgencias"), (5,"Miriam", "Traumatologia"), (7,"Lucia", "Neurologia"), (1, "Tomas", "Nefrologia")]

# DICCIONARIOS 

# vamos a utilizar el tipo <dict> que nos provee python

# Ejercicio 18 

def sacarEspaciosLista (l : list) -> list:
    lista = list()

    for i in l:
        i = i.lstrip()
        i = i.rstrip()
        lista.append(i)
    
    return lista

def apariciones (s : list, n : int) -> int:
    a = 0
    for i in s:
        if i == n:
            a +=1
    return a

def agruparPorLen (archivo : str) -> dict: 

    archivo = rompeLineas(archivo)

    clave = list()
    valor = list()
    long = list()

    for i in archivo:
        length = len(i)
        long.append(length)
    
    # no vale en gral pero paja hacer otra aux
    long.sort()

    visitados = list()

    for i in long:
        if i not in visitados:
            visitados.append(i)
            v = apariciones(long,i)
            valor.append(v)
    
    for i in visitados:
        clave.append(i)
    
    print(clave)
    print(valor)

    diccionario = dict(zip(clave, valor))

    return diccionario


def rompeLineas (archivo : str) -> list:
    # uso el metodo .split() para separar en palabras la linea de archivo 
    archivo = sacarSalto(archivo)
    archivo = sacarEspaciosLista(archivo)

    lista = list()

    for i in archivo:
        i = i.split()
        # uso .extend() para agregar los elementos de i a una sola lista
        # obteniendo, por tanto, todas las palabras de todas las lineas del archivo en una sola lista
        lista.extend(i)
    
    return lista

# Ejercicio 19 

def promediosDict (archivo_CSV : str) -> dict:
    lectura = lecturaCSV(archivo_CSV)

    clave = list()
    promedios = list()
    libreta = list()

    for fila in lectura:
        if f'LU : {fila[0]}' not in clave:
            clave.append(f'LU : {fila[0]}')
        if fila[0] not in libreta:
            libreta.append(fila[0])
    
    for alumno in libreta:
        prom = promedioAlumno(alumno)
        promedios.append(prom)
    
    diccionario = dict(zip(clave,promedios))
    
    return diccionario

# Ejercicio 20

def desglosarArchivo (archivo : str) -> list:
    archivo = sacarSalto(archivo)
    archivo = sacarEspaciosLista(archivo)
    
    desglose = list()
    for palabras in archivo:
        palabras = palabras.split()
        desglose.extend(palabras)

    return desglose

def palabraMasFrecuente (archivo : str) -> str:
    archivo = desglosarArchivo(archivo)
    archivo.sort()
    
    visitados = list()
    veces_aparece = list()

    for i in archivo:
        if i not in visitados:
            visitados.append(i)

    for i in visitados:
        a = apariciones(archivo, i)
        veces_aparece.append(a)
    
    maximo = max(veces_aparece)

    # tiramos magia con el dict
    diccionario = dict(zip(visitados,veces_aparece))
    print(diccionario)
    
    return maximo




