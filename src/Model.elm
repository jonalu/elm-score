module Model exposing (Schedule, Match, Team)


type alias Schedule =
    { matches : List Match
    }


type alias Match =
    { homeTeam : Team
    , awayTeam : Team
    }


type alias Team =
    { name : String
    , goals : Int
    }
