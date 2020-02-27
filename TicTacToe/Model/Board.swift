//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Divyansh Srivastava on 19/02/20.
//

import Foundation
import UIKit
struct Board {
    var player = 1
    var clickCount = 0
    var winner = Winner()
    var boardIndex = [-1, -1 , -1, -1, -1, -1, -1, -1, -1] //Stores the value of every board index the user taps on based on the value of button tag(here, button tag 0...9 acts as index)
    var value = 0
    var image = ""
    
    
    mutating func updateBoard(buttonTag: Int) ->Int{
        if(player == 1 ){
            value = 0 // For findind the winner
            player = 2 // Change the player after every click
        }
        else {
            value = 1
            player = 1
        }
        clickCount += 1
        boardIndex[buttonTag] = value
        //check for winner after every click...
        return winner.getWinner(boardIndex: boardIndex)
    }
    
    mutating func updateBoardImage() -> String{
        let buttonImage = image
        image = image == "TTTO" ? "TTTX" : "TTTO"
        return buttonImage
    }
    
}
