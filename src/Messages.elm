module Messages exposing (Msg(..))

import Http
import Model exposing (Schedule, MatchEvent, Tournament)


type Msg
    = ReceiveTournaments (Result Http.Error (List Tournament))
    | ReceiveSchedule (Result Http.Error Schedule)
    | ReceiveMatchEvents (Result Http.Error (List MatchEvent))
    | TournamentSelected Int
    | MatchSelected Int
