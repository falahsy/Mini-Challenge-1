//
//  HomeViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 26/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift
import SCLAlertView

class HomeViewController: UIViewController {

    @IBOutlet weak var greetingNameLabel: UILabel!
    @IBOutlet weak var usageLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    
    @IBOutlet weak var plasticBottleValue: UILabel!
    @IBOutlet weak var plasticCupValue: UILabel!
    @IBOutlet weak var plasticBagValue: UILabel!
    @IBOutlet weak var foodPackagingValue: UILabel!
    @IBOutlet weak var plasticSpoonValue: UILabel!
    @IBOutlet weak var strawValue: UILabel!
    @IBOutlet weak var cigaretteButtValue: UILabel!
    
    // Variable to store value plastics usage
    var usageValue = Int()
    var limitValue = Int()
    var plasticBottleValueContainer = Int()
    var plasticCupValueContainer = Int()
    var plasticBagValueContainer = Int()
    var foodPackagingValueContainer = Int()
    var plasticSpoonValueContainer = Int()
    var strawValueContainer = Int()
    var cigaretteButtValueContainer = Int()
    
    let content = UNMutableNotificationContent()
    let formatter = DateFormatter()
    var dateComponents = DateComponents()
    
    // HArcode untuk test Notification
    let limit = 5
    let usage = 7
    let usageLimit = 11
    let noPlastic = true
    
    var user = Person()
    let database = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if Int(usageLabel.text!)! > limit {
//            notifikasiAlmostLimit()
//        }
//        } else if noPlastic == false{
//            notifikasiNoPlastic()
//        } else if usageLimit < limit{
//            notifikasiOverLimit()
//        }
        
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL)

        
//        try! database.write {
//            database.deleteAll()
//        }
        
        if database.objects(Person.self).count == 0 {
            let alert = SCLAlertView()
            let nickNameTextField = alert.addTextField("Enter nickname")
            let limitUsageTextField = alert.addTextField("Enter limit Usage")
            alert.addButton("Set") {
                if nickNameTextField.text != nil &&  limitUsageTextField.text != nil {
                    try! self.database.write {
                        self.database.add(self.user)
                        self.user.nickName = nickNameTextField.text!
                        self.user.limitUsageGoal = Int(limitUsageTextField.text!)!
                        
                        self.greetingNameLabel.text = "Hello,\n\(self.user.nickName)"
                        self.limitLabel.text = String(self.user.limitUsageGoal)
                    }
                }
            }
            alert.showEdit("Alert", subTitle: "Set Your Nickname and Limit Plastic Usage per Day")
        } else {
            user = database.objects(Person.self)[0]
            greetingNameLabel.text = "Hello,\n\(self.user.nickName)"
            usageLabel.text = String(user.totalUsage)
            limitLabel.text = String(user.limitUsageGoal)
            plasticBottleValue.text = String(user.bottleUsage)
            plasticCupValue.text = String(user.cupUsage)
            plasticBagValue.text = String(user.bagUsage)
            foodPackagingValue.text = String(user.foodPackaging)
            plasticSpoonValue.text = String(user.spoonUsage)
            strawValue.text = String(user.strawUsage)
            cigaretteButtValue.text = String(user.cigaretteUsage)
        }
        
    }
    
    func calculateUsage()-> Int {
        return user.bottleUsage + user.cupUsage + user.bagUsage + user.foodPackaging + user.spoonUsage + user.strawUsage + user.cigaretteUsage
    }
    
    @IBAction func plasticBottleStepper(_ sender: UIStepper) {
        try! database.write {
            user.bottleUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        plasticBottleValue.text = String(user.bottleUsage)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func plasticCupStepper(_ sender: UIStepper) {
        try! database.write {
            user.cupUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        plasticCupValue.text = String(user.cupUsage)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func plasticBagStepper(_ sender: UIStepper) {
        try! database.write {
            user.bagUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        plasticBagValue.text = String(user.bagUsage)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func foodPackagingStepper(_ sender: UIStepper) {
        try! database.write {
            user.foodPackaging = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        foodPackagingValue.text = String(user.foodPackaging)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func plasticSpoonStepper(_ sender: UIStepper) {
        try! database.write {
            user.spoonUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        plasticSpoonValue.text = String(user.spoonUsage)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func strawStepper(_ sender: UIStepper) {
        try! database.write {
            user.strawUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        strawValue.text = String(user.strawUsage)
        usageLabel.text = String(user.totalUsage)
    }
    
    @IBAction func cigaretteButtStepper(_ sender: UIStepper) {
        try! database.write {
            user.cigaretteUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        
        cigaretteButtValue.text = String(user.cigaretteUsage)
        usageLabel.text = String(user.totalUsage)
    }
    

    // -- Notification Function Start --
    func notifikasiAlmostLimit(){
        content.title = "Congratulations!🎉"
        content.body = "Cie congrats!"
        content.sound = UNNotificationSound.default
        let date = Date(timeIntervalSinceNow: 3)
        //        dateComponents.hour = 16
        //        dateComponents.minute = 36
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: trigger, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger1)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func notifikasiNoPlastic(){
        content.title = "You're the best!😎"
        content.body = "Cie congrats!"
        content.sound = UNNotificationSound.default
        
        dateComponents.hour = 16
        dateComponents.minute = 35
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func notifikasiOverLimit(){
        content.title = "You can do better than this☹️"
        content.body = "cupu u"
        content.sound = UNNotificationSound.default
        
        dateComponents.hour = 16
        dateComponents.minute = 37
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
