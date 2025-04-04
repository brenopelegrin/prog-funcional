main = do
  putStrLn "HelloWorld"
  putStrLn $ show $ 6 +-+=@ 8
  putStrLn $ show $ f1234 6 8

  -- convertendo notacao infixo para prefixo
  putStrLn $ show $ (+-+=@) 6 8

  -- convertendo notacao prefixo para infixo (somente para funcoes com 2 parametros)
  putStrLn $ show $ 6 `f1234` 8
  putStrLn $ show $ x `mod` 5
  
  putStrLn $ show $ f 5
  putStrLn $ show $ g 5
  putStrLn $ show $ h' 5
  putStrLn $ show $ mapa (*2) a

  -- lista b de 1 + (x^2) para todo x em uma lista de a
  putStrLn $ show $ mapa (+1) $ mapa (^2) a

  putStrLn $ show $ filtra (>4) a
  putStrLn $ show $ soma a
  putStrLn $ show $ pega 4 a

  putStrLn $ show $ qs a

  -- dado um vetor, imprima a soma do quadrado dos numeros menores que 5
  putStrLn $ show $ soma $ mapa (^2) $ filtra (<5) a
  -- em C, o código seria:
  --
  -- int s = 0;
  -- for (int i=0; i<n; i++){
  --    if (a[i] < 5){
  --      s += a[i] * a[i];
  --    }
  -- }
  -- return s;

  -- dado um vetor, imprima a soma do quadrado dos 3 primeiros numeros menores que 5
  putStrLn $ show $ soma $ mapa (^2) $ pega 3 $ filtra (<5) a
  putStrLn $  
    show $
    soma $
    filtra (>50) $
    mapa (^2) $
    pega 5 $
    filtra (<8) a

  putStrLn $ show $ qs a
  putStrLn $ show $ qs "Adenilso"

a=[3,2,4,1,7,9,5,4,6]
x = 42
y = x+5

-- currying 
add :: Integer -> Integer -> Integer
add a b = a + b

f :: Integer -> Integer
f a = add 5 a

-- g é uma funcao que, dado um numero, retorna numero + 5, ou seja, é exatamente igual a f
g :: Integer -> Integer
g = add 5

-- add' é exatamente igual a add
add' a b = (+) a b

-- f' é identico a f
f' a = (+) 5 a

-- g' é identico a g
g' = (+) 5

-- h' é identico a g
h' = (+5)

-- mapa := dado uma funcao de a em b, retorna uma funcao que leva uma lista de a em uma lista de b
-- ex: dado f(x) = 2x, mapa (f) irá levar uma lista de [a] em uma lista de [f(a)]
-- ex: mapa(f(x)=2x)  [1,2,0,5]  = [2,4,0,10]
mapa :: (a -> b) -> [a] -> [b]
mapa _ [] = []
mapa f (x:xs) = f x:mapa f xs

filtra :: (a->Bool) -> [a] -> [a]
filtra _ [] = []
filtra teste (x:xs)
  | teste x = x:filtra teste xs
  | otherwise = filtra teste xs

soma :: (Num a) => [a] -> a
soma [] = 0
soma (x:xs) = x + soma xs

pega :: Integer -> [a] -> [a]
pega _ [] = []
pega 0 _ = []
pega n (x:xs) = x:pega (n-1) xs

-- identificadores em haskell
-- notacao prefixo (funcao parametros)
f1234 a b = a ^2 + b *2

-- notacao infixa (parametro funcao parametro)
-- +-+=@ é uma função de dois parametros a e b que retorna a ^2 + b *2
a +-+=@ b = a ^ 2 + b *2

-- quicksort
qs :: (Ord a) => [a] -> [a]
qs [] = []
qs (pivot:xs) = menores ++ iguais ++ maiores
  where
    menores = qs $ filtra (<pivot) xs
    iguais = pivot:filtra (==pivot) xs
    maiores = qs $ filtra (>pivot) xs