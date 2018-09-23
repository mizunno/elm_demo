module Main exposing (..)

import Model exposing (..)
import Subscriptions
import Update
import View
import Browser


main = 
    Browser.element 
        { init = Model.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }


