//
//  FindAnswer.swift
//  FunMaths
//
//  Created by Luca Santarelli on 02/06/2020.
//  Copyright © 2020 LucaSantarelli. All rights reserved.
//

import UIKit

class FindAnswer: UIViewController {
    
    @IBOutlet var displayTime: UILabel!
    
    var time = 30
    
    //This is the actual timer.
    var timer = Timer()
    
    
    //Keeps track of question we're at.
    //var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0 //Keeps track which button right answer is located at.
    var index:Int = 0
    var currentScore:Int = 0
    var randomNumberOne:Int = 0
    var randomNumberTwo:Int = 0
    var resultRandomNumbers:Int = 0
    var resultDivisionNumbers:Double = 0.0
    var falseNumberOne:[Int] = [0, 0, 0]
    var falseNumberTwo:[Int] = [0, 0, 0]
    var wrongAnswered:Int = 0
    var correctlyAnswered:Int = 0
    var chosenOperation:Int = 0
    var segueToDo:Int?
    var correctAnswer:Bool = false
    
    @IBOutlet var QuestionNumber: UILabel!
    
    @IBOutlet var Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        
        displayTime.text = String(time)
        //The selector is the function that will be called every 1 second increment (timeInterval) to execute something.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FindAnswer.action), userInfo: nil, repeats: true)
    }
    
    //Selector function of the timer to execute.
    @objc func action() {
        
        if (time == 0) {
            timer.invalidate()
            index = 0
            segueToDo = 1
            print("Time is up")
            let timeUp = UIAlertController(title: "TIME'S UP!!!", message: "Unfortunately your time is up. The game has ended. Press 'OK' to view your stats!", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) in
                self.performSegue(withIdentifier: "showScore", sender: self)
            }
            timeUp.addAction(confirmAction)
            present(timeUp, animated: true, completion: nil)
        }
        else {
            //Incrementing the value of the timer to display by 1 every time the function is called.
            time -= 1
            displayTime.text = String(time)
        }
    }
    
    //Outlet connected to all four answer option buttons, each w/ a different tag!
    @IBAction func optionAnswers(_ sender: Any) {
        
        //If the tag of the button is equal to the right answer.
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement)) {
            print("RIGHT")
            currentScore += 1
            correctlyAnswered += 1
            Score.text = String(currentScore)
            //Reset the timer here to the starting time
            time += 5
            correctAnswer = true
        }
        else
        {
            print("WRONG")
            currentScore -= 1
            wrongAnswered += 1
            Score.text = String(currentScore)
        }
        
        if (currentScore != 5) {
            index = 0
            newQuestion()
        }
        else
        {
            segueToDo = 1
            index = 0
            timer.invalidate()
            let timeUp = UIAlertController(title: "Congratulations!", message: "Well done on scoring 5 answers correctly. Press 'OK' to view your stats!", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) in
                self.performSegue(withIdentifier: "showScore", sender: self)
            }
            timeUp.addAction(confirmAction)
            present(timeUp, animated: true, completion: nil)
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    //NOT viewDidLoad because a crash can occur if no view has been loaded in time. This only changes the view once it appears.
    /*override func viewDidAppear(_ animated: Bool) {
        
        newQuestion()
    }*/
    
    //Function displaying new question every time
    func newQuestion() {
        //Generate a random place for the correct answer.
        rightAnswerPlacement = arc4random_uniform(4)+1
        randomNumberOne = Int.random(in: 1...30)
        randomNumberTwo = Int.random(in: 1...30)
        print("First set")
        print(randomNumberOne)
        print(randomNumberTwo)
        
        switch chosenOperation {
        case 1: //Addition
            resultRandomNumbers = randomNumberOne + randomNumberTwo
        
        case 2: //Subtraction
            resultRandomNumbers = randomNumberOne - randomNumberTwo
            
        case 3: //Multiplication
            resultRandomNumbers = randomNumberOne * randomNumberTwo
            
        default: //Division
            /*print("\nSecond set")
            while (randomNumberOne%randomNumberTwo != 0) {
                randomNumberOne = Int.random(in: 1...30)
                randomNumberTwo = Int.random(in: 1...30)
                print(randomNumberOne)
                print(randomNumberTwo)
            }*/
            resultDivisionNumbers = Double(randomNumberOne) / Double(randomNumberTwo)
            print(resultDivisionNumbers)
        }
        
        if (chosenOperation == 4) {
            QuestionNumber.text = String(format: "%.3f", resultDivisionNumbers)
        }
        else{
            QuestionNumber.text = String(resultRandomNumbers)
        }
        
        //Create a button
        var button:UIButton = UIButton()
        
        //For loop used to set up all four buttons.
        for i in 1...4 {
            //Create a button by converting the tags of the buttons to a button.
            button = view.viewWithTag(i) as! UIButton //Buttons accessed one at a time via their tags and converted to buttons to be used as buttons.
            
            //Checking which button will have the right answer and assigning the right answer to it.
            
            if (i == Int(rightAnswerPlacement)) {
                
                switch chosenOperation {
                case 1: //Addition
                    button.setTitle("\(randomNumberOne) + \(randomNumberTwo)", for: .normal)
                
                case 2: //Subtraction
                    button.setTitle("\(randomNumberOne) - \(randomNumberTwo)", for: .normal)
                    
                case 3: //Multiplication
                    button.setTitle("\(randomNumberOne) x \(randomNumberTwo)", for: .normal)
                    
                default: //Division
                    button.setTitle("\(randomNumberOne) : \(randomNumberTwo)", for: .normal)
                }
            }
            else
            {
                falseNumberOne[index] = Int.random(in: 1...30)
                falseNumberTwo[index] = Int.random(in: 1...30)
                
                switch chosenOperation {
                case 1: //Addition
                    button.setTitle("\(falseNumberOne[index]) + \(falseNumberTwo[index])", for: .normal)
                    index += 1
                
                case 2: //Subtraction
                    button.setTitle("\(falseNumberOne[index]) - \(falseNumberTwo[index])", for: .normal)
                    index += 1
                    
                case 3: //Multiplication
                    button.setTitle("\(falseNumberOne[index]) x \(falseNumberTwo[index])", for: .normal)
                    index += 1
                    
                default: //Division
                    button.setTitle("\(falseNumberOne[index]) : \(falseNumberTwo[index])", for: .normal)
                    index += 1
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segueToDo == 1)
        {
            //Checking which overwriting segue to perform.
            /*Passing values to the DisplayRecycling class, of this view, to display 'how to recycle' information of identified scanned products.*/
            let receiverVC = segue.destination as! Results
            receiverVC.answeredCorrectly = correctlyAnswered
            receiverVC.answeredWrongly = wrongAnswered
            receiverVC.finalScore = currentScore
            receiverVC.chosenOperation = chosenOperation
        }
    }
}
