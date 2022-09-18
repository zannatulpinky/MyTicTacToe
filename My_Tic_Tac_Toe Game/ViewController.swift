//
//  ViewController.swift
//  My_Tic_Tac_Toe Game
//
//  Created by Zannatul Pinky on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {
    
    //Take enumeration so we can use easily true or false
    enum Turn {
        case CROSS
        case NAUGHT
    }
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    @IBOutlet weak var turnLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var crossLable = "x"
    var naughtLable = "o"
    
    var currentTurn = Turn.CROSS
    
    var playBoard = [UIButton]()//Buttons array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayBoard()// Call initialize board
        
    }
    //Initialize the play Board
    func initPlayBoard() {
        playBoard.append(a1)
        playBoard.append(a2)
        playBoard.append(a3)
        playBoard.append(b1)
        playBoard.append(b2)
        playBoard.append(b3)
        playBoard.append(c1)
        playBoard.append(c2)
        playBoard.append(c3)
    }
    
    //For checking play board full or not
    func checkingPlayBoardForFull() -> Bool {
        for btn in playBoard {
            if btn.title(for: .normal) == nil {
                return false
            }
        }
        
      return true
    }
    
    //For reset playBoard
    func resetPlayBoard() {
        for btn in playBoard {
            btn.configuration = .plain()
            btn.setTitle(nil, for: .normal)
        }
        currentTurn = Turn.CROSS
        turnLable.text = crossLable
    }
    
    
    @IBAction func clickBtn(_ sender: UIButton)
    {
        handleClick(sender)
        if(checkingPlayBoardForFull()){
          //print ("Tie")   // When whole board full it shows Tie
            resultAleart(message: "Tie")
        }
    }
    
    //for alert message
    func resultAleart(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .cancel,handler: { UIAlertAction in
            self.resetPlayBoard()
        }))
        self.present(alert, animated: true)
    }
    
    //This function for all buttons activities
    func handleClick(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            
            if currentTurn == Turn.CROSS {
                sender.setTitle(crossLable, for: .normal)
                currentTurn = Turn.NAUGHT
                turnLable.text = naughtLable
                
            }else if currentTurn == Turn.NAUGHT {
                    sender.setTitle(naughtLable, for: .normal)
                    currentTurn = Turn.CROSS
                    turnLable.text = crossLable            }
        }
    }
}

