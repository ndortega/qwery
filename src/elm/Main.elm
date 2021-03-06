module Main exposing (..)
import Browser
import Browser.Navigation as Nav
import Html exposing (div,p,text)
import Html.Attributes exposing(..)
import Url
import Router exposing(Route(..), routeParser, fromUrl)

import Json.Decode as Decode exposing (Decoder, decodeString, float, int, nullable, string)
import Json.Decode.Pipeline exposing (required, optional, hardcoded)

import AppModel exposing (..)
import PageBuilder exposing (..)

-- MAIN



main : Program () Model Msg
main = 
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url Router.NotFound, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url



update: Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )
        
        UrlChanged url -> 
            ( { model | route = fromUrl url }, Cmd.none )



-- SUBSCRIPTIONS



subscriptions : Model -> Sub Msg
subscriptions _ = 
    Sub.none



-- VIEW



view : Model -> Browser.Document Msg
view model = 
    case model.route of

        Router.Home ->
            viewHomePage model 

        Router.About ->
            viewAboutPage model

        Router.Info -> 
            viewInfoPage model

        Router.NotFound -> 
            viewNotFound model
        
       


viewHomePage: Model -> Page msg
viewHomePage model = 
    buildPage "Home Page"
        (template (
            div [] 
                [ p [] [ text "Homepage" ] 
                ]
            )
        )



viewAboutPage: Model -> Page msg
viewAboutPage model =
    buildPage "About"
       (template (
            div [] 
                [ p [] [ text "About Page" ] 
                ]
            )
        )


viewInfoPage: Model -> Page msg
viewInfoPage model = 
    buildPage "Info"
       (template (
            div [] 
                [ p [] [ text "Info Page" ] 
                ]
            )
        )

viewNotFound: Model -> Page msg
viewNotFound model = 
    buildPage "Not Found"
       (template (
            div [] 
                [ p [] [ text "Page Doesn't Exist" ] 
                ]
            )
        )
