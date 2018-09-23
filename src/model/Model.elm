module Model exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

type alias Model =
    { dice : Dice
    , diceFace : Int
    }

type Dice = D6 | D8 | D20

type Msg = Roll | NewDice Dice | NewFace Int

init : () -> (Model, Cmd Msg)
init _ = 
    ( Model D6 1
    , Cmd.none
    )