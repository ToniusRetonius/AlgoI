-- Práctica 5 recursión sobre listas --

-- Ejercicio 1 --

longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

-- subseq me devuelve una sublista de s:<t> entre las posicione a y b --
principio :: [t] -> [t]
principio (x:xs) | longitud xs == 0 = []
                 | otherwise = x : principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

-- Ejercicio 2 --
-- ALT + Z word wrap
-- Eq es utilizada por los tipos que soportan comparaciones por igualdad. Los miembros de esta clase implementan las funciones == o /= en algún lugar de su definición --

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

todasIguales :: (Eq t) => [t] -> Bool
todasIguales (x:xs) | x /= head xs = False
                    | [x] == xs = True
                    | otherwise = todasIguales xs

--todasDistintas :: (Eq t) => [t] -> Bool

--hayRepetidos :: (Eq t) => [t] -> Bool

primeraRepe :: (Eq t) => [t] -> Bool
primeraRepe (x:xs) | pertenece x xs == True = True
                   | otherwise = False

quitar :: (Eq t) => t -> [t] -> [t]
quitar n [] = []
quitar n (x:xs) | (x /= n) == True = x : quitar n xs
                | otherwise = quitar n xs

quitarRepetidos :: (Eq t) => t -> [t] -> [t]
quitarRepetidos a [] = []
quitarRepetidos a (x:xs)| not(pertenece x xs) == True = x : quitarRepetidos a xs
                        | otherwise = quitarRepetidos a xs

