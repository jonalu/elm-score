module View exposing (view)

import Html exposing (Html, main_, h1, h2, section, div, text, span, img)
import Html.Attributes exposing (class, src)
import Model exposing (..)
import Date exposing (Date, hour, minute)
import Date.Format exposing (format)
import Messages exposing (Msg(..))
import Html.Events exposing (onClick)


startTimeView : Maybe Date -> Html Msg
startTimeView date =
    case date of
        Nothing ->
            text "N/A"

        Just d ->
            span [ class "start-time" ] [ text <| format "%d.%m %H:%M" d ]


scoreView : Match -> Html Msg
scoreView match =
    let
        score =
            toString match.homeTeam.goals ++ " - " ++ toString match.awayTeam.goals
    in
        span [ class "team-score" ] [ text score ]


teamNameView : Team -> Html Msg
teamNameView team =
    span [ class "team-name" ] [ text team.name ]


matchView : Match -> Model -> Html Msg
matchView match model =
    let
        isActiveMatch =
            case model.matchIdSelected of
                Just id ->
                    id == match.id

                _ ->
                    False

        events =
            case isActiveMatch of
                True ->
                    matchEventsView model.matchEventsPending model.matchEvents

                False ->
                    text ""
    in
        div [ class "match", onClick (MatchSelected match.id) ]
            [ div [ class "match-header" ]
                [ startTimeView match.startTime
                , teamNameView match.homeTeam
                , scoreView match
                , teamNameView match.awayTeam
                ]
            , events
            ]


scheduleView : Model -> Html Msg
scheduleView model =
    model.schedule.matches
        |> List.map (\match -> matchView match model)
        |> section [ class "match-schedule" ]


matchEventsView : PendingState -> Maybe (List MatchEvent) -> Html Msg
matchEventsView pendingState maybeList =
    let
        className =
            case pendingState of
                Pending ->
                    "match-events match-events--loading"

                NotPending ->
                    "match-events"
    in
        case maybeList of
            Nothing ->
                text ""

            Just events ->
                events
                    |> List.map (\matchEvent -> matchEventView matchEvent)
                    |> section [ class className ]


matchEventView : MatchEvent -> Html Msg
matchEventView matchEvent =
    div [ class "match-event" ] [ img [ src matchEvent.icon, class "match-event-icon" ] [], text matchEvent.player.lastName ]


view : Model -> Html Msg
view model =
    main_ [ class "elm-score-page" ]
        [ h1 [] [ text "Elm-score" ]
        , scheduleView model
        ]
