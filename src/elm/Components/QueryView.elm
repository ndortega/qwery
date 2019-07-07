module QueryViewer exposing (..)

import Html exposing (..)
import Html.Attributes exposing(..)


type Msg 
    = NoOp

type alias Model = 
    {}

init: Model 
init = 
    {}

view : Model -> Html Msg
view model =
    div []
        []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

    