-- skeleton

import List exposing (map,map2)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Keyboard
import Text
import Time exposing (Time,fps)
-- import Signal exposing (Signal, (<-),(~),foldp)
import Signal
import Window
import Mouse
import Color exposing (..)

-- model
main : Signal Element
main =
  Signal.map2 scene Mouse.position Window.dimensions


scene : (Int,Int) -> (Int,Int) -> Element
scene (x,y) (w,h) =
  let (dx,dy) =
        (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
  in
       collage w h
        [ circle 10
            |> filled red
        , circle 13
            |> filled blue
            |> move (dx, dy)
        ] |> color black
