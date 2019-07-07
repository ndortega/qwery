module AppModel exposing (..)
import Browser
import Browser.Navigation as Nav
import Url
import Router exposing(Route(..), routeParser, fromUrl)

-- MODEL
type alias Model =
    { key : Nav.Key
    , url: Url.Url
    , route: Route
    }
