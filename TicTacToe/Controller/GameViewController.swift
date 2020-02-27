//
//  ViewController.swift
//  TicTacToe

import UIKit

class GameViewController: UIViewController {

    var ticTacToeBoard = Board()
    var winner = Winner()
    var buttonArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateAlertForImageSelection(message: "Select your choice...")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        buttonArray.append(sender)
        //All 9 button tags are initialized from 0...9 to maintain the board index
        let result = ticTacToeBoard.updateBoard(buttonTag: sender.tag)
        sender.setBackgroundImage(UIImage(named: ticTacToeBoard.updateBoardImage()), for: UIControl.State.normal)
        displayresult(flag: result)
        sender.isEnabled = false
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        resetGame()
        viewDidAppear(true) //for showing imageSelection alert box for new game
    }
    
    func resetGame() {
        for i in 0..<buttonArray.count{
                buttonArray[i].setBackgroundImage(nil, for: UIControl.State.normal)
                buttonArray[i].isEnabled = true
        }
        ticTacToeBoard.boardIndex = [-1, -1 , -1, -1, -1, -1, -1, -1, -1]
        buttonArray.removeAll()
        ticTacToeBoard.clickCount = 0
        ticTacToeBoard.player = 1
        winner.flag = -1
    }
    
    func displayresult(flag: Int){
        if(flag == 0) {
            updateAlertLabel(message: "Player 1 won !!!")
        }
        if(flag == 1){
            updateAlertLabel(message: "Player 2 won !!!")
        }
        //Draw condition
        if(ticTacToeBoard.clickCount == 9 && flag == -1){
            updateAlertLabel(message: "Draw...")
        }
    }
    
    //alert box for displaying result
    func updateAlertLabel(message: String){
        let alert = UIAlertController(title: "Result:", message: message,         preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in
            self.resetGame()
            self.viewDidAppear(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //alert box for image selection
    func updateAlertForImageSelection(message: String){
        let alert = UIAlertController(title: "New Game:", message: message,         preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "O", style: UIAlertAction.Style.default, handler: { _ in
            self.ticTacToeBoard.image = "TTTO"
        }))
        alert.addAction(UIAlertAction(title: "X", style: UIAlertAction.Style.default, handler: { _ in
            self.ticTacToeBoard.image = "TTTX"
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
