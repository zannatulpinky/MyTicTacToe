//
//  ViewController.swift
//  My_Tic_Tac_Toe Game
//
//  Created by Zannatul Pinky on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {
    
    //Take enumeration for handleClick so we can use easily true or false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

  
    @IBAction func clickBtn(_ sender: UIButton) {
        
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

