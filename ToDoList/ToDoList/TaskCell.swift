//
//  TaskCell.swift
//  ToDoList
//
//  Created by Tim Ng on 1/29/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
//    var link:
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        
        let checkButton = UIButton(type: .system)
        
        checkButton.setImage(UIImage(named: "check_selected"), for: .normal)
        checkButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        checkButton.tintColor = .lightGray
        checkButton.addTarget(self, action: #selector(handleTaskCheck), for: .touchUpInside)
        
        accessoryView = checkButton
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTaskCheck() {
        print("Marking task as checked")
        
    }
    
    
}
