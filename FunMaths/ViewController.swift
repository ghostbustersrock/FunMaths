//
//  ViewController.swift
//  FunMaths
//
//  Created by Luca Santarelli on 01/06/2020.
//  Copyright © 2020 LucaSantarelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operationChosen:Int = 0
    
    @IBAction func goHome(segue: UIStoryboardSegue) {

    }
    
    @IBAction func addition(_ sender: Any) {
        operationChosen = 1
        performSegue(withIdentifier: "viewRules", sender: self)
    }
    
    @IBAction func subtraction(_ sender: Any) {
        operationChosen = 2
        performSegue(withIdentifier: "viewRules", sender: self)
    }
    
    @IBAction func multiplication(_ sender: Any) {
        operationChosen = 3
        performSegue(withIdentifier: "viewRules", sender: self)
    }
    
    @IBAction func division(_ sender: Any) {
        operationChosen = 4
        performSegue(withIdentifier: "viewRules", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverVC = segue.destination as! DisplayRules
        receiverVC.operationChosen = operationChosen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

