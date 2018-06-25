//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Adam Moore on 3/16/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputGuess: UITextField!
    
    @IBOutlet weak var answerEvaluationLabel: UILabel!
    
    var fingersHeldUp = 0
    
    func newRoundOfFingers() {
        fingersHeldUp = Int(arc4random_uniform(6))
    }
    
    func compareGuessWithFingers() {
        
        if let guess = Int(inputGuess.text!){
            if fingersHeldUp == guess {
                answerEvaluationLabel.text = "You're right!"
            } else if guess >= 0 && guess <= 5 {
                answerEvaluationLabel.text = "No, I had \(fingersHeldUp) fingers up."
            } else {
                answerEvaluationLabel.text = "Your guess has to be between 0 and 5."
            }
        } else if !inputGuess.text!.isEmpty {
            answerEvaluationLabel.text = "You have to guess a number."
        } else {
            answerEvaluationLabel.text = "You have to guess first!"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRoundOfFingers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        compareGuessWithFingers()
        newRoundOfFingers()
    }

}

