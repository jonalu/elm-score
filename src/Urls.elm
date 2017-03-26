module Urls exposing (..)


schedule : Int -> String
schedule id =
    "https://rest.tv2.no/sports-dw-rest/sport/schedule/tournament/" ++ toString id ++ "/season/338?currentRound=true"


tournaments : String
tournaments =
    "https://rest.tv2.no/sports-dw-rest/sport/football/tournament/all"


match : Int -> String
match id =
    "https://rest.tv2.no/sports-dw-rest/sport/football/match/" ++ toString id


matchEvents : Int -> String
matchEvents id =
    "https://rest.tv2.no/sports-dw-rest/sport/event?matchId=" ++ toString id ++ "&eventTypeId=19,3,2,1,15"
