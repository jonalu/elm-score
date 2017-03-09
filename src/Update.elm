module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Service exposing (getMatch)


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ReceiveSchedule (Ok data) ->
            ( { model | schedule = data }, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( model, Cmd.none )

        ReceiveMatch (Ok data) ->
            ( { model | match = Just data }, Cmd.none )

        ReceiveMatch (Err _) ->
            ( model, Cmd.none )

        MatchSelected id ->
            ( model, getMatch id )
