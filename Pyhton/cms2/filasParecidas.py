from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.

    
def filasParecidas(matriz: List[List[int]]) -> bool :
  # es matriz ? 
  for fila in range(1,len(matriz)):
    if len(matriz[fila - 1]) != len(matriz[fila]):
      return False
    
    # si es matriz entonces ... existe un n / la diff entre los valores de columna j y fila sea siempre el mismo
    for j in range(len(matriz[fila])):
      if matriz[fila][j] != matriz[fila - 1][j] + (matriz[1][0] - matriz[0][0]):
        return False
  
  return True

if __name__ == '__main__':
  filas = int(input())
  columnas = int(input())
 
  matriz = []
 
  for i in range(filas):         
    fila = input()
    if len(fila.split()) != columnas:
      print("Fila " + str(i) + " no contiene la cantidad adecuada de columnas")
    matriz.append([int(j) for j in fila.split()])
  
  print(filasParecidas(matriz))