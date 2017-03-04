module Model exposing (Schedule, Match, Team)

import Date exposing (Date)


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
