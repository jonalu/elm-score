module Messages exposing (Msg(..))

import Http
import Model exposing (Schedule, ScheduleMatch)


type Msg
    = ReceiveSchedule (Result Http.Error Schedule)
    | ReceiveScheduleMatch (Result Http.Error ScheduleMatch)
    | ScheduleMatchSelected Int
