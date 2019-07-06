import Data.List

digits :: Int -> [Int]
digits 0 = []
digits x = [snd a] ++ (digits $ fst a)
    where a = quotRem x 10

sameDigits :: Int -> Int -> Bool
sameDigits a b = (sort $ digits a) == (sort $ digits b)

filterMuls :: Int -> Bool
filterMuls x = mul3 && mul4 && mul6 && mul2 && mul5 -- sorted by fastest
    where
        mul2 = sameDigits x (x * 2) -- 0.03s
        mul3 = sameDigits x (x * 3) -- 0.01s
        mul4 = sameDigits x (x * 4) -- 0.02s
        mul5 = sameDigits x (x * 5) -- 0.07s
        mul6 = sameDigits x (x * 6) -- 0.02s

findNumbers :: [Int] -> [Int]
findNumbers range = filter (\x -> x * 6 < 1000000 && filterMuls x) range

main = putStrLn $ show $ head $ findNumbers [100000..999999]
