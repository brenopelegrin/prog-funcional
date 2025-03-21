main = do
  putStrLn $ show $ k
  putStrLn $ filtra (\x -> x /= ' ') "Adenilso da Silva Simao"

-- types
-- veremos typeclass na proxima aula

k :: Integer
k = 5

m :: Int
m = 5

adiciona :: Integer -> (Integer -> Integer)
adiciona x y = x + y

-- a seta opera pra direita, então funciona sem parenteses
multiplica :: Integer -> Integer -> Integer
multiplica x y = x * y

ehPositivo :: Integer -> Bool
ehPositivo x = x > 0
ehPositivo2 = \x -> x > 0
ehNegativo x = x < 0
ehPar x = mod x 2 == 0
ehImpar x = mod x 2 == 1

soma:: [Integer] -> Integer
soma [] = 0
soma (x:xs) = x + soma xs

a :: [Integer]
a = [3,4,5,-7,10,-8,12]

somaSe :: [Char] -> [Integer] -> Integer
somaSe cond [] = 0
somaSe cond (x:xs)
  | cond == "Pos" && x > 0 = x + somaSe cond xs
  | cond == "Neg" && x < 0 = x + somaSe cond xs
  | cond == "Par" && mod x 2 == 0 = x + somaSe cond xs
  | otherwise = somaSe cond xs

-- onde teste é uma condição (função aplicada em x)
-- da pra ser mais generico que isso! vamos ver na proxima aula com typeclass
-- com typeclass podemos definir tipos com base em operacoes
somaTeste :: (Integer -> Bool) -> ([Integer] -> Integer)
somaTeste teste [] = 0
somaTeste teste (x:xs)
  | teste x = x + somaTeste teste xs
  | otherwise = somaTeste teste xs

prodTeste :: (Integer -> Bool) -> ([Integer] -> Integer)
prodTeste teste [] = 1
prodTeste teste (x:xs)
  | teste x = x * prodTeste teste xs
  | otherwise = prodTeste teste xs

operaTeste :: (a -> Bool) -> (a -> b -> b) -> b -> [a] -> b
operaTeste teste op neutro [] = neutro
operaTeste teste op neutro (x:xs)
  | teste x = op x $ operaTeste teste op neutro xs
  | otherwise = operaTeste teste op neutro xs

-- a é um tipo genérico, funcionando pra Integer, Char, etc
filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra teste (x:xs)
  | teste x = x:r
  | otherwise = r
    where
      r = filtra teste xs
      