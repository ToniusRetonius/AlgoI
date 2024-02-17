-- Ejercicio 1 --

fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci(n-1) + fibonacci(n-2)

-- Ejercicio 2 --

parteZ :: Float -> Integer
parteZ n | n > 0 && n < 1 = 0
         | otherwise = parteZ(n-1) + 1

-- existen predefinidas
-- parteZ n = ceiling n
-- parteZ n = round n
-- también existe truncate y floor
-- la que sigue es como floor

-- Ejercicio 3 --

esDivisible :: Integer -> Integer -> Bool
esDivisible n m | n == 0 = True
                | n < 0 = False
                | otherwise = esDivisible (n-m) m

-- Ejercicio 4 --
-- ctrl + K + C comenta muchas lineas de codigo juntas

sumaImpares :: Integer -> Integer
sumaImpares n | n == 0 = 0
              | otherwise = sumaImpares(n-1) + (2*n - 1)

-- Ejercicio 5 --

medioFact :: Integer -> Integer
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = medioFact(n-2) * n

-- Ejercicio 6 --


sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
              | otherwise = mod n 10 + sumaDigitos(div n 10)

--Ejercicio 7 --

todosDigitoIguales :: Integer -> Bool
todosDigitoIguales n | sumaDigitos(n) == (iesimoDigito n 1) * cantDigitos(n) = True
                     | otherwise = False

--Ejercicio 8 --

cantDigitos :: Integer -> Integer
cantDigitos n | n > 0 && n < 10 = 1
              | otherwise = cantDigitos(div n 10) + 1

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = div(mod n (10^i))(10^(i-1))

--Ejercicio 9 --

comparacion :: Integer -> Bool
comparacion n | iesimoDigito n (cantDigitos(n)) == iesimoDigito n (cantDigitos(n) - (cantDigitos(n)-1)) = True
              | otherwise = False

esCapicua :: Integer -> Bool
esCapicua n | cantDigitos(n) == 1 = True
            | comparacion(n) == True = esCapicua(sacarUltimaYPrimera(n))
            | otherwise = False

sacarPrimera :: Integer -> Integer
sacarPrimera n = div n 10

sacarUltimaYPrimera :: Integer -> Integer
sacarUltimaYPrimera n = mod (sacarPrimera(n)) (10^((cantDigitos(n))-2))

-- Ejercicio 10 --

toria1 :: Integer -> Integer
toria1 n | n == 0 = 1
         | otherwise = 2^n + toria1(n-1)

toria2 :: Integer -> Integer -> Integer
toria2 q n | n == 1 = q
           | otherwise = q^n + toria2 q (n-1)

toria3 :: Integer -> Integer -> Integer
toria3 q n | n == 0 = 0
           | otherwise = q^(2*n) + toria2 q (2*n-1)

toria4 :: Integer -> Integer -> Integer
toria4 q n | n == 0 = 0
           | otherwise = toria3 q n - toria2 q (n-1)

-- Ejercicio 11 --

factorial :: Integer -> Integer
factorial n | n == 0 = 1
            | n > 0 = n * factorial(n-1)

eAprox :: Integer -> Float
eAprox n | n == 0 = 1
         | n > 0 =  1 / fromIntegral(factorial(n)) + eAprox(n-1)

e :: Float
e = eAprox(10)

-- Ejercicio 12 --

raiz2Aprox :: Integer -> Float
raiz2Aprox n = sucesion(n) - 1

sucesion :: Integer -> Float
sucesion n | n == 1 = 2
           | n > 1 = 2 + 1 / sucesion(n-1)

-- Ejercicio 13 --
-- en la parte teórica de mi práctica está >> ver apunte teoría --

sumaInterna :: Integer -> Integer -> Integer
sumaInterna n m | m == 0 = 0
                | m > 0 = n^m + sumaInterna n (m-1)

sumaDoble :: Integer -> Integer -> Integer
sumaDoble n m | n == 0 = 0
              | n > 0 = sumaInterna n m + sumaDoble (n-1) m

-- Ejercicio 14 --
-- chequear esto --
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = sumaInterna q n * sumaInterna q m

-- Ejercicio 15 --

