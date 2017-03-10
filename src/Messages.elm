module Messages exposing (Msg(..))

import Http
import Model exposing (Schedule, MatchEvent)


type Msg
    = ReceiveSchedule (Result Http.Error Schedule)
    | ReceiveMatchEvents (Result Http.Error (List MatchEvent))
    | MatchSelected Int
