module Main exposing (..)

import Html exposing (program)
import Model exposing (Schedule, Match, Team)
import Update exposing (update)
import View exposing (view)
import Messages exposing (Msg(..))
import Service exposing (getSchedule)


init : ( Schedule, Cmd Msg )
init =
    ( Schedule []
    , getSchedule
    )


subscriptions : Schedule -> Sub Msg
subscriptions schedule =
    Sub.none


main : Program Never Schedule Msg
main =
    program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
