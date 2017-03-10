module Urls exposing (..)


premierLeagueCurrentRound : String
premierLeagueCurrentRound =
    "https://rest.tv2.no/sports-dw-rest/sport/schedule/tournament/230/season/338?currentRound=true"



-- premierLeagueCurrentRound : String
-- premierLeagueCurrentRound =
--     "https://rest.tv2.no/sports-dw-rest/sport/schedule?fromDate=2017-03-09T00%3A00%3A00%2B01%3A00&toDate=2017-03-10T00%3A00%3A00%2B01%3A00&sportId=1&pageNo=1"


match : Int -> String
match id =
    "https://rest.tv2.no/sports-dw-rest/sport/football/match/" ++ toString id


matchEvents : Int -> String
matchEvents id =
    "http://rest.tv2.no/sports-dw-rest/sport/event?matchId=" ++ toString id ++ "&eventTypeId=19,3,2,1,15"
