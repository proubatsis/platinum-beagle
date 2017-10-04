module Game.Renderable (Renderable(..), renderAll) where

    type Point = (Int, Int)
    type Dimensions = (Int, Int)

    data Renderable
        = Combined [Renderable]
        | DrawLine Point Point
        | DrawRect Point Dimensions

    renderAll :: [Renderable] -> Renderable
    renderAll renderables = Combined $ foldl (++) [] $ map flatten renderables

    flatten :: Renderable -> [Renderable]
    flatten (Combined renderables) = foldl (\a c -> a ++ (flatten c)) [] renderables
    flatten r = [r]
