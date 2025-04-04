main = do
  putStrLn "Hello World"
  -- putStrLn $ show $ primos
  putStrLn $ show $ pegaEnquanto (<100) $ primos
  putStrLn $ show $ soma $ ignoraEnquanto (<100) $ pegaEnquanto (<200) $ primos
  putStrLn $ show $ zipa [4,5,2,1,6] [5,4,8]
  putStrLn $ show $ primeiro $ head $ ignoraEnquanto ((<1000).segundo) $ zipa [1..] primos
  putStrLn $ show $ zipaCom (*) [1,2,3] [4,5,6]
  putStrLn $ show $ zipaCom (+) [1,2,3] [4,5,6]
  putStrLn $ show $ pega 10 $ zipaCom (+) uns primos

uns = 1:uns

-- Na aula de hoje, implementaremos o crivo de Eratostenes
-- primos = crivo [2..]
  -- where
    -- crivo (x:xs) = x:(crivo $ filtra (naoEhMultiplo x) xs)

-- primos = crivo [2..]
  -- where
    -- crivo (x:xs) = x:(crivo $ filtra (\y -> y `mod` x /= 0) xs)

primos = crivo [2..]
  where
    -- f . g denota a composta f bola g = f(g(x))
    -- logo, /=0 . mod x  = (y mod x) /= 0
    crivo (x:xs) = x:(crivo $ filtra ((/=0).(`mod` x)) xs)

-- (.) :: (a -> b) -> (c -> a) -> (c -> b)

-- testa se x nao eh multiplo de y
naoEhMultiplo :: Integer -> Integer -> Bool
naoEhMultiplo x y = y `mod` x /= 0

-- funcao lambda
naoEhMultiplo' x = \y -> y `mod` x /= 0

filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra teste (x:xs)
  | teste x = x:filtra teste xs
  | otherwise = filtra teste xs


pega :: Integer -> [a] -> [a]
pega _ [] = []
pega 0 _ = []
pega n (x:xs) = x:pega (n-1) xs

pegaEnquanto :: (a -> Bool) -> [a] -> [a]
pegaEnquanto _ [] = []
pegaEnquanto teste (x:xs)
  | teste x = x:pegaEnquanto teste xs
  | otherwise = []

ignoraEnquanto :: (a -> Bool) -> [a] -> [a]
ignoraEnquanto _ [] = []
ignoraEnquanto teste (x:xs)
  | teste x = ignoraEnquanto teste xs
  | otherwise = x:xs

soma :: (Num a) => [a] -> a
soma [] = 0
soma (x:xs) = x + soma xs

zipa :: [a] -> [b] -> [(a,b)]
zipa [] _ = []
zipa _ [] = []
zipa (x:xs) (y:ys) = (x,y):zipa xs ys

primeiro :: (a,b) -> a
primeiro (x,_) = x

segundo :: (a,b) -> b
segundo (_, x) = x

zipaCom :: (a->b->c) -> [a] -> [b] -> [c]
zipaCom _ [] _ = []
zipaCom _ _ [] = []
zipaCom op (x:xs) (y:ys) = (op x y):zipaCom op xs ys