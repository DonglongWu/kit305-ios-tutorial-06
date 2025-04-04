//
//  ViewController.swift
//  NumberGuess
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var firstResponseLabel: UILabel!
    @IBOutlet weak var secondResponseLabel: UILabel!

    // some member variables for the game
    var secretNumber:Int = 50
    var guessCount:Int = 0
    let maxGuesses: Int = 0
    var gameOver: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        if gameOver {
            print("Game is over. No more guesses allowed.")
            firstResponseLabel.text = "Game Over! Tap Reset to play again."
            return
        }
        if let enteredGuess:Int = Int(guessField.text!)
        {
            print("Guess Entered");
            print(enteredGuess);
            
            if enteredGuess > secretNumber
            {
                firstResponseLabel.text = "Too high - try again!"
            }
            else if enteredGuess < secretNumber
            {
                firstResponseLabel.text = "Too low - try again!"
            }
            
            if enteredGuess == secretNumber {
                
                // Create an alert for correct guess
                let alert = UIAlertController(
                    title: "Correct!",
                    message: "You guessed in \(guessCount) tries!",
                    preferredStyle: .alert)
                            
                alert.addAction(UIAlertAction(
                    title: "Cool!",
                    style: .cancel,
                    handler: nil))
                            
                self.present(alert, animated: true, completion: nil)

                // Set labels and flags
                firstResponseLabel.text = " You got it!"
                secondResponseLabel.text = "Tap Reset to play again."
                gameOver = true
            } else {
                guessCount += 1
                tryCountLabel.text = String(guessCount)
            }
        }
        else
        {
            print("No guess entered");
        }
        
        guessField.text = ""
       
    }
    @IBAction func resetTapped(_ sender: UIButton)
    {
        resetGame()
    }
    
    func resetGame()
    {
        print("The game has been reset...")
        
        secretNumber = 50
        print("The secret number is \(secretNumber)")
        guessCount = 1
        
        tryCountLabel.text = String(guessCount)
        firstResponseLabel.text = ""
        secondResponseLabel.text = ""
        guessField.text = ""
    }
}

