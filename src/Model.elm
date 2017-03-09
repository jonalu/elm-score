module Model exposing (..)

import Date exposing (Date)
import Maybe exposing (Maybe)


type alias Model =
    { schedule : Schedule
    , match : Maybe Match
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
    , firstName : String
    , lastName : String
    }
