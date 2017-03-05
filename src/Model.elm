module Model exposing (..)

import Date exposing (Date)
import Maybe exposing (Maybe)


type alias Model =
    { schedule : Schedule
    , match : Match
    }


type alias Schedule =
    { matches : List Match
    }


type alias Match =
    { homeTeam : Team
    , awayTeam : Team
    , startTime : Maybe Date
    }


type alias Team =
    { name : String
    , goals : Int
    }
