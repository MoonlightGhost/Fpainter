import CodeWorld
import qualified Data.Text as T

nop :: Fractional p1 => p2 -> p1
nop _ = 0.0

main :: IO ()
main = drawingOf $ paintFuncYx nop

paintFunc :: (Double -> Double) -> (Double -> Double) -> Picture
paintFunc xf yf = pictures $ colored red (polyline [(xf a, yf a) | a <- [-350, -349.94 .. 350]]) : field

paintFuncYx :: (Double -> Double) -> Picture
paintFuncYx yx = pictures $ colored red (polyline [(x, yx x) | x <- [-350, -349.94 .. 350]]) : field

field :: [Picture]
field =
  [polyline [(-350, 0), (350, 0)], polyline [(0, -350), (0, 350)]]
    ++ [polyline [(x, 0.25), (x, -0.25)] | x <- [-350 .. 350]]
    ++ [polyline [(0.25, y), (-0.25, y)] | y <- [-350 .. 350]]
    ++ [(translated (x + 0.2) (-0.5) . scaled 0.5 0.5) (lettering ((T.pack . show) (round x :: Int))) | x <- [-350 .. 350]]
    ++ [(translated (-0.5) (y - 0.25) . scaled 0.5 0.5) (lettering ((T.pack . show) (round y :: Int))) | y <- [-350 .. -1]]
    ++ [(translated (-0.5) (y - 0.25) . scaled 0.5 0.5) (lettering ((T.pack . show) (round y :: Int))) | y <- [1 .. 350]]
