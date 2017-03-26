module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
import Service exposing (getSchedule, getMatchEvents)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReceiveTournaments (Ok data) ->
            ( { model | tournaments = data }, Cmd.none )

        ReceiveTournaments (Err _) ->
            ( model, Cmd.none )

        ReceiveSchedule (Ok data) ->
            ( { model | schedule = data }, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( model, Cmd.none )

        ReceiveMatchEvents (Ok data) ->
            ( { model | matchEvents = Just data, matchEventsPending = Model.NotPending }, Cmd.none )

        ReceiveMatchEvents (Err _) ->
            ( model, Cmd.none )

        TournamentSelected id ->
            ( { model | tournamentIdSelected = Just id }, getSchedule id )

        MatchSelected id ->
            ( { model | matchEvents = Just [], matchEventsPending = Model.Pending, matchIdSelected = Just id }, getMatchEvents id )
