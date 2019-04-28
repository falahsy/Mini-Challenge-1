//
//  SetLimitViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 27/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import SCLAlertView
import RealmSwift

class SetLimitViewController: UIViewController {

    @IBOutlet weak var limitValueLabel: UILabel!
    
    let database = try! Realm()
    var user = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        user = database.objects(Person.self)[0]
    }
    
    @IBAction func setLimitStepper(_ sender: UIStepper) {
        let limitSetValue = Int(sender.value)
        limitValueLabel.text = String(limitSetValue)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButton(_ sender: Any) {
        
        if let limitTemp = limitValueLabel.text {
            try! database.write {
                user.limitUsageGoal = Int(limitTemp)!
            }
        }
        SCLAlertView().showSuccess("Congratulation!", subTitle: "Goal has been set")
        
        self.dismiss(animated: true, completion: nil)
    }
}
