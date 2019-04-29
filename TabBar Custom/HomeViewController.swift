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

class HomeViewController: UIViewController, UITextFieldDelegate {

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
    
    @IBOutlet weak var bottleStepper: UIStepper!
    @IBOutlet weak var cupStepper: UIStepper!
    @IBOutlet weak var bagStepper: UIStepper!
    @IBOutlet weak var foodPackagingStepper: UIStepper!
    @IBOutlet weak var spoonStepper: UIStepper!
    @IBOutlet weak var strawStepper: UIStepper!
    @IBOutlet weak var cigaretteStepper: UIStepper!
    
    let content = UNMutableNotificationContent()
    let formatter = DateFormatter()
    var dateComponents = DateComponents()
    
    var triggerWarningLimit: Int = 0
    
    var user = Person()
    let database = try! Realm()
    
    var limitUsageTextField = UITextField()
    
    var date = Date().description.prefix(10)
    
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientLayer()
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        try! database.write {
//            database.deleteAll()
//        }
        
        if database.objects(Person.self).count == 0 {
            let alert = SCLAlertView()
            let nickNameTextField = alert.addTextField("Enter nickname")
            limitUsageTextField = alert.addTextField("Enter limit Usage")
            
            limitUsageTextField.delegate = self
            
            alert.addButton("Set") {
                if nickNameTextField.text != nil &&  self.limitUsageTextField.text != nil && self.limitUsageTextField.text != "" && nickNameTextField.text != "" {
                    try! self.database.write {
                        self.database.add(self.user)
                        self.user.nickName = nickNameTextField.text!
                        self.user.limitUsageGoal = Int(self.limitUsageTextField.text!)!
                        self.greetingNameLabel.text = "Hello,\n\(self.user.nickName)"
                        self.limitLabel.text = String(self.user.limitUsageGoal)
                        
                        self.triggerWarningLimit = (self.user.limitUsageGoal*8)/10
                    }
                } else {
                    try! self.database.write {
                        self.database.add(self.user)
                        self.greetingNameLabel.text = "Hello,\n\(self.user.nickName)"
                        self.limitLabel.text = String(self.user.limitUsageGoal)
                        
                        self.triggerWarningLimit = (self.user.limitUsageGoal*8)/10
                    }
                }
            }
            alert.showEdit("Alert", subTitle: "Set Your Nickname and Limit Plastic Usage per Day")
        } else {
            user = database.objects(Person.self)[0]
            self.triggerWarningLimit = (self.user.limitUsageGoal*8)/10
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == limitUsageTextField {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    func checkOverLimit(){
        if self.user.totalUsage > triggerWarningLimit{
            notifikasiOverLimit()
        }
    }
    
    func checkNoPlastic(){
        if self.user.totalUsage == 0 {
            notifikasiNoPlastic()
        }
    }
    
    func checkAlmostReachLimit(){
        if self.user.totalUsage == triggerWarningLimit {
            notifikasiAlmostLimit()
        }
    }
    
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = headerView.bounds
        gradientLayer.colors = [UIColor(named: "ColorBackground1")?.cgColor, UIColor(named: "ColorBackground2")?.cgColor]
        headerView.layer.addSublayer(gradientLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        viewLoadData()
        
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
        checkAlmostReachLimit()
    }
    
    @IBAction func plasticCupStepper(_ sender: UIStepper) {
        try! database.write {
            user.cupUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        plasticCupValue.text = String(user.cupUsage)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    @IBAction func plasticBagStepper(_ sender: UIStepper) {
        try! database.write {
            user.bagUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        plasticBagValue.text = String(user.bagUsage)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    @IBAction func foodPackagingStepper(_ sender: UIStepper) {
        try! database.write {
            user.foodPackaging = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        foodPackagingValue.text = String(user.foodPackaging)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    @IBAction func plasticSpoonStepper(_ sender: UIStepper) {
        try! database.write {
            user.spoonUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        plasticSpoonValue.text = String(user.spoonUsage)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    @IBAction func strawStepper(_ sender: UIStepper) {
        try! database.write {
            user.strawUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        strawValue.text = String(user.strawUsage)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    @IBAction func cigaretteButtStepper(_ sender: UIStepper) {
        try! database.write {
            user.cigaretteUsage = Int(sender.value)
            user.totalUsage = calculateUsage()
        }
        cigaretteButtValue.text = String(user.cigaretteUsage)
        usageLabel.text = String(user.totalUsage)
        checkAlmostReachLimit()
    }
    
    // Load Data from other VC of after app was destroyed
    func viewLoadData(){
        bottleStepper.value = Double(user.bottleUsage)
        cupStepper.value = Double(user.cupUsage)
        bagStepper.value = Double(user.bagUsage)
        foodPackagingStepper.value = Double(user.foodPackaging)
        spoonStepper.value = Double(user.spoonUsage)
        strawStepper.value = Double(user.strawUsage)
        cigaretteStepper.value = Double(user.cigaretteUsage)
        
        greetingNameLabel.text = "Hello,\n\(self.user.nickName)"
        limitLabel.text = String(user.limitUsageGoal)
        usageLabel.text = String(user.totalUsage)
        limitLabel.text = String(user.limitUsageGoal)
        plasticBottleValue.text = String(user.bottleUsage)
        plasticCupValue.text = String(user.cupUsage)
        plasticBagValue.text = String(user.bagUsage)
        foodPackagingValue.text = String(user.foodPackaging)
        plasticSpoonValue.text = String(user.spoonUsage)
        strawValue.text = String(user.strawUsage)
        cigaretteButtValue.text = String(user.cigaretteUsage)
        
        self.triggerWarningLimit = (self.user.limitUsageGoal*8)/10
    }
    

    // -- Notification Function Start --
    func notifikasiAlmostLimit(){
        content.title = "Good Morning, \(user.nickName)"
        content.body = "Bravo \(user.nickName), you’ve successfully limit your plastic waste yesterday. Keep going, you’re almost there! 🙂"
        content.sound = UNNotificationSound.default
        let date = Date(timeIntervalSinceNow: 10)
        //        dateComponents.hour = 16
        //        dateComponents.minute = 36
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: trigger, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger1)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func notifikasiNoPlastic(){
        content.title = "Wonderful day, \(user.nickName)!"
        content.body = "Wow, you achieved zero plastic waste yesterday. Cheers \(user.nickName), you’re the best. ☺️"
        content.sound = UNNotificationSound.default
        let date = Date(timeIntervalSinceNow: 10)
        //        dateComponents.hour = 16
        //        dateComponents.minute = 36
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: trigger, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger1)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func notifikasiOverLimit(){
        content.title = "How’s everything going, \(user.nickName)?"
        content.body = "You’ve exceeded your plastic waste limit yesterday 🙁. Today, Don’t forget to limit your plastic waste & have a nice day!"
        content.sound = UNNotificationSound.default
        let date = Date(timeIntervalSinceNow: 10)
        //        dateComponents.hour = 16
        //        dateComponents.minute = 36
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: trigger, repeats: true)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger1)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
