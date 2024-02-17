from typing import List
from typing import Tuple

def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  largoDeRuta: int
  ciudad: str
  if origen == destino:
    largoDeRuta = -1
  
  visitados: List[str] = []
  ruta: List[Tuple[str]] = []
  ruta_encontrada = buscarRuta(origen, destino, vuelos, visitados, ruta)

  if ruta_encontrada:
    largoDeRuta = len(ruta)
  else:
    largoDeRuta = -1

  return largoDeRuta

def buscarRuta(origen: str,destino: str,vuelos: List[Tuple[str]], visitados: List[str], ruta: List[Tuple[str]]) -> bool:
  visitados.append(origen)
  if origen == destino:
    return True

  for vuelo in vuelos:
    if vuelo[0] == origen and vuelo[1] not in visitados:
      ruta.append(vuelo)
      if buscarRuta(vuelo[1], destino, vuelos, visitados, ruta):
        return True
      ruta.pop()
  
  return False
    

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))