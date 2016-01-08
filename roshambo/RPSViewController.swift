//
//  ViewController.swift
//  roshambo
//
//  Created by gakshay on 1/7/16.
//  Copyright © 2016 gakshay. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    // Pragrammtic Approach
    
    @IBAction func playRock(sender: UIButton){
        let rc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        rc.userChoice = getUserChoiceShape(sender)
        self.presentViewController(rc, animated: true, completion: nil)
        
    }
    
    // Segue with Code
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let rc = segue.destinationViewController as! ResultViewController
            rc.userChoice = getUserChoiceShape(sender as! UIButton)
        }
    }
    
    func getUserChoiceShape(sender: UIButton) -> Shape {
        let buttonTitle = sender.titleForState(.Normal)!
        return Shape(rawValue: buttonTitle)!
    }

}