quitarRepetidos' ::  (Eq t) => [t] -> [t]
quitarRepetidos' [] = []
quitarRepetidos' (x:xs)| not(pertenece x xs) == True = x : quitarRepetidos' xs
                       | otherwise = quitarRepetidos' xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y | (quitarRepetidos' x) == (quitarRepetidos' y) = True
                    | otherwise = False

capicua :: (Eq t) => [t] -> Bool
capicua x | x == reverso x = True
          | otherwise = False

-- Ejercicio 3 --

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [] = error "No hay nada bro!"
maximo [x] = x
maximo (x:xs) | maximo' [x] ([head xs]) == [x] = maximo ([x] ++ tail xs)
              | otherwise = maximo xs

maximo' :: [Integer] -> [Integer] -> [Integer]
maximo' a b | a > b = a
            | otherwise = b

sumaN :: Integer -> [Integer] -> [Integer]
sumaN n [] = []
sumaN n (x:xs) = (n + x) : sumaN n xs

sumaPrimero :: [Integer] -> [Integer]
sumaPrimero [] = []
sumaPrimero x = sumaN (head x) x

sumarUltimo :: [Integer] -> [Integer]
sumarUltimo [] = []
sumarUltimo x = sumaN (head(reverso x)) x

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

multiplosN :: Integer -> [Integer] -> [Integer]
multiplosN n [] = []
multiplosN n (x:xs) | esDivisible x n == True = x : multiplosN n xs
                    | otherwise = multiplosN n xs

esDivisible :: Integer -> Integer -> Bool
esDivisible n m | n == 0 = True
                | n < 0 = False
                | otherwise = esDivisible (n-m) m

minimo :: [Integer] -> Integer
minimo [] = error "No hay nada bro!"
minimo [x] = x
minimo (x:xs) | minimo' [x] ([head xs]) == [x] = minimo ([x] ++ tail xs)
              | otherwise = minimo xs

minimo' :: [Integer] -> [Integer] -> [Integer]
minimo' a b | a < b = a
            | otherwise = b

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar x = m : ordenar (quitar m x)
           where m = minimo x

-- Ejercicio 4 --
-- saca todos --
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | x == ' ' = sacarBlancosRepetidos xs
                             | x /= ' ' = x : sacarBlancosRepetidos xs

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (x:xs) = contarPalabras xs + 1

palabraLarga :: [[Char]] -> [Char]
palabraLarga [x] = x
palabraLarga (x:xs) | palabraLarga' x (head xs) == x = palabraLarga ([x] ++ tail xs)
                    | otherwise = palabraLarga xs

palabraLarga' :: [Char] -> [Char] -> [Char]
palabraLarga' a b | a > b = a
                  | otherwise = b

palabras :: [[Char]] -> [[[Char]]]
palabras [] = []
palabras (x:xs) = [x] : palabras xs

aplanar :: [[Char]] -> [[Char]]
aplanar [[]] = []
aplanar [x:xs] = [x] : aplanar [xs]

-- Ejercicio 5 --
-- division por 2, si el resto es 0, agrego 0, si es 1, agrego un 1
nat2bin :: Integer -> [Integer]
nat2bin n = reverso (binario n)

binario :: Integer -> [Integer]
binario 0 = []
binario n | mod n 2 == 0 = 0 : binario (div n 2)
          | mod n 2 == 1 = 1 : binario (div n 2)

bit2nat :: [Integer] -> Integer
bit2nat [] = error "No sabe, no contesta"
bit2nat x = sumatoria (sumaExpo x (exponente x))

sumaExpo :: [Integer] -> [Integer] -> [Integer]
sumaExpo [] [] = []
sumaExpo (x:xs) (y:ys) = (2^y * x) : sumaExpo xs ys

exponente :: [Integer] -> [Integer]
exponente [] = []
exponente x | (head x == 1) = (longitud x)-1 : exponente (tail x)
            | otherwise = 0 : exponente (tail x)

-- nat2hex :: Integer -> [[Char]]
-- nat2hex n = convert (hexaAux n) ++ convert'(hexaAux n)
-- el problema esta en concatenar listas con distinto tipo de dato --

-- hexaAux :: Integer -> [Integer]
-- hexaAux 0 = []
-- hexaAux n | n < 16 = [n]
--           | n > 16 = (mod n 16) : hexaAux (div n 16)

-- convert' :: [Integer] -> [Integer]
-- convert' [] = []
-- convert' (x:xs) | x < 10 = x : convert' xs
--                 | x > 10 = convert' xs

-- convert :: [Integer] -> [[Char]]
-- convert (x:xs) | x < 10 = []
--                | x >= 10 = hexa x : convert xs
-- hexa :: Integer -> [Char]
-- hexa n  | n == 10 = ['A']
--         | n == 11 = ['B']
--         | n == 12 = ['C']
--         | n == 13 = ['D']
--         | n == 14 = ['E']
--         | n == 15 = ['F']
        

-- agregar n == 1 = ['1'] plimmplim


--implementar take. Esta función toma un cierto número de elementos de una lista. Por ejemplo, take 3 [5,4,3,2,1] devolverá [5,4,3]. Si intentamos obtener 0 o menos elementos de una lista, obtendremos una lista vacía. También si intentamos tomar algo de una lista vacía, obtendremos una lista vacía.
sublistas :: [Integer] -> Int -> [[Integer]]
sublistas [] _ = []
sublistas x n = take n x : sublistas (drop n x) n

sumaAcumulada ::  [Integer] -> [Integer]
sumaAcumulada [] = []
sumaAcumulada x = sumatoriaDesdeHasta 0 ((longitud x)-1) x : sumaAcumulada (principio x) 
--funca pero te la da al reves, con reverso se soluciona -- 
sumaAcumulada'::  [Integer] -> [Integer]
sumaAcumulada' x = reverso (sumaAcumulada x)

iesimo :: (Eq t) => Integer -> [t] -> [t]
iesimo _ [] = []
iesimo n (x:xs)| n == 0 = [x]
               | otherwise = iesimo (n-1) xs

sumatoriaDesdeHasta :: Integer -> Integer -> [Integer] -> Integer
sumatoriaDesdeHasta _ _ [] = 0
sumatoriaDesdeHasta a b x | a > b = 0
                          | a == b = head(iesimo b x)
                          | a < b = head(iesimo b x) + sumatoriaDesdeHasta a (b-1) x

-- Ejercicio 6 -- 
-- type Set a = [a]

-- f1 ::  Set a -> Set a





            



