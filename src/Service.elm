module Service exposing (getTournaments, getSchedule, getMatchEvents)

import Http
import Decoders exposing (tournaments, schedule, matchEvents)
import Messages exposing (Msg(ReceiveTournaments, ReceiveSchedule, ReceiveMatchEvents))
import Urls


getTournaments : Cmd Msg
getTournaments =
    Http.get Urls.tournaments tournaments
        |> Http.send ReceiveTournaments


getSchedule : Int -> Cmd Msg
getSchedule id =
    Http.get (Urls.schedule id) schedule
        |> Http.send ReceiveSchedule


getMatchEvents : Int -> Cmd Msg
getMatchEvents id =
    Http.get (Urls.matchEvents id) matchEvents
        |> Http.send ReceiveMatchEvents
