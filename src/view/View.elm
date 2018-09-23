module View exposing (..)

import Model exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model = let num = String.fromInt model.diceFace in
    div [id "page"]
        [ viewHeader
        , viewMenu model
        , viewContent model num
        , viewFooter
        ]

viewDice : Model -> String -> Html Msg
viewDice model num =
    let 
      dicePath =
        if model.dice == D6 then
          "/imgs/d6_"++num++".png"
        else if model.dice == D8 then
          "/imgs/d8_"++num++".png"
        else
          "/imgs/d20_"++num++".png"
      
    in
      img [ src dicePath, alt "Dice", width 100, onClick Roll] []

viewHeader : Html Msg
viewHeader =
    div [id "header"] [
        h1 [] [ text "Roll your rol dice!" ]
      , viewInstructions
    ]

viewMenu : Model -> Html Msg
viewMenu model =
    div [id "menu"] [
              ul []
              [ li [ onClick (NewDice (Model.D6)) ] [ a [ class (getActive model Model.D6), href "#" ] [ text "D6"] ]
              , li [ onClick (NewDice (Model.D8)) ] [ a [ class (getActive model Model.D8), href "#" ] [ text "D8" ] ]
              , li [ onClick (NewDice (Model.D20)) ] [ a [ class (getActive model Model.D20), href "#" ] [ text "D20"] ]
              ]
              ]

viewContent : Model -> String -> Html Msg
viewContent model num =
    div [id "content"] [ 
              viewDice model num
              ]

viewFooter : Html Msg
viewFooter = 
    div [id "footer"] [
      h4 [] [ text "Just a demo" ]
    ]

viewInstructions : Html Msg
viewInstructions =
    div []
      [ text "Clic on the dice to roll it." ]

getActive model aux =
    if model.dice == aux then "active" else ""