module Messages exposing (Msg(..))

import Http
import Model exposing (Schedule, Match)


type Msg
    = ReceiveSchedule (Result Http.Error Schedule)
    | MatchSelected Match
