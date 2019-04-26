//
//  HomeViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 26/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var usageLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var plasticBottleValue: UILabel!
    @IBOutlet weak var plasticCupValue: UILabel!
    @IBOutlet weak var plasticBagValue: UILabel!
    @IBOutlet weak var foodPackagingValue: UILabel!
    @IBOutlet weak var plasticSpoonValue: UILabel!
    @IBOutlet weak var strawValue: UILabel!
    @IBOutlet weak var cigaretteButtValue: UILabel!
    
    var usageValue = Int()
    var limitValue = Int()
    
    var plasticBottleValueContainer = Int()
    var plasticCupValueContainer = Int()
    var plasticBagValueContainer = Int()
    var foodPackagingValueContainer = Int()
    var plasticSpoonValueContainer = Int()
    var strawValueContainer = Int()
    var cigaretteButtValueContainer = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func calculateUsage()-> Int {
        return plasticBottleValueContainer + plasticCupValueContainer + plasticBagValueContainer + foodPackagingValueContainer + plasticSpoonValueContainer + strawValueContainer + cigaretteButtValueContainer
    }
    
    @IBAction func plasticBottleStepper(_ sender: UIStepper) {
        plasticBottleValueContainer = Int(sender.value)
        plasticBottleValue.text = String(plasticBottleValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticCupStepper(_ sender: UIStepper) {
        plasticCupValueContainer = Int(sender.value)
        plasticCupValue.text = String(plasticCupValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticBagStepper(_ sender: UIStepper) {
        plasticBagValueContainer = Int(sender.value)
        plasticBagValue.text = String(plasticBagValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func foodPackagingStepper(_ sender: UIStepper) {
        foodPackagingValueContainer = Int(sender.value)
        foodPackagingValue.text = String(foodPackagingValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticSpoonStepper(_ sender: UIStepper) {
        plasticSpoonValueContainer = Int(sender.value)
        plasticSpoonValue.text = String(plasticSpoonValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func strawStepper(_ sender: UIStepper) {
        strawValueContainer = Int(sender.value)
        strawValue.text = String(strawValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func cigaretteButtStepper(_ sender: UIStepper) {
        cigaretteButtValueContainer = Int(sender.value)
        cigaretteButtValue.text = String(cigaretteButtValueContainer)
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    
    
}
