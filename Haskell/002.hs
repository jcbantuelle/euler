fibonacci :: Int -> Int -> Int -> Int
fibonacci x y total
  | (x+y) > 4000000     = total
  | (x+y) `mod` 2 == 0  = fibonacci y (x+y) (total+x+y)
  | otherwise           = fibonacci y (x+y) total
    
main = print $ fibonacci 0 1 0