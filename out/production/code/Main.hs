import CodeWorld
import qualified Data.Text as T

xt :: Double -> Double
xt = (1 +)

yt :: Double -> Double
yt = (4 +)

yx x = 5 * x * x - 3 * x * x * x + x + 4

main :: IO ()
main = drawingOf $ paintFuncYx yx

paintFunc :: (Double -> Double) -> (Double -> Double) -> Picture
paintFunc xf yf = pictures $ colored red (polyline [(xf a, yf a) | a <- [-350, -349.94 .. 350]]) : field

paintFuncYx :: (Double -> Double) -> Picture
paintFuncYx yx = pictures $ colored red (polyline [(x, yx x) | x <- [-350, -349.94 .. 350]]) : field

field :: [Picture]
field =
  [polyline [(-350, 0), (350, 0)], polyline [(0, -350), (0, 350)]]
    ++ [polyline [(x, 0.25), (x, -0.25)] | x <- [-350 .. 350]]
    ++ [polyline [(0.25, y), (-0.25, y)] | y <- [-350 .. 350]]
    ++ [(translated (x + 0.2) (-0.5) . scaled 0.5 0.5) (lettering ((T.pack . show) (round x))) | x <- [-350 .. 350]]
    ++ [(translated (-0.5) (y - 0.25) . scaled 0.5 0.5) (lettering ((T.pack . show) (round y))) | y <- [-350 .. -1]]
    ++ [(translated (-0.5) (y - 0.25) . scaled 0.5 0.5) (lettering ((T.pack . show) (round y))) | y <- [1 .. 350]]
