module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Service exposing (getMatchEvents)


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        ReceiveSchedule (Ok data) ->
            ( { model | schedule = data }, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( model, Cmd.none )

        ReceiveMatchEvents (Ok data) ->
            ( { model | matchEvents = Just data, matchEventsPending = Model.NotPending }, Cmd.none )

        ReceiveMatchEvents (Err _) ->
            ( model, Cmd.none )

        MatchSelected id ->
            ( { model | matchEventsPending = Model.Pending, matchIdSelected = Just id }, getMatchEvents id )
