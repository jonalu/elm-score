module View exposing (view)

import Html exposing (Html, section, div, text, span)
import Html.Attributes exposing (class)
import Model exposing (Schedule, Match, Team)
import Date exposing (Date, hour, minute)
import Date.Format exposing (format)


startTimeView : Date -> Html action
startTimeView startTime =
    span [ class "start-time" ] [ text <| format "%d.%m %H:%M" startTime ++ " " ]


scoreView : Match -> Html action
scoreView match =
    let
        score =
            "  " ++ toString match.homeTeam.goals ++ " - " ++ toString match.homeTeam.goals ++ "  "
    in
        span [ class "team-score" ] [ text score ]


teamNameView : Team -> Html action
teamNameView team =
    span [ class "team-name" ] [ text team.name ]


matchView : Match -> Html action
matchView match =
    div [ class "match" ]
        [ startTimeView match.startTime
        , teamNameView match.homeTeam
        , scoreView match
        , teamNameView match.awayTeam
        ]


view : Schedule -> Html action
view schedule =
    schedule.matches
        |> List.map (\match -> matchView match)
        |> section [ class "match-schedule" ]
