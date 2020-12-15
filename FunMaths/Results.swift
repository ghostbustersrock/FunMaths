//
//  Results.swift
//  FunMaths
//
//  Created by Luca Santarelli on 05/06/2020.
//  Copyright © 2020 LucaSantarelli. All rights reserved.
//

import UIKit

class Results: UIViewController {

    var answeredCorrectly:Int = 0
    var answeredWrongly:Int = 0
    var finalScore:Int = 0
    var chosenOperation: Int = 0
    
    @IBOutlet var correct: UILabel!
    @IBOutlet var wrong: UILabel!
    @IBOutlet var totalScore: UILabel!
    @IBOutlet var displayText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correct.text = "Correct: \(answeredCorrectly)"
        wrong.text = "Wrong: \(answeredWrongly)"
        totalScore.text = "Total score: \(finalScore)"
        
        if (chosenOperation == 1) { //Addition
            displayText.text = "You've completed the addition section with the following stats:"
        }
        else if (chosenOperation == 2) { //Subtraction
            displayText.text = "You've completed the subtraction section with the following stats:"
        }
        else if (chosenOperation == 3) { //Multiplication
            displayText.text = "You've completed the multiplication section with the following stats:"
        }
        else { //Division
            displayText.text = "You've completed the division section with the following stats:"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
