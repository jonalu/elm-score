module Model exposing (..)

import Date exposing (Date)


type PendingState
    = Pending
    | NotPending


type alias Model =
    { schedule : Schedule
    , matchIdSelected : Maybe Int
    , matchEvents : Maybe (List MatchEvent)
    , matchEventsPending : PendingState
    }


type alias Schedule =
    { matches : List Match
    }


type alias Match =
    { id : Int
    , homeTeam : Team
    , awayTeam : Team
    , startTime : Maybe Date
    }


type alias Team =
    { id : Int
    , name : String
    , goals : Int
    }


type alias Player =
    { id : Int
    , lastName : String
    }


type alias MatchEvent =
    { player : Player
    , icon : String
    }
