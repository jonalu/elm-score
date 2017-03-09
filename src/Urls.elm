module Urls exposing (..)


premierLeagueCurrentRound =
    "https://rest.tv2.no/sports-dw-rest/sport/schedule/tournament/230/season/338?currentRound=true"


match : Int -> String
match id =
    "https://rest.tv2.no/sports-dw-rest/sport/football/match/" ++ toString id
