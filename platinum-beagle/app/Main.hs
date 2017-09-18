{-# LANGUAGE OverloadedStrings #-}
module Main where

import SDL
import Lib

main :: IO ()
main = do
    initializeAll
    window <- createWindow "Platinum Beagle" defaultWindow
    renderer <- createRenderer window (-1) defaultRenderer
    appLoop renderer

appLoop :: Renderer -> IO ()
appLoop renderer = do
    events <- pollEvents
    let eventIsQPress event =
            case eventPayload event of
                KeyboardEvent kbEvent -> (keyboardEventKeyMotion kbEvent == Pressed) && (keysymKeycode (keyboardEventKeysym kbEvent) == KeycodeQ)
                _ -> False
        qPressed = any eventIsQPress events

    rendererDrawColor renderer $= V4 0 0 255 255
    clear renderer
    present renderer

    if not qPressed
        then (appLoop renderer) else return ()
