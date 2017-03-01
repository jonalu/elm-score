module Service exposing (getSchedule)

import Http
import Json.Decode exposing (..)
import Model exposing (Schedule, Match, Team)
import Messages exposing (Msg(..))
import Urls


team : Decoder Team
team =
    map2 Team
        (field "name" string)
        (field "goals" int)


match : Decoder Match
match =
    map2 Match
        (field "teamA" team)
        (field "teamB" team)


schedule : Decoder Schedule
schedule =
    map Schedule
        (field "matches" (list match))


scheduleRequest : Http.Request Schedule
scheduleRequest =
    Http.get Urls.premierLeagueCurrentRound schedule


getSchedule : Cmd Msg
getSchedule =
    Http.send ReceiveSchedule scheduleRequest
