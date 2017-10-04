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
        render w = SetColor (255, 0, 0, 255) $ DrawLine (0, 0) (100, 100)
