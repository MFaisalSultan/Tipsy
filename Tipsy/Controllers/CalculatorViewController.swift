//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
//import ToastSwiftFramework
import Toast

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twntyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount : Double =  0.1
    var numberOfPeople : Int = 2
    var bilTotal  = 0.0
    var resultTo2DecimalPlace = "0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twntyPcButton.isSelected = false
        
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        
        
        let removePrcntge = buttonTitle.dropLast()
        
        tipAmount =  Double(removePrcntge)! / 100
        // basic usage
        
    }
    
    @IBAction func stepperValueChnaged(_ sender: UIStepper) {
        splitNumberLabel.text =  String(sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        
        
        if bill != "" {
            bilTotal = Double(bill)!
            let result  = bilTotal * (1 + tipAmount) / Double(numberOfPeople)
            resultTo2DecimalPlace = String(format: "%.2f", result)
            self.performSegue(withIdentifier: "goToResultView", sender: self)
        }else{
            self.view.makeToast("Please add some amount",duration: 3.0, position: .top)
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultView"{
           let resultVC = segue.destination as! ResultsViewController
            resultVC.billAmount = resultTo2DecimalPlace
            resultVC.numberOfPeople = numberOfPeople
            resultVC.tipAmount = tipAmount
            
        }
    }

}

