//
//  ProfileViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 25/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import RealmSwift
import SCLAlertView

class ProfileViewController: UIViewController {

    @IBOutlet weak var firstNameTextInput: UITextField!
    
    let database = try! Realm()
    var user = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = database.objects(Person.self)[0]
        
        firstNameTextInput.text = ""

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if firstNameTextInput.text == "" {
            SCLAlertView().showInfo("Failed", subTitle: "Nick name must be filled in")
        } else {
            try! database.write {
                user.nickName = firstNameTextInput.text!
            }
            SCLAlertView().showSuccess("Congratulation!", subTitle: "New name has been set")
            self.dismiss(animated: true, completion: nil)
        }
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
