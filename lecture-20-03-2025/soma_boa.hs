main = do
  putStrLn $ show $ operaTeste ehPositivo adiciona 0 a
  putStrLn $ show $ operaTeste ehImpar multiplica 1 a
  putStrLn $ show $ operaTeste (\x->mod x 2 == 0) adiciona 0 a
  putStrLn $ show $ operaTeste (\x->mod x 2 == 1) multiplica 1 a
  -- multiplica todos os elementos da lista menores que 0
  putStrLn $ show $ operaTeste (<0) (*) 1 a
  -- soma todos os elementos da lista maiores que 0
  putStrLn $ show $ operaTeste (>0) (+) 0 a
  -- soma todos os elementos da lista
  putStrLn $ show $ operaTeste (\x->True) (+) 0 a
  -- soma todos os elementos da lista maiores que 0
  putStrLn $ show $ soma $ filtra (\x->x>0) a
  -- soma todos os elementos da lista
  putStrLn $ show $ soma $ filtra (\x->True) a

  -- codigo misterioso
  -- nao compila pois x*10 não é um bool
  -- para evitar esses erros, devemos usar tipos
  putStrLn $ show $ operaTeste (\x -> x*10) (+) 0 a
  
-- Currying (Haskell Curry)
-- Usando currying automaticamente 
adiciona x y = x + y
multiplica x y = x * y
-- Usando currying manualmente
adiciona' x = \y-> x + y

-- Não é currying
adiciona''' (x,y) = x + y

-- Exemplos estranhos de currying
incrementa y = y+1
incrementa' = adiciona 1

ehPositivo x = x > 0
ehPositivo2 = \x -> x > 0
ehNegativo x = x < 0
ehPar x = mod x 2 == 0
ehImpar x = mod x 2 == 1

soma [] = 0
soma (x:xs) = x + soma xs

a = [3,4,5,-7,10,-8,12]

operaTeste _ _ neutro [] = neutro
operaTeste teste op neutro (x:xs)
  | teste x = op x $ operaTeste teste op neutro xs
  | otherwise = operaTeste teste op neutro xs

filtra _ [] = []
filtra teste (x:xs)
  | teste x = x:r
  | otherwise = r
    where
      r = filtra teste xs