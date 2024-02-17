from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.

def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str]]) -> int:
    
    if origen == destino:
        largo_viaje = -1

    if hayCamino(vuelos,origen,destino):
        largo_viaje : str = len(rutaReal(origen,destino,vuelos))
    else:
        largo_viaje = -1
    
    return largo_viaje

## hayRuta me devuelve la ruta total desde un origen particular, que llamo camino 

def hayRuta (vuelos : List[Tuple[str, str]], origen : str):

    ruta: List[Tuple[str]] = []

    for vuelo in vuelos:
        if origen == vuelo[0]:
            ruta.append(vuelo)

    for vuelo in vuelos:
        if vuelo[0] != origen:
            ruta.append(vuelo)

    camino : List[Tuple[str]] = []
    camino.append(ruta[0])

    for i in range(1,len(ruta)):
        for j in range(len(camino)):
            if camino[j][1] == ruta[i][0]:
                camino.append(ruta[i])
  
    return camino

## hayCamino me dice si el destino pasado esta dentro de la ruta total del origen

def hayCamino (vuelos : List[Tuple[str, str]], origen : str, destino : str ) -> bool:
    
    for ciudad in hayRuta(vuelos, origen):
        if destino in ciudad[1]:
          return True
    return False

# me devuelve la ruta desde origen a destino

def rutaReal(origen: str, destino: str, vuelos: List[Tuple[str]]):

    camino = hayRuta(vuelos,origen)
    ruta : List[Tuple[str]] = []
    
    if hayCamino(vuelos, origen, destino):    
       for ciudad in camino:
            if ciudad[1] == destino:
                    ruta.append(ciudad)
                    return ruta
            elif ciudad not in ruta: 
                    ruta.append(ciudad) 


vuelos = [("Madrid","Buenos Aires"),("Buenos Aires", "Nepal"),("Sydney", "Roma"), ("Nepal", "Okinawa"),("Tokio", "Beijing"),("Okinawa","Ulan Bator"),("Roma", "Estocolmo")]

print(hayCamino(vuelos,"Madrid", "Tokio"))  # FALSE
print(hayCamino(vuelos,"Sydney", "Estocolmo")) # TRUE
print(hayCamino(vuelos,"Buenos Aires", "Estocolmo")) # FALSE

print(hayRuta(vuelos,"Madrid"))
print(hayRuta(vuelos,"Sydney"))
print(hayRuta(vuelos,"Buenos Aires"))
print(hayRuta(vuelos,"Ruanda"))

print(rutaReal("Madrid","Ulan Bator", vuelos))
print(rutaReal("Madrid","Okinawa", vuelos))
print(rutaReal("Tokio","Beijing", vuelos))
print(rutaReal("Tokio","Ruanda", vuelos))


print(sePuedeLlegar("Tokio","Ruanda", vuelos))
print(sePuedeLlegar("Tokio","Beijing", vuelos))
print(sePuedeLlegar("Madrid","Okinawa", vuelos))

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()

  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))