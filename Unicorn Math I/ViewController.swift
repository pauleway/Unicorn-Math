//
//  ViewController.swift
//  Unicorn Math I
//
//  Created by Paul Way on 10/20/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var answer:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        imageView.image = UIImage(named: "question.png")

        createNewProblem()
    }
    
    func createNewProblem() {
        // set image view to Question Mark
        imageView.image = UIImage(named: "question.png")
        
        let num1 = Int.random(in: 0...10)
        let num2 = Int.random(in: 0...10)
        
        questionLabel.text = "\(num1) * \(num2) = ?"
        
        
        answer = num1 * num2
    }

    
    
    
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let anserLabelNumber = Int(answerLabel.text!){
            answerLabel.text = answerLabel.text! + (sender.titleLabel?.text)!
        } else {
            answerLabel.text = sender.titleLabel?.text
        }
        
    }
    @IBAction func clear(_ sender: Any) {
        answerLabel.text = " "
    }
    
    @IBAction func next(_ sender: Any) {
        // Check if answering a problem or going on to next question. . .
        if answer > 0{
            // Answering a problem
            if let userAnswer = Int(answerLabel.text!){
                if answer == userAnswer{
                    answerLabel.text = " "
                    questionLabel.text = "CORRECT!"
                    answer = -100
                    print(answer)
                    imageView.image = UIImage(named: "correct")
                }
                else{
                    answerLabel.text = " "
                    imageView.image = UIImage(named: "incorrect")
                    // Create an alert message to try again -
                    let myAlert = UIAlertController(title: "TRY AGAIN", message: nil, preferredStyle: UIAlertController.Style.alert)

                    myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    self.present(myAlert, animated: true, completion: nil)
                }
            }
        }
        // Ready to go on
        else {
            createNewProblem()
        }
    }
}

