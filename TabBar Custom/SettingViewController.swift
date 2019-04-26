//
//  SettingViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 25/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingList: [String] = ["Profile", "Reminder", "Set Goals", "FAQ", "About Us"]
    
    @IBOutlet weak var tableViewSettings: UITableView!
    let cellReuseIdentifier = "settingCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableViewSettings.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableViewSettings.delegate = self
        tableViewSettings.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.settingList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

        if let tag = cell?.tag {
            if tag == 0 {
                performSegue(withIdentifier: "profileSegue", sender: self)
            } else if tag == 1 {
                performSegue(withIdentifier: "reminderSegue", sender: self)
            } else if tag == 2 {
                performSegue(withIdentifier: "setGoalSegue", sender: self)
            } else if tag == 3 {
                performSegue(withIdentifier: "faqSegue", sender: self)
            } else if tag == 4 {
                performSegue(withIdentifier: "aboutUsSegue", sender: self)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
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
