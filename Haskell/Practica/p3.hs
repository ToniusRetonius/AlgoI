-- ejercicio 1 --
j1 n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16

j2 n | n == 8 = 16
    | n == 16 = 4
    | n == 131 = 1

-- ejercicio 2 --
absoluto :: (Int -> Int)
absoluto n | n < 0 = ( n * (-1))
           | otherwise = n 


maxabs :: Int -> Int -> Int
maxabs n m | absoluto n > absoluto m = n 
           | absoluto n < absoluto m = m
           | otherwise = n 

max3 :: Int -> Int -> Int -> Int
max3 n m s | (maxabs n m  == n) && (maxabs n s == n) = n
           | (maxabs n m  == m) && (maxabs m s == m) = m
           | (maxabs s m  == s) && (maxabs n s == s) = s

cero :: Float -> Float -> Bool
cero n m | n == 0 = True
         | m == 0 = True
         | otherwise = False 

amboscero :: Float -> Float -> Bool 
amboscero 0 0 = True
amboscero _ _ = False   

mismointervalo :: Integer -> Integer -> Bool
mismointervalo n m | (n <= 3) && (m <= 3) = True
                   | (n > 7) && (m > 7) = True
                   | ((n > 3) && (n <= 7)) && ((m > 3) && (m <= 7)) = True
                   | otherwise = False

sumadistintos :: Integer -> Integer -> Integer -> Integer
sumadistintos n m s | (n /= m) && (n /= s) && (m /= s) = n + m + s
                    | (n /= m) && (n /= s) && (m == s) = n
                    | (n == m) && (n /= s) = s
                    | (n == s) && (s /= m) = s
                    | (n == m) && (s /= m) = m 

esmultiplode :: Integer -> Integer -> Bool
esmultiplode n m | (mod n m == 0)= True
                 | otherwise = False

digitounidades :: Integer -> Integer
digitounidades n = mod n 10

digitodecenas :: Int -> Int
digitodecenas n = div (mod n 100) 10

-- ejercicio 3 --

estanrelacionados :: Int -> Int -> Bool
estanrelacionados n m | (n + m * k == 0) = True
                      | otherwise = False
                       where 
                        k = div (-n) m 

-- ejercicio 4 --
prodinterno :: (Int,Int) -> (Int,Int) -> Int
prodinterno (x1,y1) (x2,y2) = (x1 + x2) + (y1 * y2)

todomenor :: (Int,Int) -> (Int,Int) -> Bool
todomenor (x1,y1) (x2,y2) | (x1 < x2) && (y1 < y2) = True
                          | otherwise = False

distanciapuntos :: (Float,Float) -> (Float,Float) -> Float
distanciapuntos (x1,y1) (x2,y2) =  sqrt (((x2 +(-x1))**2) + (y2 + (-y1))**2)

sumaterna :: (Int,Int,Int) -> Int
sumaterna (x,y,z) = x + y + z

sumarsolomultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumarsolomultiplos (x,y,z) n | esmultiplode x n && esmultiplode y n && esmultiplode z n = x + y + z
                             | esmultiplode x n && esmultiplode y n  = x + y
                             | esmultiplode x n && esmultiplode z n  = x + z
                             | esmultiplode y n && esmultiplode z n  = y + z 
                             | esmultiplode x n = x 
                             | esmultiplode y n = y
                             | esmultiplode z n = z
                             | otherwise = 0

posprimerpar :: (Int,Int,Int) -> Int
posprimerpar (x,y,z) | mod x 2 == 0 = 0
                     | mod y 2 == 0 = 1
                     | mod z 2 == 0 = 2
                     | otherwise = 4

crearpar :: Integer -> Integer -> (Integer,Integer)
crearpar n m = (n,m)

invertir :: (Integer,Integer) -> (Integer,Integer) 
invertir (n,m) = (m,n)

--ejercicio 5--

todosmenores :: (Integer,Integer,Integer) -> Bool
todosmenores (x,y,z) | f x > g x && f y > g y && f z > g z = True
                     | otherwise = False 

f :: Integer -> Integer
f n | n > 7 = (2 * n - 1)
    | n <= 7 = n * n

g n | mod n 2 == 0 = div n 2
    | mod n 2 /= 0 = 3 * n + 1

-- ejercicio 6 --

bisiesto :: Integer -> Bool
bisiesto n | (not (esmultiplode n 4) || esmultiplode n 100) && (not (esmultiplode n 4) || not (esmultiplode n 400)) = False
           | otherwise = True

-- ejercicio 7 --

distanciamanhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciamanhattan (x,y,z) (a,b,c) = absolut ((x - a) + (y - b) + (z - c))

absolut :: Float -> Float
absolut n | n >= 0 = n 
          | n < 0 = n *(-1)

-- ejercicio 8 -- 
-- ctrl + D (selecciono misma palabra)
-- alt + flechita (muevo la linea)
-- shift + alt + flechita (copia la linea en el sentido de la flechita)

comparar :: Integer -> Integer -> Integer
comparar n m | (digitodecena n + digitounidad n) > (digitodecena m + digitounidad m) = -1
             | (digitodecena n + digitounidad n) < (digitodecena m + digitounidad m) = 1
             | (digitodecena n + digitounidad n) == (digitodecena m + digitounidad m) = 0
            
digitounidad :: Integer -> Integer
digitounidad n = div (mod n 10) 1

digitodecena :: Integer -> Integer
digitodecena n = div (mod n 100) 10

digitocentena :: Integer -> Integer
digitocentena n = div (mod n 1000) 100