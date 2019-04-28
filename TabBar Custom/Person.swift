//
//  Person.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 28/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var nickName: String = "Mr/s. Plastic Warrior"
    
    @objc dynamic var bottleUsage: Int = 0
    @objc dynamic var cupUsage: Int = 0
    @objc dynamic var bagUsage: Int = 0
    @objc dynamic var foodPackaging: Int = 0
    @objc dynamic var spoonUsage: Int = 0
    @objc dynamic var strawUsage: Int = 0
    @objc dynamic var cigaretteUsage: Int = 0
    @objc dynamic var totalUsage: Int = 0
    @objc dynamic var limitUsageGoal: Int = 0
    
    /*
     usageArray Index Info:
     bottleUsage -> Index 0
     cupUsage -> Index 1
     bagUsage -> Index 2
     foodPackagingUsage -> Index 3
     spoonUsage -> Index 4
     strawUsage -> Index 5
     cigaretteUsage -> Index 5
     */
}
