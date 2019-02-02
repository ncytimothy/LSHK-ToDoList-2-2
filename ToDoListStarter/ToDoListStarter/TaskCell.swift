//
//  TaskCell.swift
//  ToDoListStarter
//
//  Created by Tim Ng on 2/2/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    // This is not the best way to do it, but will do for our MVP
    var link: ToDoListViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let checkButton = UIButton(type: .system)
        
        accessoryView = checkButton
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTaskCheck() {
        print("Marking task as checked")
        link?.configureTask(cell: self)
    }
    
    
}