--no le gusta el tipo de dato de p/q en sumaInterna2, pero en la practica lo hicieron y es el de abajo--
-- sumaRacionales :: Integer -> Integer -> Float
-- sumaRacionales n m | n == 0 = 0
--                    | n > 0 = sumaInterna2 (fromIntegral n) (fromIntegral m) + sumaRacionales (n-1) m

-- sumaInterna2 :: Integer -> Integer -> Float
-- sumaInterna2 p q | q == 0 = 0
--                  | q > 0 = sumaInterna2 p (q-1) + p/q

sumaRacionales2 :: Int -> Int -> Float
sumaRacionales2 n 0 = 0
sumaRacionales2 n m = sumaRacionales2 n (m-1) + fromIntegral(sumat n)/ fromIntegral m

sumat :: Int -> Int
sumat 0 = 0
sumat n = sumat (n-1) + n

-- Ejercicio 16 --
-- a) --
divideM :: Integer -> Integer -> Integer
divideM n m | (n >= m) && esDivisible n m == True = m
            | (n < m) == True = n
            | otherwise = divideM n (m+1)

menorDivisor :: Integer -> Integer
menorDivisor n = divideM n 2

-- b) --
esPrimo :: Integer -> Bool
esPrimo n | (divideM n 2) == n = True
          | otherwise = False

-- c) --
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m | (n /= m) && esPrimo n && esPrimo m == True = True
                | esPrimo n && not(esDivisible m n) == True = True
                | esPrimo m && not(esDivisible n m) == True = True
                | otherwise = False

-- d) --
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = verPrimo 2 n 

posicionPrimo :: Integer -> Integer
posicionPrimo p | p == 1 = 0
                | p > 1 && esPrimo p == True = posicionPrimo (p-1) + 1
                | p > 1 && esPrimo p == False = posicionPrimo (p-1)

posicionPrimo' :: Integer -> Integer
posicionPrimo' p | esPrimo p = posicionPrimo p 
                 | otherwise = 0

verPrimo :: Integer -> Integer -> Integer
verPrimo a b | (esPrimo a && posicionPrimo' a == b) == True = a
             | otherwise = verPrimo (a+1) b 

-- Ejercicio 17 --
-- uso fibonacci del ej 1 --
esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacci' n 0

esFibonacci' :: Integer -> Integer -> Bool
esFibonacci' n m | n == fibonacci m = True
                 | n > fibonacci m = esFibonacci' n (m+1)
                 | n < fibonacci m = False

-- Ejercicio 18 --

esPar :: Integer -> Bool
esPar x | mod x 2 == 0 = True
        | otherwise = False

elMayor :: Integer -> Integer -> Integer
elMayor a b | a > b = a
            | otherwise = b

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n | (primerDigito == mod n 10) && (not(esPar(primerDigito))) = -1
                 | (primerDigito == sobrante) && esPar(primerDigito) = primerDigito
                 | esPar(primerDigito) = elMayor (primerDigito) (mayorDigitoPar(sobrante))
                 | otherwise = mayorDigitoPar (sobrante)
                 where sobrante = div n 10
                       primerDigito = iesimoDigito n 1

-- Ejercicio 19 --
sumaInicialPrimos :: Integer -> Bool
sumaInicialPrimos n | sumanPosta' n 1 == 0 = True
                    | otherwise = False
                     
sumaEnesimosDesdeHasta :: Integer -> Integer -> Integer
sumaEnesimosDesdeHasta a b | a == b && esPrimo a == True = a
                           | a < b && esPrimo b = b + sumaEnesimosDesdeHasta a (b-1)
                           | otherwise = sumaEnesimosDesdeHasta a (b-1)

sumaPrimerosM :: Integer -> Integer
sumaPrimerosM m | m == 1 = 2 
                | otherwise =  sumaPrimerosM (m-1) + nEsimoPrimo m

sumanPosta :: Integer -> Integer -> Bool
sumanPosta n m | (sumaPrimerosM m == n) = True
               | otherwise = False

sumanPosta' :: Integer -> Integer -> Integer
sumanPosta' n m | n > m && (sumaPrimerosM m == n) == True = 0 
                | n < m = 1
                | otherwise = sumanPosta' n (m+1) 

-- Ejercicio 20 -- 
-- se re drogaron en este --

-- Ejercicio 21 -- 

