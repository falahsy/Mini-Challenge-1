//
//  HomeViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 26/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import UserNotifications

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
    
    var nickName = "Spongebob!"
    var user = Person()
    
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
        user.nickName = self.nickName
        
        greetingNameLabel.text = "Hello,\n\(user.nickName)"
    }
    
    func calculateUsage()-> Int {
        var total = 0
        for item in user.plasticUsage {
            total += item
        }
        return total
    }
    
    @IBAction func plasticBottleStepper(_ sender: UIStepper) {
        user.plasticUsage[0] = Int(sender.value)
        plasticBottleValue.text = String(user.plasticUsage[0])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticCupStepper(_ sender: UIStepper) {
        user.plasticUsage[1] = Int(sender.value)
        plasticCupValue.text = String(user.plasticUsage[1])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticBagStepper(_ sender: UIStepper) {
        user.plasticUsage[2] = Int(sender.value)
        plasticBagValue.text = String(user.plasticUsage[2])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func foodPackagingStepper(_ sender: UIStepper) {
        user.plasticUsage[3] = Int(sender.value)
        foodPackagingValue.text = String(user.plasticUsage[3])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func plasticSpoonStepper(_ sender: UIStepper) {
        user.plasticUsage[4] = Int(sender.value)
        plasticSpoonValue.text = String(user.plasticUsage[4])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func strawStepper(_ sender: UIStepper) {
        user.plasticUsage[5] = Int(sender.value)
        strawValue.text = String(user.plasticUsage[5])
        
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
    }
    
    @IBAction func cigaretteButtStepper(_ sender: UIStepper) {
        user.plasticUsage[6] = Int(sender.value)
        cigaretteButtValue.text = String(user.plasticUsage[6])
        usageValue = calculateUsage()
        usageLabel.text = String(usageValue)
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
