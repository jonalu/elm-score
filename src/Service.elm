module Service exposing (getSchedule, getMatchEvents)

import Http
import Decoders exposing (schedule, matchEvents)
import Messages exposing (Msg(ReceiveSchedule, ReceiveMatchEvents))
import Urls


getSchedule : Cmd Msg
getSchedule =
    Http.get Urls.premierLeagueCurrentRound schedule
        |> Http.send ReceiveSchedule


getMatchEvents : Int -> Cmd Msg
getMatchEvents id =
    Http.get (Urls.matchEvents id) matchEvents
        |> Http.send ReceiveMatchEvents
