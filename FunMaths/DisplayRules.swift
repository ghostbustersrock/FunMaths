//
//  DisplayRules.swift
//  FunMaths
//
//  Created by Luca Santarelli on 05/06/2020.
//  Copyright © 2020 LucaSantarelli. All rights reserved.
//

import UIKit

class DisplayRules: UIViewController {

    var operationChosen:Int?
    var segueToDo:Int?
    
    @IBOutlet var showRules: UILabel!
    
    @IBAction func beginGame(_ sender: Any) {
        segueToDo = 1
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    //MARK: ERROR HERE!!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segueToDo == 1) {
            let receiverVC = segue.destination as! FindAnswer
            receiverVC.chosenOperation = operationChosen!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch operationChosen {
        case 1: //Addition
            showRules.text = "You have ONE try to find the addition resulting in the displayed number to score 1 point. Choosing wrongly will cost you 1 point.  Score 5 points to win the game!"
        
        case 2: //Subtraction
            showRules.text = "You have ONE try to find the subtraction resulting in the displayed number to score 1 point. Choosing wrongly will cost you 1 point.  Score 5 points to win the game!"
            
        case 3: //Multiplication
            showRules.text = "You have ONE try to find the multiplication resulting in the displayed number to score 1 point. Choosing wrongly will cost you 1 point.  Score 5 points to win the game!"
            
        default: //Division
            showRules.text = "You have ONE try to find the division resulting in the displayed number to score 1 point. Choosing wrongly will cost you 1 point.  Score 5 points to win the game!"
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
