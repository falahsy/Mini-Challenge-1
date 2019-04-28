//
//  HistoryViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 28/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {

    let database = try! Realm()
    var user = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        user = database.objects(Person.self)[0]
        
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
