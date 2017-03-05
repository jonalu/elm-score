module Main exposing (..)

import Html exposing (program)
import Model exposing (Model, Schedule, Match, Team)
import Update exposing (update)
import View exposing (view)
import Messages exposing (Msg(..))
import Service exposing (getSchedule)


init : ( Model, Cmd Msg )
init =
    ( Model (Schedule []) (Match (Team "A" 0) (Team "B" 0) Nothing)
    , getSchedule
    )


subscriptions : Model -> Sub Msg
subscriptions schedule =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
