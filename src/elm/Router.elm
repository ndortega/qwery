module Router exposing (..)

import Url 
import Url.Parser as Parser exposing (Parser, oneOf, s, map, top)

type Route
    = Home
    | About
    | Info
    | NotFound

    
-- Defines what url links we have in our application 
routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Home top              -- equal to "/"
        , map About (s "about")     -- equal to "/about"
        , map Info (s "info")
        ]

-- Create a helper function that converts a url to a route using the parser
fromUrl : Url.Url -> Route
fromUrl url =
    (Parser.parse routeParser url) |> Maybe.withDefault NotFound 
    