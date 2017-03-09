module Decoders exposing (..)

import Json.Decode exposing (..)
import Model exposing (Schedule, Match, Team, MatchEvent, Player)
import Date exposing (Date, fromString)


date : Decoder (Maybe Date)
date =
    string
        |> andThen
            (\iso8601 ->
                case (fromString iso8601) of
                    Ok date ->
                        succeed (Just date)

                    Err error ->
                        fail error
            )


team : Decoder Team
team =
    map3 Team
        (field "id" int)
        (field "name" string)
        (field "goals" int)


match : Decoder Match
match =
    map4 Match
        (field "id" int)
        (field "teamA" team)
        (field "teamB" team)
        (field "startTime" date)


schedule : Decoder Schedule
schedule =
    map Schedule
        (field "matches" (list match))


player : Decoder Player
player =
    map2 Player
        (field "id" int)
        (field "lastName" string)


matchEvent : Decoder MatchEvent
matchEvent =
    map2 MatchEvent
        (field "person" player)
        (at [ "eventType", "icon" ] string)


matchEvents : Decoder (List MatchEvent)
matchEvents =
    list matchEvent
