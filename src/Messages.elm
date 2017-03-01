module Messages exposing (Msg(..))

import Http
import Model exposing (Schedule)


type Msg
    = ReceiveSchedule (Result Http.Error Schedule)
