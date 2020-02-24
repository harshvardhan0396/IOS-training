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
    var boardIndex = [-1, -1 , -1, -1, -1, -1, -1, -1, -1]
    var value = 0
    var image = ""
    
    
    mutating func updateBoard(buttonTag: Int) ->Int{
        if(player == 1 ){
            value = 0
            player = 2
            clickCount += 1
        }
        else {
            value = 1
            player = 1
            clickCount += 1
        }
        boardIndex[buttonTag] = value
        return winner.getWinner(boardIndex: boardIndex)
    }
    
    mutating func updateBoardImage() -> String{
        let boardImage = image
        if(image == "TTTO") {
            image = "TTTX"
        }else {
            image = "TTTO"
        }
        return boardImage
    }
    
}
