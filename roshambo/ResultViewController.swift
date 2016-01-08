//
//  ResultViewController.swift
//  roshambo
//
//  Created by gakshay on 1/7/16.
//  Copyright © 2016 gakshay. All rights reserved.
//

import Foundation
import UIKit

enum Shape: String {
    case rock = "rock"
    case paper = "paper"
    case scissor = "scissor"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["rock", "paper", "scissor"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
    
}

class ResultViewController: UIViewController {
    
    var userChoice: Shape!
    let computerChoice:Shape = Shape.randomShape()
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playGame(userChoice, computer: computerChoice)
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func playGame(user: Shape, computer: Shape){
        switch (user.rawValue, computer.rawValue) {
        case ("paper", "paper"), ("rock", "rock"), ("scissor", "scissor"):
            self.resultText.text = "It's a Tie"
            self.resultImage.image = UIImage(named: "tie")
        case ("paper", "rock"):
            self.resultText.text = "Paper covers Rock. You Won!"
            self.resultImage.image = UIImage(named: "paperCoverRock")
        case ("rock", "paper"):
            self.resultText.text = "Paper covers Rock. You lost!"
            self.resultImage.image = UIImage(named: "paperCoverRock")
            
        case ("paper", "scissor"):
            self.resultText.text = "Scissor cuts paper. You lost!"
            self.resultImage.image = UIImage(named: "scissorCutPaper")
        case ("scissor", "paper"):
            self.resultText.text = "Scissor cuts paper. You Won!"
            self.resultImage.image = UIImage(named: "scissorCutPaper")
            
        case ("scissor", "rock"):
            self.resultText.text = "Rock Cruses Scissor. You lost!"
            self.resultImage.image = UIImage(named: "rockCrushScissor")
        case ("rock", "scissor"):
            self.resultText.text = "Rock Crushes Scissor. You Won!"
            self.resultImage.image = UIImage(named: "rockCrushScissor")
        default:
            self.resultText.text = "try Again. Some error occured"
    
        }
    }
}
