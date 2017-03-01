module View exposing (view)

import Html exposing (Html, ul, li, text, span)
import Html.Attributes exposing (class)
import Model exposing (Schedule, Match, Team)


scoreView : Match -> Html action
scoreView match =
    let
        score =
            toString match.homeTeam.goals ++ " - " ++ toString match.homeTeam.goals
    in
        span [ class "team-score" ] [ text score ]


teamNameView : Team -> Html action
teamNameView team =
    span [ class "team-name" ] [ text team.name ]


matchView : Match -> Html action
matchView match =
    li [ class "match" ]
        [ teamNameView match.homeTeam
        , scoreView match
        , teamNameView match.awayTeam
        ]


view : Schedule -> Html action
view schedule =
    schedule.matches
        |> List.map (\match -> matchView match)
        |> ul [ class "match-schedule" ]
