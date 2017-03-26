module Model exposing (..)

import Date exposing (Date)


type PendingState
    = Pending
    | NotPending


type alias Model =
    { tournaments : List Tournament
    , schedule : Schedule
    , tournamentIdSelected : Maybe Int
    , matchIdSelected : Maybe Int
    , matchEvents : Maybe (List MatchEvent)
    , matchEventsPending : PendingState
    }


init : Model
init =
    Model [] (Schedule []) Nothing Nothing Nothing NotPending


type alias Tournament =
    { id : Int
    , name : String
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
