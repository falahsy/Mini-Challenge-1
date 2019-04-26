//
//  SetLimitViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 27/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

class SetLimitViewController: UIViewController {

    @IBOutlet weak var limitValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setLimitStepper(_ sender: UIStepper) {
        let limitSetValue = Int(sender.value)
        limitValueLabel.text = String(limitSetValue)
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
