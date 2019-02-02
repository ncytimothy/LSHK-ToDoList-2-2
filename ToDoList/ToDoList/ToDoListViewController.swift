//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Tim Ng on 1/27/19.
//  Copyright © 2019 timothyng. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let cellId = "cellId"
    var tasks: [Task] = []

//-----------------------------------------------
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()

        tableView.register(TaskCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setUpNavBar() {
        navigationItem.title = "Tasks"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
       
       let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
        navigationController?.navigationBar.titleTextAttributes =  titleAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(handleAddTask))
    }
    
    
   

//-----------------------------------------------
    // MARK: UITableView Delegate Methods (Data Source and Delegate)
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        cell.textLabel?.text = tasks[indexPath.row].taskName
        cell.link = self
        return cell
    }
    
//-----------------------------------------------
    // MARK: Actions
    
    @objc func handleAddTask() {
            print("handling add task...")
            let alert = UIAlertController(title: "Add a new task", message: "What do you need to work on?", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
                guard let taskName = alert.textFields?[0].text else { return }
                
            let trimmedString = taskName.trimmingCharacters(in: .whitespaces)
                
            let task = Task(taskName: trimmedString, hasCompleted: false)
            self.tasks.append(task)
                
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addTextField()
        alert.textFields?[0].autocapitalizationType = .sentences
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
       
    }

//-----------------------------------------------
    // MARK: Helpers
    
    // Should very well use custom delegation
    func configureTask(cell: TaskCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let task = tasks[indexPath.row]
        let hasCompleted = task.hasCompleted
        let willComplete = !hasCompleted
        
        tasks[indexPath.row].hasCompleted = willComplete
        print("willComplete: \(willComplete)")
        cell.accessoryView?.tintColor = willComplete ? UIColor.defaultRed : UIColor.lightGray
        
    }
    
}

//-----------------------------------------------
// MARK: Color Extensions
extension UIColor {
    
    static let divisor: CGFloat = 255
    
    // 208, 48, 32
    static let defaultRed = UIColor.rgb(red: 220, green: 81, blue: 44)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
}
