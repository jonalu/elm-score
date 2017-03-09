module View exposing (view)

import Html exposing (Html, main_, h1, h2, section, div, text, span)
import Html.Attributes exposing (class)
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


scoreView : ScheduleMatch -> Html Msg
scoreView match =
    let
        score =
            toString match.homeTeam.goals ++ " - " ++ toString match.awayTeam.goals
    in
        span [ class "team-score" ] [ text score ]


teamNameView : Team -> Html Msg
teamNameView team =
    span [ class "team-name" ] [ text team.name ]


matchView : ScheduleMatch -> Html Msg
matchView match =
    div [ class "match", onClick (ScheduleMatchSelected match.id) ]
        [ startTimeView match.startTime
        , teamNameView match.homeTeam
        , scoreView match
        , teamNameView match.awayTeam
        ]


scheduleView : Schedule -> Html Msg
scheduleView schedule =
    schedule.matches
        |> List.map (\match -> matchView match)
        |> section [ class "match-schedule" ]


matchDetailsView : PendingState -> Maybe Match -> Html Msg
matchDetailsView pendingState match =
    let
        className =
            case pendingState of
                Pending ->
                    "match-details match-details--loading"

                NotPending ->
                    "match-details"
    in
        case match of
            Nothing ->
                text ""

            Just m ->
                section [ class className ]
                    [ h2 [] [ text "Match details" ]
                    , matchView m
                    ]


view : Model -> Html Msg
view model =
    main_ [ class "live-score-page" ]
        [ h1 [] [ text "Elm-livescore" ]
        , scheduleView model.schedule
        , matchDetailsView model.matchPending model.match
        ]
