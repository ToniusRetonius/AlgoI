from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.

def mesetaMasLarga(list: List[int]) -> int :

  if len(list) == 0:
    return 0

  n = 1
  while n <= len(list):
    if hayMesetaDeLong(list, n) and not hayMesetaDeLong(list, n + 1):
      return n
    else:
      n += 1

def hayMesetaDeLong (l: List[int], n : int):
  for i in range(len(l) - n + 1):
    j = n + i - 1
    if todosIguales(l, i, j):
      return True
  return False

def todosIguales (list : List[int] , i : int, j : int):

  for m in range(i,j + 1):

    if list[m] != list[j]:
      return False

  return True

if __name__ == '__main__':
   x = input()
   print(mesetaMasLarga([int(j) for j in x.split()]))

