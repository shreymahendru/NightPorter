//
//  Task.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-25.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, biWeekly, Monthly
}

struct Task{
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
