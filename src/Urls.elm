module Urls exposing (..)


premierLeagueCurrentRound =
    "http://rest.tv2.no/sports-dw-rest/sport/schedule/tournament/230/season/338?currentRound=true"


match : Int -> String
match id =
    "http://rest.tv2.no/sports-dw-rest/sport/football/match/" ++ toString id
