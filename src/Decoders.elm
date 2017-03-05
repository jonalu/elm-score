module Decoders exposing (..)

import Json.Decode exposing (..)
import Model exposing (Schedule, Match, Team)
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
    map2 Team
        (field "name" string)
        (field "goals" int)


match : Decoder Match
match =
    map3 Match
        (field "teamA" team)
        (field "teamB" team)
        (field "startTime" date)


schedule : Decoder Schedule
schedule =
    map Schedule
        (field "matches" (list match))
