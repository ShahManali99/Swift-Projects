//
//  ViewController.swift
//  Project2
//
//  Created by Shah Manali on 11/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var ct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " Score: " + String(score)
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String!
        var message: String = ""
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong"
            message = "Correct answer is Flag: \(correctAnswer+1)"
        }
        ct+=1
        let ac = UIAlertController(title: title, message:  "Your score is \(score).  \(message)" , preferredStyle: .alert)
        if ct == 10 {
            ac.addAction(UIAlertAction(title: "End", style: .destructive))
        }
        else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
    }
    
}

