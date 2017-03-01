module Update exposing (update)

import Model exposing (Schedule)
import Messages exposing (Msg(..))


update : Msg -> Schedule -> ( Schedule, Cmd Msg )
update action schedule =
    case action of
        ReceiveSchedule (Ok data) ->
            ( data, Cmd.none )

        ReceiveSchedule (Err _) ->
            ( schedule, Cmd.none )
