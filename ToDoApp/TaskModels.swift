//
//  TaskModels.swift
//  ToDoApp
//
//  Created by Ghost Buster on 3/3/26.
//

/// this file is gonna be the brain of our app
///

import Foundation

struct TaskItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var symbolName: String
    var tasks: [TaskItem]
    
}

// Mock data
extension TaskGroup {
    static let sampleData: [TaskGroup] = [
        
        TaskGroup (title: "School", symbolName: "book.fill", tasks: [
            TaskItem(title: "Grade Assignment"),
            
            TaskItem(title: "Prepare Lecture")]),
            TaskGroup(title: "Home", symbolName:"house.fill", tasks:
                        [TaskItem(title: "Buy groceries"),
                      TaskItem(title: "Cook dinner")])
        ]
    
        
    }

