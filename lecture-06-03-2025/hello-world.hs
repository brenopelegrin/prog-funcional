-- Monad
main = do
  putStrLn "Hello World!"
  putStrLn $ show $ y
  putStrLn $ show $ f True
  putStrLn $ show $ f $ y > 10
  putStrLn $ show $ g 10
  --putStrLn $ show $ m x y
  putStrLn $ show $ m y x
  putStrLn $ show $ q 5
  putStrLn $ show $ fat 5
  putStrLn $ show o3
  putStrLn $ show o5
  putStrLn $ show (r o5)
  putStrLn $ show (r o6)
  putStrLn $ show (r o7)
  --putStrLn $ show (s o3)
  --putStrLn $ show (s o6)
  putStrLn $ show (s o2)
  putStrLn $ show (s o5)
  --putStrLn $ show (s o7)
  

-- x = 5
x = x+1
y=8
p = show y

f True = 5
f False = 42

g t = t+1

h t = 15 + x

m t y = t + 5

q 0 = 1
q n = n *  q(n-1)

fat n = if n == 0 then 1 else n * fat (n-1)

o1 = []
o2 = [5]

o3 = [True, False, y>10, q 5<100]

o5 = 7:6:o2
o6 = [True, True, x>10, y<5]
o7 = [y, 10, x, 11]

r [] = 0

r (x:xs) = 1 + r xs

s [] = 0
s (x:xs) = x + s xs

o8 = [1..10]