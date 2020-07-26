//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Amey Viney on 7/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalResult: UILabel!
    @IBOutlet weak var finalResultView: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    var error = "nil"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalResult.text = result
        finalResultView.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
