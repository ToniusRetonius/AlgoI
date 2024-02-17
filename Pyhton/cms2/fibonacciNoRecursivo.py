import sys

# me armo la secuencia de length n, es decir hasta el enesimo + 1
def esSecuenciaFibonacci(n: int) -> list:
  lista = [0,1,1]
  for i in range(3, n + 1 ,1):
    lista.append(lista[i-1] + lista[i-2])

  return lista

# despues le saco el que quiero con index, en este caso el n
def fibonacciNoRecursivo(n : int) -> int:
  lista = esSecuenciaFibonacci(n)
  res = lista[n]

  return res

if __name__ == '__main__':
   x = int(input())
   print(fibonacciNoRecursivo(x))