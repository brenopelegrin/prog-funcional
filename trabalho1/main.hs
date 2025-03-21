main = do
  lb <- getLine
  la <- getLine
  lc <- getLine
  let a = read la
  let b = read lb
  let c = read lc
  putStrLn $ calculaHeron a b c

trianguloExiste a b c
  | a < 0 = False
  | b < 0 = False
  | c < 0  = False
  | a > b + c = False
  | b > a + c = False
  | c > a + b = False
  | otherwise = True

calculaHeron a b c
  | trianguloExiste a b c = show $ sqrt (p*(p-a)*(p-b)*(p-c))
  | otherwise = "-"
    where
      p = (a+b+c)/2