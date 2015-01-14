module E10_QuickCheckExamples where

import Common
import Data.List

{-
    QuickCheck can be used for property-based testing.
    A common example is that a list of something twice reversed should equal the original list.
    This could be written as:
-}
reverseProperty :: String -> Bool
reverseProperty xs = xs == reverse (reverse xs)

{-
    We could also use function composition:
-}
reverseProperty' xs = xs == (reverse . reverse) xs

{-
    Lossless encoding/compression is also a group of suitable problems for QuickCheck,
    as the decoded output of an encoded <something> should always equal the original input.
-}

{-
    Excercise 1:
    Run length encoding
    Transform a list of comparable elements into a list of tuples (n, e) where n is the number
    of consecutive elements, and e is the element.

    Example:
    encode "Heeeello Haskell!!!"
    [(1,'H'),(4,'e'),(2,'l'),(1,'o'),(1,' '),(1,'H'),(1,'a'),(1,'s'),(1,'k'),(1,'e'),(2,'l'),(3,'!')]
-}
encode :: String -> [(Int, Char)]
encode xs = map (\e -> (length e, head e)) (group xs)

{-
    Excercise 2:
    Run length decoding
    Transform the run length encoded representation back to the original list of elements.

    Example:
    decode [(1,'H'),(4,'e'),(2,'l'),(1,'o'),(1,' '),(1,'H'),(1,'a'),(1,'s'),(1,'k'),(1,'e'),(2,'l'),(3,'!')]
    "Heeeello Haskell!!!"
-}

decode :: [(Int, Char)] -> String
decode xs = concat $ map (\(n, e) -> replicate n e) xs
