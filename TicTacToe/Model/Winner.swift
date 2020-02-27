//
//  Winner.swift
//  TicTacToe
//
//  Created by Divyansh Srivastava on 20/02/20.
//

import Foundation
import UIKit
struct Winner {
    var flag = -1
    
    mutating func getWinner(boardIndex: [Int]) -> Int{
        //for checking all the horizontal rows
        for i in stride(from: 0, to: 7, by: 3){
            if(boardIndex[i] != -1 && boardIndex[i] == boardIndex[i+1] && boardIndex[i] == boardIndex[i+2]){
                flag = boardIndex[i]
                break
            }
        }
        //for checking all the vertical columns
        for i in 0...2{
            if(boardIndex[i] != -1 && boardIndex[i] == boardIndex[i+3] && boardIndex[i+6] == boardIndex[i]){
                flag = boardIndex[i]
                break
            }
        }
        //for checking the diagonals
        if(boardIndex[0] == boardIndex[4] && boardIndex[0] == boardIndex[8]){
            flag = boardIndex[0]
        }
        if(boardIndex[2] == boardIndex[4] && boardIndex[2] == boardIndex[6]){
            flag = boardIndex[2]
        }
    return flag
    }
    
}
