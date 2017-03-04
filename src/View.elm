module View exposing (view)

import Html exposing (Html, main_, section, div, text, span)
import Html.Attributes exposing (class)
import Model exposing (..)
import Date exposing (Date, hour, minute)
import Date.Format exposing (format)
import Messages exposing (Msg(..))


startTimeView : Date -> Html Msg
startTimeView startTime =
    span [ class "start-time" ] [ text <| format "%d.%m %H:%M" startTime ++ " " ]


scoreView : Match -> Html Msg
scoreView match =
    let
        score =
            "  " ++ toString match.homeTeam.goals ++ " - " ++ toString match.homeTeam.goals ++ "  "
    in
        span [ class "team-score" ] [ text score ]


teamNameView : Team -> Html Msg
teamNameView team =
    span [ class "team-name" ] [ text team.name ]


matchView : Match -> Html Msg
matchView match =
    div [ class "match" ]
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


view : Model -> Html Msg
view model =
    main_ [ class "live-score-page" ]
        [ scheduleView model.schedule
        ]
