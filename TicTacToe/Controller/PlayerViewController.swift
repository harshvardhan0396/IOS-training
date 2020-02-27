//  PlayerViewController.swift
//  TicTacToe
//
//  Created by Divyansh Srivastava on 25/02/20.

import UIKit
class PlayerViewController: UIViewController {
    var playerOne = ""
    var playerTwo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.selectPlayerAlertBox()
    }
    
    func selectPlayerAlertBox(){
        let alert = UIAlertController(title: "Player Detail:", message: "Enter Player names...", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Player 1"
        }
        alert.addTextField { (textField1) in
            textField1.text = ""
            textField1.placeholder = "Player 2"
        }
        alert.addAction(UIAlertAction(title: "ENTER", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let textField1 = alert?.textFields![1]
            self.playerOne = textField?.text ?? "player1"
            self.playerTwo = textField1?.text ?? "player2"
            self.performSegue(withIdentifier: "PressEnterToPlay", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let p = Player(playerOne: playerOne, playerTwo: playerTwo)
        p.printThis()
        let destinationVC = segue.destination as! ViewController
        destinationVC.player = p
    }

}
