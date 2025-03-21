main = do
  putStrLn $ show $ somaSe "Pos" a
  putStrLn $ show $ somaSe "Neg" a
  putStrLn $ show $ somaSe "Par" a
  putStrLn $ show $ somaTeste ehPositivo a
  putStrLn $ show $ somaTeste ehNegativo a
  putStrLn $ show $ somaTeste ehPar a
  putStrLn $ show $ somaTeste ehImpar a
  putStrLn $ show $ operaTeste ehPositivo adiciona 0 a
  putStrLn $ show $ operaTeste ehImpar multiplica 1 a

ehPositivo x = x > 0
ehNegativo x = x < 0
ehPar x = mod x 2 == 0
ehImpar x = mod x 2 == 1
adiciona x y = x + y
multiplica x y = x * y

a = [3,4,5,-7,10,-8,12]

soma [] = 0
soma (x:xs) = x + soma xs

somaSe cond [] = 0
somaSe cond (x:xs)
  | cond == "Pos" && x > 0 = x + somaSe cond xs
  | cond == "Neg" && x < 0 = x + somaSe cond xs
  | cond == "Par" && mod x 2 == 0 = x + somaSe cond xs
  | otherwise = somaSe cond xs

-- onde teste é uma condição (função aplicada em x)
somaTeste teste [] = 0
somaTeste teste (x:xs)
  | teste x = x + somaTeste teste xs
  | otherwise = somaTeste teste xs

prodTeste teste [] = 1
prodTeste teste (x:xs)
  | teste x = x * prodTeste teste xs
  | otherwise = prodTeste teste xs

operaTeste teste op neutro [] = neutro
operaTeste teste op neutro (x:xs)
  | teste x = op x $ operaTeste teste op neutro xs
  | otherwise = operaTeste teste op neutro xs