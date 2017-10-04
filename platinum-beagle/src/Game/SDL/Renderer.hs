module Game.SDL.Renderer (render) where
    import SDL
    import Game.Renderable
    import Foreign.C.Types
    import GHC.Word

    render :: Renderer -> Renderable -> IO ()
    render r (DrawLine a b) = drawLine r (P $ fromPoint a) (P $ fromPoint b)
    render r (DrawRect pos dim) = drawRect r $ Just $ Rectangle (P $ fromPoint pos) (fromDimensions dim)
    render r (Combined renderables) = mapM_ (render r) renderables
    render r (SetColor color renderable) = do
        rendererDrawColor r $= toV4 color
        render r renderable

    cint :: Int -> CInt
    cint = fromIntegral

    fromPoint :: (Int, Int) -> V2 CInt
    fromPoint (x, y) = V2 (cint x) (cint y)

    fromDimensions = fromPoint

    toV4 :: (Int, Int, Int, Int) -> V4 Word8
    toV4 (r, g, b, a) = V4 (fromIntegral r) (fromIntegral g) (fromIntegral b) (fromIntegral a)