module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ReceiveSchedule (Ok data) ->
            ( { model | schedule = data }, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( model, Cmd.none )
