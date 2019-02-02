//
//  Task.swift
//  ToDoList
//
//  Created by Tim Ng on 2/2/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import Foundation

struct Task {
    let taskName: String
    var hasCompleted: Bool
    
    init(taskName: String, hasCompleted: Bool) {
        self.taskName = taskName
        self.hasCompleted = hasCompleted
    }
}
