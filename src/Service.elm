module Service exposing (getSchedule, getMatch)

import Http
import Decoders exposing (schedule, match)
import Messages exposing (Msg(ReceiveSchedule, ReceiveMatch))
import Urls


getSchedule : Cmd Msg
getSchedule =
    Http.get Urls.premierLeagueCurrentRound schedule
        |> Http.send ReceiveSchedule


getMatch : Int -> Cmd Msg
getMatch id =
    Http.get (Urls.match id) match
        |> Http.send ReceiveMatch
