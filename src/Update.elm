module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Service exposing (getScheduleMatch)


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ReceiveSchedule (Ok data) ->
            ( { model | schedule = data }, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( model, Cmd.none )

        ReceiveScheduleMatch (Ok data) ->
            ( { model | match = Just data, matchPending = Model.NotPending }, Cmd.none )

        ReceiveScheduleMatch (Err _) ->
            ( model, Cmd.none )

        ScheduleMatchSelected id ->
            ( { model | matchPending = Model.Pending }, getScheduleMatch id )
