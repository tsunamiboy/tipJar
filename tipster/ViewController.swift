//
//  ViewController.swift
//  tipster
//
//  Created by David Blake on 9/23/16.
//  Copyright © 2016 Sea Turtle Dreams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var billedField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipCalculatedLabel: UILabel!
    @IBOutlet weak var totalCalculatedLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    let tipArray = [0.10, 0.15, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billedAmount(_ sender: AnyObject) {
        let amountOwed = Double(billedField.text!) ?? 0
        let calculatedTip = amountOwed * tipArray[tipSelector.selectedSegmentIndex]
        let calculatedTotal = amountOwed + calculatedTip
        
        percentageLabel.text = "\(tipArray[tipSelector.selectedSegmentIndex])"
        tipCalculatedLabel.text = String(format: "$%.2f", calculatedTip)
//        print("calculated Tip = " + String(format: "$%.2f", calculatedTip))
        totalCalculatedLabel.text = String(format: "$%.2f", calculatedTotal)
        
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    


}

