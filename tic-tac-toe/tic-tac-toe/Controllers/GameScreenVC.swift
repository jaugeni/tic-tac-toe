//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by YAUHENI IVANIUK on 5/29/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import UIKit

class GameScreenVC: UIViewController {
    
    @IBOutlet weak var restartBtn: UIButton!
    
    var imageName = "o"
    var boardMat = BoardMatrix(rows: 3, columns: 3)
    var checkWinner = CheckWinner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.isEnabled = false
    }
    
    func presentWinnerAlert(title: String, msg: String) {
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart Game!", style: .destructive) { (action:UIAlertAction) in
            self.restartGame()
        }
        
        let closeAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
        
        alertController.addAction(closeAction)
        alertController.addAction(restartAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func restartGame() {
        for (i, _) in boardMat.board.enumerated() {
            boardMat.board[i] = ""
            let button = view.viewWithTag(i + 1) as? UIButton
            button?.setImage(nil, for: .normal)
            button?.isEnabled = true
        }
    }
    
    @IBAction func fildButtonPressed(_ sender: UIButton) {
        
        if boardMat.board[sender.tag - 1] == "" {
            imageName == "x" ? (imageName = "o") : (imageName = "x")
            sender.setImage(UIImage(named: imageName), for: .normal)
            sender.isEnabled = false
            boardMat.board[sender.tag - 1] = imageName
        }
        
        let winnerResult = checkWinner.checkWinCombination(board: boardMat)
        
        if winnerResult.0 {
            guard let winner = winnerResult.1 else {return}
            if winner == "tie" {
                presentWinnerAlert(title: "Tie!", msg: "No winner in this game!")
            }
            presentWinnerAlert(title: "Winner!", msg: "The Winner of this game is \(winner.uppercased())!")
        }
        
        restartBtn.isEnabled = true
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        sender.shake()
        restartGame()
        restartBtn.isEnabled = false
    }
}

