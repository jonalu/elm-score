module Model exposing (..)

import Date exposing (Date)


type alias Model =
    { schedule : Schedule
    }


type alias Schedule =
    { matches : List Match
    }


type alias Match =
    { homeTeam : Team
    , awayTeam : Team
    , startTime : Date
    }


type alias Team =
    { name : String
    , goals : Int
    }
