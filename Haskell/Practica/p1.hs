quitar :: Int -> [Int] -> [Int]
quitar n [] = []
quitar n (x:xs) | n == x = quitar n xs
                | otherwise = x : quitar n xs

minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs) | (x > head xs) = minimo xs 
              | otherwise = minimo ([x] ++ (tail xs))

minimoN :: Int -> [Int] -> Bool
minimoN n x | minimo x == n = True
            | otherwise = False

minn :: Int -> Int -> Int
minn a b | a < b = a
         | otherwise = b
            
buscar :: Int -> [Int] -> Int
buscar n (x:xs) | n == x = 0
                | otherwise = 1 + buscar n xs

esDivisible :: Integer -> Integer -> Bool
esDivisible n m | n == 0 = True
                | n < 0 = False
                | otherwise = esDivisible (n-m) m 

divideM :: Integer -> Integer -> Integer
divideM n m | (n >= m) && esDivisible n m == True = m
            | (n < m) == True = n
            | otherwise = divideM n (m+1)

esPrimo :: Integer -> Bool
esPrimo n | (divideM n 2) == n = True
          | otherwise = False

factorizacionP :: Integer -> [(Integer,Integer)]
factorizacionP n | n < 2 = []
                 | otherwise = factorizacion n 2 

factorizar :: Integer -> Integer -> (Integer,Integer)
factorizar n p | mod n p /= 0 = (p,0)
               | otherwise = (p, 1 + snd(factorizar (div n p) p))

factorizacion :: Integer -> Integer -> [(Integer,Integer)]
factorizacion n p | n < p = []
factorizacion n p | mod n p == 0 = factorizar n p : factorizacion (div n (fst(factorizar n p) ^ snd(factorizar n p))) (p+1)
                  | mod n p /= 0 = factorizacion (div n (fst(factorizar n p) ^ snd(factorizar n p))) (p+1)

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) | x > head xs = maximo ([x] ++ tail xs)
              | otherwise = maximo xs

difMaximos :: [Int] -> [Int] -> Int
difMaximos x y | maximo(x) >= maximo(y) = maximo(x) - maximo(y)
               | otherwise = maximo(y) - maximo(x)

subcadena :: [Int] -> [Int] -> Bool
subcadena [] _ = True
subcadena (x:xs) y | elem x y == False = False
                   | otherwise = subcadena xs y

sinRepetidos :: [Int] -> [Int]
sinRepetidos [] = []
sinRepetidos (x:xs) | elem x xs == False = x : sinRepetidos xs
                    | elem x xs = sinRepetidos xs

repetido :: Int -> [Int] -> Bool
repetido n [] = False
repetido n (x:xs) | n == x && elem n xs = True
                  | otherwise = repetido n xs

vecesRepetido :: Int -> [Int] -> (Int,Int)
vecesRepetido n [] = (n,-1)
vecesRepetido n (x:xs) | x == n = (n, snd(vecesRepetido n xs) + 1)
                       | otherwise = (n, snd(vecesRepetido n xs))

vecesRepetido' :: [Int] -> [(Int,Int)]
vecesRepetido' [] = []
vecesRepetido' x | (repetido (head x) x) == True = vecesRepetido (head x) x : vecesRepetido' (quitar (head x) x)
                 | otherwise = vecesRepetido' (quitar (head x) x)

eliminarYcontar :: [Int] -> ([Int],[(Int,Int)])
eliminarYcontar [] = ([],[])
eliminarYcontar x = (sinRepetidos x, vecesRepetido' x)