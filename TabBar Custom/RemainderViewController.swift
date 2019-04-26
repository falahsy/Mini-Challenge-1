//
//  RemainderViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 25/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

struct TimeReminderStruct {
    var time: String = ""
    var isCheck: Bool = false
}

class RemainderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timeReminderList = [TimeReminderStruct]()
    let cellReuseIdentifier = "timeRimenderCell"
    
    @IBOutlet weak var timeReminderTableView: UITableView!
    @IBOutlet weak var reminderSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let breakfast = TimeReminderStruct(time: "Breakfast", isCheck: false)
        let lunch = TimeReminderStruct(time: "Lunch", isCheck: false)
        let dinner = TimeReminderStruct(time: "Dinner", isCheck: false)
        timeReminderList.append(breakfast)
        timeReminderList.append(lunch)
        timeReminderList.append(dinner)

        if reminderSwitch.isOn {
            timeReminderTableView.isHidden = false
        } else {
            timeReminderTableView.isEditing = true
        }
        
        // Do any additional setup after loading the view.
        self.timeReminderTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        timeReminderTableView.delegate = self
        timeReminderTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeReminderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.timeReminderList[indexPath.row].time
        
        if timeReminderList[indexPath.row].isCheck == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    @IBAction func reminderSwitch(_ sender: UISwitch) {
        if sender.isOn {
            timeReminderTableView.isHidden = false
        } else {
            timeReminderTableView.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        timeReminderList[indexPath.row].isCheck = !timeReminderList[indexPath.row].isCheck
        
        self.timeReminderTableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
