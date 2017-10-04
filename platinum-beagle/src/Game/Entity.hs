module Game.Entity (Entity(..)) where
    import Game.Renderable

    class Entity a where
        update :: (a, b) -> (a, [b])
        render :: a -> Renderable
