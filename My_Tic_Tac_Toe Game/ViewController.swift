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
    
    var showResultForCross = 0
    var showResultForNaught = 0
    
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
    
    //To check the winners
    func checkForWinningResult(_ s:String)-> Bool {
        
        if forCheckingBtn(a1, s) && forCheckingBtn(a2, s) && forCheckingBtn(a3, s){
            return true
        }
        else if forCheckingBtn(a1, s) && forCheckingBtn(b2, s) && forCheckingBtn(c3, s){
            return true
        }
        else if forCheckingBtn(a1, s) && forCheckingBtn(b1, s) && forCheckingBtn(c1, s){
            return true
        }
        
        
        if forCheckingBtn(b1, s) && forCheckingBtn(b2, s) && forCheckingBtn(b3, s){
            return true
        }
        else if forCheckingBtn(a2, s) && forCheckingBtn(b2, s) && forCheckingBtn(c2, s){
            return true
        }
    
        
        if forCheckingBtn(c1, s) && forCheckingBtn(c2, s) && forCheckingBtn(c3, s){
            return true
        }
        else if forCheckingBtn(c1, s) && forCheckingBtn(b2, s) && forCheckingBtn(a3, s){
            return true
        }
        else if forCheckingBtn(a3, s) && forCheckingBtn(b3, s) && forCheckingBtn(c3, s){
            return true
        }
        return false
    }
    
    // for check button title and string
    func forCheckingBtn(_ button:UIButton,_ s:String) -> Bool {
        return button.title(for: .normal) == s
    }
    
    
    @IBAction func clickBtn(_ sender: UIButton)
    {
        handleClick(sender)
       
        if checkForWinningResult(crossLable){
            resultAleart(message: "Cross is Win")
            showResultForCross += 1
            scoreLabel.text = "Cross Score : \(showResultForCross)\n Naught Score : \(showResultForNaught)"
        }
        
        if checkForWinningResult(naughtLable){
            resultAleart(message: "Naught is Win")
            showResultForNaught += 1
            scoreLabel.text = "Cross Score : \(showResultForCross)\n Naught Score : \(showResultForNaught)"         }
        
        if(checkingPlayBoardForFull()){
          //print ("Tie")  ........  When whole board full it shows Tie
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

