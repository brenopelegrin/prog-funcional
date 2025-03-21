main = do
  putStrLn $ show a
  putStrLn $ show $ soma a
  putStrLn $ show $ somaPos a
  putStrLn $ show $ somaNeg a
  putStrLn $ show $ somaPar a

a = [3,4,5,-7,10,-8,12]

soma [] = 0
soma (x:xs) = x + soma xs

somaPos [] = 0
somaPos (x:xs)
  | x > 0 = x + somaPos xs
  | otherwise = somaPos xs

somaNeg [] = 0
somaNeg (x:xs)
  | x < 0 = x + somaNeg xs
  | otherwise = somaNeg xs

somaPar [] = 0
somaPar (x:xs)
  | mod x 2 == 0 = x + somaPar xs
  | otherwise = somaPos xs