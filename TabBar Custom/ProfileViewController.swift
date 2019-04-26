//
//  ProfileViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 25/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var firstNameTextInput: UITextField!
    @IBOutlet weak var middleNameTextInput: UITextField!
    @IBOutlet weak var lastNameTextInput: UITextField!
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextInput.text = ""
        middleNameTextInput.text = ""
        lastNameTextInput.text = ""

        // Do any additional setup after loading the view.
        submitButton.layer.cornerRadius = 10
        submitButton.clipsToBounds = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitButtonName(_ sender: UIButton) {
        firstName = firstNameTextInput.text!
        middleName = middleNameTextInput.text!
        lastName = lastNameTextInput.text!
    }
}
