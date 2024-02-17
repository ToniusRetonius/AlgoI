from typing import List
from typing import Tuple

## auxiliares que no sirven ##
def soloUnVueloPorCiudad (vuelos : List[Tuple[str, str]]):
    origen = list()
    for vuelo in vuelos:
        if vuelo[0] in origen:
            return False
        origen.append(vuelo[0])
    return True
def soloLlegaUnVuelo (vuelos : List[Tuple[str, str]]):
    destino = list()
    for vuelo in vuelos:
        if vuelo[1] in destino:
            return False
        destino.append(vuelo[1])

    return True
def caminoDeVuelos (vuelos : List[Tuple[str, str]]):
    for i in range(1,len(vuelos)):
        if vuelos[i-1][1] == vuelos[i][0]:
            return True
    return False