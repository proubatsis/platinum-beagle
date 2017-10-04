module PlatinumBeagle.World (createWorld) where
    import Game.Entity
    import Game.Renderable
    import PlatinumBeagle.Action

    data World = World { x :: String
                       }

    createWorld :: String -> World
    createWorld x = World { x = x
                          }

    instance Entity World where
        update (w, a) = (w, [])
        render w = DrawLine (0, 0) (100, 100)
