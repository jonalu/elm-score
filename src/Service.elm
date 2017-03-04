module Service exposing (getSchedule)

import Http
import Decoders exposing (schedule)
import Messages exposing (Msg(ReceiveSchedule))
import Urls


getSchedule : Cmd Msg
getSchedule =
    Http.get Urls.premierLeagueCurrentRound schedule
        |> Http.send ReceiveSchedule
