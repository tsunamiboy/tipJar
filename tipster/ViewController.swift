//
//  ViewController.swift
//  tipster
//
//  Created by David Blake on 9/23/16.
//  Copyright © 2016 Sea Turtle Dreams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tipSelection: UIPickerView!
    @IBOutlet weak var billedField: UITextField!
//    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipCalculatedLabel: UILabel!
    @IBOutlet weak var totalCalculatedLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipDbls.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(tipDbls[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipFactor = tipDbls[row]
        tipLabel = tipStr[row]
    }
    
    let tipDbls = [0.1,0.12,0.15,0.18,0.2,0.22]
    let tipStr = [".1",".12",".15",".18",".2",".22"]
    var tipFactor: Double = 0
    var tipLabel: String = "eh"

    
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
        print("tipFactor is: \(tipFactor)")
        let calculatedTip = amountOwed * tipFactor
        let calculatedTotal = amountOwed + calculatedTip
        percentageLabel.text = tipLabel
        tipCalculatedLabel.text = String(format: "$%.2f", calculatedTip)
        print("calculated Tip = " + String(format: "$%.2f", calculatedTip))
        totalCalculatedLabel.text = String(format: "$%.2f", calculatedTotal)
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    


}

