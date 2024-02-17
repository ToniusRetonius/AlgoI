module MultiplosDeN where

multiplosDeNImpl2 :: Int -> [Int] -> [Int]
multiplosDeNImpl2 _ [] = []
multiplosDeNImpl2 n (x:xs) | n==0 && x==0  = x:multiplosDeNImpl2 n xs
                      | n==0          = multiplosDeNImpl2 n xs
                      | (mod x n)==0  = x:multiplosDeNImpl2 n xs 
                      | otherwise     = multiplosDeNImpl2 n xs

multiplosDeNSinCero :: Int -> [Int] -> [Int]
multiplosDeNSinCero _ [] = []
multiplosDeNSinCero n (x:xs) | (mod x n) == 0 = x:multiplosDeNSinCero n xs 
                             | otherwise = multiplosDeNSinCero n xs


multiplosDeNImpl1 :: Int -> [Int] -> [Int]
multiplosDeNImpl1 _ [] = []
multiplosDeNImpl1 n (x:xs) | n==0 && x==0  = x:multiplosDeNImpl1 n xs
                         | (mod n x) == 0 = x:multiplosDeNImpl1 n xs 
                         | otherwise = multiplosDeNImpl1 n xs