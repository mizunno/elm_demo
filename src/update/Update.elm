module Update exposing (..)

import Model exposing (..)
import Random

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Model.Roll ->
            rollDice model
        Model.NewDice dice->
            newDice dice model
        NewFace newFace ->
            ( Model model.dice newFace, Cmd.none)

rollDice : Model -> ( Model, Cmd Msg )
rollDice model =
    let 
        diceNumber =
            if model.dice == D6 then
                6
            else if model.dice == D8 then
                8
            else 
                20
    in 
        ( model, Random.generate NewFace (Random.int 1 diceNumber) )

newDice : Dice -> Model -> ( Model, Cmd Msg )
newDice d model =
    ( { model | dice = d, diceFace = 1 }, Cmd.none )