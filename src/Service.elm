module Service exposing (getSchedule, getScheduleMatch)

import Http
import Decoders exposing (schedule, match)
import Messages exposing (Msg(ReceiveSchedule, ReceiveScheduleMatch))
import Urls


getSchedule : Cmd Msg
getSchedule =
    Http.get Urls.premierLeagueCurrentRound schedule
        |> Http.send ReceiveSchedule


getScheduleMatch : Int -> Cmd Msg
getScheduleMatch id =
    Http.get (Urls.match id) match
        |> Http.send ReceiveScheduleMatch
