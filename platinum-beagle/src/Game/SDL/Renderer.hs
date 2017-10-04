module Game.SDL.Renderer (render) where
    import SDL
    import Game.Renderable
    import Foreign.C.Types

    render :: Renderer -> Renderable -> IO ()
    render r (Combined renderables) = mapM_ (render r) renderables
    render r (DrawLine (x1, y1) (x2, y2)) = drawLine r (P $ V2 (cint x1) (cint y1)) (P $ V2 (cint x2) (cint y2))
    render r (DrawRect (x1, y1) (width, height)) = drawRect r $ Just $ Rectangle (P $ V2 (cint x1) (cint y1)) (V2 (cint width) (cint height))

    cint :: Int -> CInt
    cint = fromIntegral
