//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    var tip = 0.10
    var people = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    }
    @IBAction func tipSelected(_ sender: UIButton) {
          billLabel.endEditing(true)
          zeroButton.isSelected = false
          tenButton.isSelected = false
          twentyButton.isSelected = false
          sender.isSelected = true
          
          let buttonTitle = sender.currentTitle!
          let buttonTitleMinusPercent = String(buttonTitle.dropLast())
          let buttonTitleAsNumber = Double(buttonTitleMinusPercent)!
          tip = buttonTitleAsNumber / 100
      }

    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billLabel.text!
        if bill != ""{
            billTotal = Double(bill)!
            let result = billTotal * (1+tip) / Double(people)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        else{
            finalResult = "Enter Bill Total"
        }
         self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
           if segue.identifier == "goToResult"{
               let destinationVC = segue.destination as! ResultViewController
               destinationVC.result = finalResult
               destinationVC.tip = Int(tip*100)
               destinationVC.split = people
            destinationVC.error = finalResult

       }
   }

}
