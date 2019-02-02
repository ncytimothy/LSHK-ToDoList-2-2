//
//  ToDoListViewController.swift
//  ToDoListStarter
//
//  Created by Tim Ng on 2/2/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    // 1. Create a cellId constant
    let cellId = "cellId"
  
    // 2. Create an array for Tasks
    var tasks: [Task] = []
    
//-----------------------------------------------
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1. Set up navigation bar

        // 2. Register Cell for TableView
        
    }
    
    private func setUpNavBar() {
        navigationItem.title = "Tasks"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
    }
    
//-----------------------------------------------
    // MARK: UITableView Delegate Methods (Data Source and Delegate)

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
//-----------------------------------------------
    // MARK: Actions
    
    @objc func handleAddTask() {
      
        
    }
//-----------------------------------------------
    // MARK: Helpers
    
    // Should very well use custom delegation
    func configureTask(cell: TaskCell) {
        let alert = UIAlertController(title: "Add a new task", message: "What do you need to work on?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            guard let taskName = alert.textFields?[0].text else { return }
            
            let trimmedString = taskName.trimmingCharacters(in: .whitespaces)
        
        }
    }
}

extension UIColor {
    
    static let divisor: CGFloat = 255
    
    // 208, 48, 32
    static let defaultRed = UIColor.rgb(red: 220, green: 81, blue: 44)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}

