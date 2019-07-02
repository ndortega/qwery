module PageBuilder exposing (..)
import Html exposing (..) 
import Html.Attributes exposing(..)


type alias Page msg = 
    { title: String
    , body: List (Html msg)
    }

buildPage: String -> List (Html msg) -> Page msg
buildPage title body =
    { title = title
    , body = body
    }


header: Html msg
header = div [] 
    [ p [] [ text "Header" ]
    , ul []
        [ viewLink "/" 
        , viewLink "/about"
        , viewLink "/info"
        ]
    ]

footer: Html msg
footer = div [] 
    [ p [] [ text "Footer" ]
    ]

template: Html msg -> List (Html msg)
template content =
    [ header
    , content
    , footer
    ]

viewLink : String -> Html msg
viewLink path =
    li [] 
        [ a [ href path ] [ text path ] 
        ]
     