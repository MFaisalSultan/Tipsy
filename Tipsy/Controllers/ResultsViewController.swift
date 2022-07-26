//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mbp on 21/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
        
    var billAmount : String?
    var numberOfPeople : Int?
    var tipAmount : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billAmount
        settingsLabel.text = "Split between \(numberOfPeople!) people, with  \( String(format: "%.0f", tipAmount! * 100) ) % tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
