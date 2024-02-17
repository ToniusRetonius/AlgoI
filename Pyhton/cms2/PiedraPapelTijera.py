import sys

def quienGana(j1: str, j2: str) -> str : 
  res = gana(j1,j2)
  return res

def juegaBien (j : str) -> bool:
   if j == "Piedra":
      return True
   elif j == "Papel":
      return True
   elif j == "Tijera":
      return True
   else:
      return False

def gana (j1 : str , j2 :str) -> str:

  if papelGanaApiedra(j1,j2) != "Empate":
    res = papelGanaApiedra(j1,j2)

  elif tijeraGanaApapel(j1,j2) != "Empate":
    res = tijeraGanaApapel(j1,j2)

  elif piedraGanaAtijera(j1,j2) != "Empate":
    res = piedraGanaAtijera(j1,j2)

  else:
    res = "Empate"

  return res

def piedraGanaAtijera (j1 : str , j2 :str) -> str:
  if juegaBien(j1) and juegaBien(j2):

    if j1 == "Piedra" and j2 == "Tijera":
      res = "Jugador1"

    elif j1 == "Tijera" and j2 == "Piedra":
      res = "Jugador2"
    
    else:
        res = "Empate"

    return res

def tijeraGanaApapel (j1 : str , j2 :str) -> str:
   if juegaBien(j1) and juegaBien(j2):
      
      if j1 == "Tijera" and j2 == "Papel":
        res = "Jugador1"

      elif j1 == "Papel" and j2 == "Tijera":
        res = "Jugador2"
      
      else:
        res = "Empate"

      return res

def papelGanaApiedra (j1 : str , j2 :str) -> str:
   if juegaBien(j1) and juegaBien(j2):
      
      if j1 == "Papel" and j2 == "Piedra":
        res = "Jugador1"

      elif j1 == "Piedra" and j2 == "Papel":
        res = "Jugador2"
      
      else:
        res = "Empate"

      return res

if __name__ == '__main__':
  x = input()
  jug = str.split(x)
  print(quienGana(jug[0], jug[1]))