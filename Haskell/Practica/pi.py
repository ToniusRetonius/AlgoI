def esPrimo (n : int) -> bool:
    numeros = range(2,n)

    for i in numeros:
        if n % i == 0:
            return False
    
    return True

def esPosicion (n : int , l : list) -> bool:
    if (n >= 0) and (n <= len(l)):
        return True
    else:
        return False

def esMin ( n : int, lista : list) -> bool:
    for i in lista:
        if n > i:
            return False
    return True

def buscar (n : int, lista : list) -> int:
    i = 0 
    for num in lista:
        if num != n :
            i += 1
        else:
            return i
        
def esPrimo (n : int): 
    lista = range(2,n)
    for i in lista:
        if n % i == 0:
            return False
    return True
        
def factorizacion (n : int) -> list(tuple()):
    lista = range(2,n)
    listaPrimos = []
    listaTuplas = []

    for i in lista:
        if esPrimo(i):
            listaPrimos.append(i)
    
    for i in listaPrimos:
        if n % i == 0:
         listaTuplas.append(vecesDivide(n,i))

    return listaTuplas
    
def vecesDivide (n : int, p : int):
    veces = 0
    
    while (n % p == 0):
        veces += 1
        n = n / p
    
    res =(p, veces)
    return res

def difMax (m : list, l : list) -> int:
    if max(m) > max(l):
        res = max(m) - max(l)
    else: 
        res = max(l) - max(m)
    return res
