module Main exposing (..)

import Html exposing (program)
import Model exposing (Model, Schedule)
import Update exposing (update)
import View exposing (view)
import Messages exposing (Msg(..))
import Service exposing (getSchedule)


init : ( Model, Cmd Msg )
init =
    ( Model (Schedule []) Nothing Nothing Model.NotPending
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
