module Service exposing (getSchedule)

import Http
import Decoders exposing (schedule, match, team)
import Messages exposing (Msg(..))
import Urls


getSchedule : Cmd Msg
getSchedule =
    Http.get Urls.premierLeagueCurrentRound schedule
        |> Http.send ReceiveSchedule
