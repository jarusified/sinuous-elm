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

redDots={  pos  = (0,10)
          ,vel = (-10,0)
          ,dia = 5
        }

-- render

scene : (Int,Int) -> (Int,Int) -> Element
scene (x,y) (w,h) =
  let (dx,dy) = (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
      dot (dia,pos) = circle dia |> filled red |> move pos
      dots = dot
 in
       collage w h
        [   circle 8
            |> filled blue
            |> move (dx, dy)
        , circle 3
            |> filled red
        ] |> color black


main : Signal Element
main =
  Signal.map2 scene Mouse.position Window.dimensions
